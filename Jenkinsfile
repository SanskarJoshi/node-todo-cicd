pipeline {
    agent any
    environment {
        repository = "asia-south1-docker.pkg.dev/noted-sled-398304/test-container"
        namespace= ""
        deployment= "to-do-app-deployment"
        container=  "api"
    }

  
    // stages{
    //     stage("Code"){
    //         steps{
    //             git url: "https://github.com/LondheShubham153/node-todo-cicd.git", branch: "master"
    //         }
    //     }
    //     stage("Build & Test"){
    //         steps{
    //             sh "docker build . -t node-app-test-new"
    //         }
    //     }
    //     stage("Push to DockerHub"){
    //         steps{
    //             withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
    //                 sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
    //                 sh "docker tag node-app-test-new ${env.dockerHubUser}/node-app-test-new:latest"
    //                 sh "docker push ${env.dockerHubUser}/node-app-test-new:latest" 
    //             }
    //         }
    //     }
    //     stage("Deploy"){
    //         steps{
    //             sh "docker-compose down && docker-compose up -d"
    //         }
    //     }
    // }
    stages {
        stage('Initialize'){
            steps {
                script {
                    def dockerHome = tool 'myDocker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
    }
    stage('build') {
        steps {
              sh "docker build . -f ./Dockerfile -t ${repository}:${BUILD_NUMBER}  && docker push ${repository}:${BUILD_NUMBER}"
            }
        }
    }
}
