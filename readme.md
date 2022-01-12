# Terraform job on jenkins

# Task part 2
**Step1**: Create CI CD pipeline 
- [install jenkins](
https://www.jenkins.io/doc/book/installing/linux/)
- Set up jenkins
- Sample commands:

    - Install the latest LTS version: `brew install jenkins-lts`
    - Install a specific LTS version:` brew install jenkins-lts@YOUR_VERSION`
    - Start the Jenkins service: `brew services start jenkins-lts`
    - Restart the Jenkins service: `brew services restart jenkins-lts`
    - Update the Jenkins version: `brew upgrade jenkins-lts`

1. Browse to http://localhost:8080
2. Navigate to directory to find password `/Users/amin/.jenkins/secrets/initialAdminPassword`, copy & past to login
3. Install suggested plugins
4. Install `CloudBees AWS Credentials Plugin`
5. Install `Ansible`
6. Install `terraform`
7. Creating the first administrator user
8. Set up credentials, go to `Configuration Systems` then scrol down to `Global Properties` select `ENV VAR`then add

![](/images/global.png)

9. Add terraform directory in jenkin's `Global Tool Configuration`

![](/images/terraform.png)

10. Add AWS credentials to jenkin's `global credentials`

![](/images/credentials.png)

**Step2:** Build your own Jenkins server on AWS ec2 instance
1. configure/install  Terraform plugins to run Terraform script to launch AWS services
2. launch 2 ec2 instances for app and db, create VPC, public and private subnets with relevant security groups for app and db

- Create a pipeline job
- Add pipeline script

pipeline{
    agent any
    tools {
        terraform 'terraform-11'
    }
    stages{
        stage("Git Checkout"){
            steps{
                git branch: 'main', url: 'https://github.com/ali-tm-amin/eng99_jenkins_terraform.git'
            }
        }
        stage("Terraform Init"){
            steps{
                sh 'terraform init'
            }
        }
        stage("Terraform Apply"){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}

- 

**Step3:** create a Webhook on Github to trigger first job of Terraform in Jenkins from your localhost push

**Step4:** create another job to be triggered if first job was successful

**Step5:** This job to run playbook to configure Mongodb on db ec2

**Step6:** 3rd job to run ansible playbook/s to configure nodejs with reverse proxy on app instance

**Step7:** ensure to launch node app on public ip with posts working


