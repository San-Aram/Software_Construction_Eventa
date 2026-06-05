pipeline {
    agent any

    environment {
        IMAGE_NAME = "san1123/eventa-devops-app"
        TEST_CONTAINER = "eventa-jmeter-test"
        JMETER = "C:\\tools\\apache-jmeter-5.6.3\\bin\\jmeter.bat"
    }

    stages {

        stage('Verify Tools') {
            steps {
                bat 'git --version'
                bat 'docker --version'
                bat '"%JMETER%" -v'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:%BUILD_NUMBER% -t %IMAGE_NAME%:latest .'
            }
        }

        stage('Run Eventa Test Container') {
            steps {
                bat 'docker rm -f %TEST_CONTAINER% 2>nul || exit /b 0'
                bat 'docker run -d --name %TEST_CONTAINER% -p 8081:80 %IMAGE_NAME%:%BUILD_NUMBER%'
                bat 'powershell -Command "Start-Sleep -Seconds 5"'
                bat 'docker ps'
            }
        }

        stage('Run JMeter Performance Test') {
            steps {
                bat 'if exist jmeter-results rmdir /s /q jmeter-results'
                bat 'mkdir jmeter-results'
                bat '"%JMETER%" -n -t jmeter\\eventa-homepage-test.jmx -l jmeter-results\\results.jtl -e -o jmeter-results\\html'
            }
        }

        stage('Publish JMeter Report') {
            steps {
                perfReport(
                    sourceDataFiles: 'jmeter-results/results.jtl',
                    failBuildIfNoResultFile: true,
                    showTrendGraphs: true
                )
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'eventa-dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_TOKEN'
                    )
                ]) {
                    bat 'echo %DOCKER_TOKEN% | docker login -u %DOCKER_USER% --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push %IMAGE_NAME%:%BUILD_NUMBER%'
                bat 'docker push %IMAGE_NAME%:latest'
            }
        }
    }

    post {
        always {
            jiraSendBuildInfo()
            archiveArtifacts(
                artifacts: 'jmeter-results/**/*',
                allowEmptyArchive: true
            )
            bat 'docker rm -f %TEST_CONTAINER% 2>nul || exit /b 0'
            bat 'docker logout || exit /b 0'
        }
    }
}