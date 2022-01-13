# Terraform job on jenkins

# Task part 2
**Step1**: Create CI CD pipeline 
- [install jenkins](
https://www.jenkins.io/doc/book/installing/linux/)

1. Create jenkin agent on aws
  - install java
  - Install jenkins on ec2 instance [link to follow](https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/#install-and-configure-jenkins)
  - Open firwall `sudo ufw allow 8080`
  - 

2. Install terraform and move it to /usr/bin directory
- `sudo mv terraform /usr/bin`
- terraform --version

3. Browse to ec2_DNS_IP_Adress:8080
 Navigate to directory to find password `/Users/amin/.jenkins/secrets/initialAdminPassword`, or run `cat /var/lib/jenkins/secrets/initialAdminPassword` copy & past to login
4. Install suggested plugins

5. Install `CloudBees AWS Credentials Plugin`

6. Install `Ansible` plugins
 - Go to jenkins `Global Configurations` find `ansible` add put name and the path to ansible on the ec2 instance:
    - On the terminal `which ansible` 
    - /usr/ansible only add `/usr/` to the path on jenkins config

![](/images/jenkins_ansible.png)

7. Install `terraform` and `sudo mv terraform /usr/bin`

8. Creating the first administrator user

9. Set up credentials, go to `Configuration Systems` then scrol down to `Global Properties` select `ENV VAR`then add

![](/images/global.png)

10. Add terraform directory in jenkin's `Global Tool Configuration`

![](/images/terraform.png)

11. Add AWS credentials to jenkin's `global credentials`

![](/images/credentials.png)

12. SSH into the ec2_jenkins_instance created to download 'terraform` on it

    - Go to terraform.io, copy the link address for the amd64 Linux 
    - sudo wget https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_linux_amd64.zip
    - sudo apt install unzip
    - check if its installed ls
    - wget unzip terraform_1.1.3_linux_amd64.zip
    - check again with ll
    ![](/images/terraform_ec2_install.png)
    
13. Install ansible on ec2 instance 
 - [follow this link](https://www.ktexperts.com/how-to-install-ansible-in-amazon-linux-machine/)


**Step2:** Build your own Jenkins server on AWS ec2 instance
1. configure/install Terraform plugins to run Terraform script to launch AWS services
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

- To run ansible playbook on ec2 follow this [link](https://www.youtube.com/watch?v=PRpEbFZi7nI&t=329s)

**Step3:** create a Webhook on Github to trigger first job of Terraform in Jenkins from your localhost push

**Step4:** create another job to be triggered if first job was successful

**Step5:** This job to run playbook to configure Mongodb on db ec2

**Step6:** 3rd job to run ansible playbook/s to configure nodejs with reverse proxy on app instance

**Step7:** ensure to launch node app on public ip with posts working


## Will be continued ...
