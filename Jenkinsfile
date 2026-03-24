pipeline {
    agent any
    
    tools {
        jdk 'JDK21'
        maven 'M3'
    }
    environment {
        // 환경변수 지정
        DOCKER_IMAGE_NAME = "spring-petclinic"

        
        DOCKERHUB_CRED = credentials('dockerCredentials')
    }
    
    stages {
        stage('Git Clone'){
            steps {
                git url: 'https://github.com/shin3293/spring-petclinic.git',
                branch: 'main'
            }
        }
        stage('Maven Build'){
            steps {
                sh 'mvn clean package -Dmaven.test.failure.ignore=true'
            }
        }
        stage('Docker Image Create'){
            steps{
                echo'Docker Image Create'
                sh'''
                    docker build -t ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} .
                    docker tag ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} sinhun19/${DOCKER_IMAGE_NAME}:latest
                '''
            }
        }
        stage('Docker Hub Login'){
            steps {
                echo 'Docker Hub Login'
                sh 'echo ${DOCKERHUB_CRED_PSW} | docker login -u ${DOCKERHUB_CRED_USR} --password-stdin'
            }
        } 
        stage('Docker Image Push'){
            steps {
                echo 'Docker Image Push'
                sh '''
                docker push ${DOCKER_IMAGE_NAME}:latest
                '''
                
            }
            post {
                always {
                    sh '''
                    docker rmi -f ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}
                    docker rmi -f sinhun19/${DOCKER_IMAGE_MANE}lastest
                    '''
        }
        stage('Docker Container run'){
            steps {
                echo'Docker Container run'
                
            }
        }
    }
}
