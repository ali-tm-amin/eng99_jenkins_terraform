# Terraform job on jenkins

# Task part 2
**Step1**: Create CI CD pipeline 
- Set up jenkins
- Sample commands:

    Install the latest LTS version: brew install jenkins-lts
    Install a specific LTS version: brew install jenkins-lts@YOUR_VERSION
    Start the Jenkins service: brew services start jenkins-lts
    Restart the Jenkins service: brew services restart jenkins-lts
    Update the Jenkins version: brew upgrade jenkins-lts

1. Browse to http://localhost:8080
2. Navigate to directory to find password `/Users/amin/.jenkins/secrets/initialAdminPassword`, copy & past to login
3. Install suggested plugins
4. Install CloudBees AWS Credentials Plugin
5. Creating the first administrator user
6. Set up credentials, go to `Configuration Systems` then scrol down to `Global Properties` select `ENV VAR`then add

        - AWS_ACCESS_KEY_ID
        - AWS_SECRET_ACCESS_KEY

**Step2:** Build your own Jenkins server on AWS ec2 instance
- Set up credentials

