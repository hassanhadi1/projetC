pipeline {

    environment{
        DRUPAL_ENV= credentials('drupal-env')
        MS_ENV= credentials('ms-env')
        DRUPAL_TFVARS= credentials('drupal-tfvars')
        MS_TFVARS= credentials('ms-tfvars')
        KEY= credentials('key')
    }
    stages{
        stage("creation des fichiers secret"){
            steps{
                sh('cp -f $DRUPAL_ENV drupal/.env && chmod 400 drupal/.env')
                sh('cp -f $MS_ENV microservice/.env && chmod 400 microservice/.env')
                sh('cp -f $DRUPAL_TFVARS infra-drupal/config-auto.tfvars && chmod 400 infra-drupal/config-auto.tfvars')
                sh('cp -f $MS_TFVARS infra-microservice/config-auto.tfvars && chmod 400 infra-microservice/config-auto.tfvars')
                sh('cd -f $KEY infra-drupal/key.pem && chmod 400 infra-drupal/key.pem')
                sh('cd -f $KEY infra-microservice/key.pem && chmod 400 infra-microservice/key.pem')
            }
        }

        stage("deployement de drupal"){
            steps{
                sh '''
                    cd infra-drupal/
                    terraform apply --auto-approve
                '''
            }
        }
        stage("deployement de microservice"){
            steps{
                sh ''' 
                    cd infra-microservice/
                    terraform apply --auto-approve
                '''
            }
        }
    }
}