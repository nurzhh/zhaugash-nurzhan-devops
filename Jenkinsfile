pipeline {
    agent any

    environment {
        PATH+DOCKER = '/usr/local/bin'
        STUDENT_NAME = 'Nurzhan'
        STUDENT_SURNAME = 'Zhaugash'
        STUDENT_GROUP = 'IT2-2312'
        STUDENT_ID = '38387'
        IMAGE_NAME = 'zhaugash-nurzhan-devops'
        CONTAINER_NAME = 'zhaugash-nurzhan-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x app/student_app.sh scripts/*.sh tests/*.sh'
                sh './app/student_app.sh'
            }
        }

        stage('Test') {
            steps {
                sh './tests/test_app.sh'
            }
        }

        stage('Docker Build') {
            steps {
                sh '/usr/local/bin/docker build -t $IMAGE_NAME:$BUILD_NUMBER -t $IMAGE_NAME:latest .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '/usr/local/bin/docker rm -f $CONTAINER_NAME >/dev/null 2>&1 || true'
                sh '''/usr/local/bin/docker run --name $CONTAINER_NAME \
                    -e STUDENT_NAME="$STUDENT_NAME" \
                    -e STUDENT_SURNAME="$STUDENT_SURNAME" \
                    -e STUDENT_GROUP="$STUDENT_GROUP" \
                    -e STUDENT_ID="$STUDENT_ID" \
                    $IMAGE_NAME:$BUILD_NUMBER'''
                sh '/usr/local/bin/docker logs $CONTAINER_NAME'
            }
        }
    }

    post {
        always {
            sh '/usr/local/bin/docker rm -f $CONTAINER_NAME >/dev/null 2>&1 || true'
        }
        success {
            echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
            echo "Group: ${STUDENT_GROUP}"
            echo "Student ID: ${STUDENT_ID}"
            echo 'Finished: SUCCESS'
        }
    }
}
