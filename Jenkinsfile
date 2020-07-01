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
    
    stage('Dockerizing') {
        steps{
                sh 'sudo docker build --tag=python-app . '
         }
            }
    stage('UploadDocker'){
        steps{
               withCredentials([usernamePassword(credentialsId: 'docker_id', passwordVariable: 'DOCKER_REGISTRY_PWD', usernameVariable: 'DOCKER_REGISTRY_USER')]) {
                  sh 'docker login -u=$DOCKER_REGISTRY_USER -p=$DOCKER_REGISTRY_PWD'
                  sh 'docker tag python-app ayamorsi/simple-python-app'
                  sh "docker push ayamorsi/simple-python-app:latest"
        }
    } 
        }

    stage('Deploy') {
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                   sh './infrastructure/create.sh mystack infrastructure/network.yml infrastructure/params.json'
                }
            }
        }
      
    }

