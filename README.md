Epam Project

Flask application for aws CI/CD. Demonstrating Jenkins pipeline on AWS environment with AWS devops tools(CodeBuild, S3 Buckets, CodeDeploy) using terraform, ansible and Docker . 



Tools used --

1. Terraform - for creating s3 bucket,roles and ec2

2. Ansible - for installing and configure jenkins in ec2

3. AWS CodePipeline - for fetching code from github by push trigger and deploying to s3 bucket

4. AWS SQS - for creating a trigger for jenkins from s3 bucket object creation alarm

5. jenkins - for fetcing code from s3 build and deploying docker

6. Docker - for creating a Flask application container
