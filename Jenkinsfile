pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'python3 tests/test.py'
            }
        post {
           success{
               echo "======== test success========"
        }
           failure{
               echo "======== test failed========"
        }
     }
        }
    
     stage('Deploy') {
         steps{
                sh 'docker-compose build && docker-compose -p deploy up -d '
         }
            }
        }
    }

