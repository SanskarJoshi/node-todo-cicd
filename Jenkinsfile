pipeline {
    agent any
    // environment {
    //     repository = "asia-south1-docker.pkg.dev/noted-sled-398304/test-container/todo-app-image"
       
    // }

  
    stages{
        
        stage("Build & Test"){
            steps{
                sh "docker build . -t todo-app"
            }
        }
        stage("Push to DockerHub"){
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                    sh """
                        docker login -u \${env.dockerHubUser} --password-stdin \${env.dockerHubPass} &&
                        docker tag node-app-test-new \${env.dockerHubUser}/todo-app:latest &&
                        docker push \${env.dockerHubUser}/todo-app:latest
                    """
                }
            }
        }
        stage("Deploy"){
            steps{
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
    // stages {
    //     stage('Build '){
    //         steps {
    //             script {
    //                  sh "docker build . -f ./Dockerfile -t ${repository}:${BUILD_NUMBER}  && docker push ${repository}:${BUILD_NUMBER}"
                    
    //             }
    //         }
    // }
    
    // }
}
