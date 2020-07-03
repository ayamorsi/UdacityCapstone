pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'python3 pythonApp/tests/test.py'
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
    
    stage('Dockerizing') {
        steps{
                sh 'docker build --tag=python-app . '
         }
            }
    stage('UploadDocker'){
        steps{
               withCredentials([usernamePassword(credentialsId: 'docker_id', passwordVariable: 'passwordVariable', usernameVariable: 'usernameVariable')]) {
                  sh 'docker login -u=$usernameVariable -p=$passwordVariable'
                  sh 'docker tag python-app ayamorsi/simple-python-app'
                  sh "docker push ayamorsi/simple-python-app:latest"
        }
    } 
        }

    stage('Deploy') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWSCredentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                   sh './infrastructure/create.sh mystack infrastructure/network.yml infrastructure/params.json'
                }
            }
        }
      
    }
}
