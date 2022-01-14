# Terraform job on jenkins

# Task part 2
**Step1**: Create CI CD pipeline 
- [install jenkins](
https://www.jenkins.io/doc/book/installing/linux/)

1. Create jenkin agent on aws
  - install java
  - Install jenkins on ec2 instance [link to follow](https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/#install-and-configure-jenkins)
  - Open firwall `sudo ufw allow 8080`

2. Browse to ec2_DNS_IP_Adress:8080 ie `http://63.33.202.207:8080/`
 Navigate to directory to find password `/Users/amin/.jenkins/secrets/initialAdminPassword`, or run `cat /var/lib/jenkins/secrets/initialAdminPassword` copy & past to login

3. Install suggested plugins

4. Install `CloudBees AWS Credentials Plugin`

5. Install `Ansible` plugins
 - Go to jenkins `Global Configurations` find `ansible` add put name and the path to ansible on the ec2 instance:
- On the terminal `which ansible` 
- /usr/ansible only add `/usr/` to the path on jenkins config

![](/images/jenkins_ansible.png)

6. Install `terraform`

        - Go inside the Linux Server Terminal
        - Become root user: sudo su
        - Download Terraform package:
        - Go to terraform.io, copy the link address for the amd64 Linux
        - wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
        - Unzip Terraform package: unzip terraform_1.1.3_linux_amd64.zip
        - check terraform binary: ll
        - execute the binary file for installing terraform: ./terraform
        - Verify the version of terraform: terraform --version
        - Set the Path for terraform: pwd
        - echo $"export PATH=\$PATH:$(pwd)" >> ~/.bash_profile
        - source ~/.bash_profile
![](/images/terraform_ec2_install.png)

7. Creating the first administrator user

8. Set up credentials, go to `Configuration Systems` then scrol down to `Global Properties` select `ENV VAR`then add

![](/images/global.png)

9. Add terraform directory in jenkin's `Global Tool Configuration`

![](/images/terraform.png)

10. Add AWS credentials to jenkin's `global credentials`

![](/images/credentials.png)
    
    
11. Install ansible on ec2 instance 
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
