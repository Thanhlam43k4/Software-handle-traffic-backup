pipeline{
        agent any;
        environment{
            REPO_URL = 'https://github.com/Thanhlam43k4/Software-handle-traffic-backup.git'
        }
        stages{
            stage('Pulling source code'){
                steps{
                    echo 'Pulling code from GitHub ......'

                    git branch: 'main', url: REPO_URL

                    echo 'Pulling successfully................'
                }
                
            }
            stage('Sonar Analysis'){
                steps{
                    echo 'Unit test for dev development!!!'
                }
            }
            stage('Build Docker Image and push to Dockerhub'){
                steps{
                        echo 'Build Docker image in file Dockerfile'

                        echo 'Build Docker Image...'
                    }
            }
            stage('Deploy to dev development!!'){
                steps{
                    echo 'Using docker compose in dev development'
                    
                    sh 'fuser -k 80/tcp'
                    
                    sh 'docker system prune -a --volumes -f'

                    sh 'docker network create micro_net || echo "this network exist"'

                    sh 'docker compose up -d'

                    sh 'docker ps'

                }
            }
            stage ("Wait_for_testing")
            {
                steps{
                    sh 'sleep 10'
                }
                
            }
            stage('Testing Dev development'){
                steps{
                //Test Product service
                    echo 'Testing dev development...'

                    sh 'curl 192.168.56.105'
               
                    sh 'docker compose down'
               //
                }
            }
            stage('Deploy to prod development'){
                steps{
                    echo 'Deploying to Kubernetes cluster....'

                }
            }
        }
}
