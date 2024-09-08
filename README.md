# CICD project

This project runs the continous intergrations and continous deployment pipeline which runs to build,deploy,unit test and rollback. The run is completely automated from code commit to code deployment using GitHub actions, AWS ECR adn ECS.

# Project setup
Step 1
Node.js, npm, Docker installed in local machine and then incorperated a simple node.js express app in our GitHub created repository.
Step 2
cloned the created GitHub repository on my local machine.
Step 3
Installed the npm dependencies on my host machine using npm install and ran the application on local machine by executing node index.js to test if application is accessible on web.
Commands - npm install
           node index.js
Step 4 
Created multistage Dockerfile to build my application and sereve on nginx as reverse proxy. Bulit docker image and ran the container on host machine.
commands - docker build myapp01 .
           docker run -p 80:80 myapp01
           application was suessfully accessible on http://localhost
Step 5 
Since the application is ready for deployment on cloud. 
Created and configured Amazon ECS, ECR repository on AWS console to upload built image and deploy my application.
Step 6 
In GitHub repository created below AWS secrets, which were used in my GitHub actions workflow as environment variables
AWS_ACCESS_KEY_ID
AWS_ACCOUNT_ID
AWS_REGION
AWS_SECRET_ACCESS_KEY
ECR_REPOSITORY
ECS_CLUSTER_NAME
ECS_SERVICE_NAME

Step 7 
GitHub actions pipeline is created to automatically build, deploy my dockarised application on ECS.
Stages of my pipeine include - Checking out latest code from repository, connect with amazon ECR using environment variables, build my docker image, tag the image with latest version, push docker image to ECR and then finally upload the docker image to ECS. 

# Integration test and rollback on failure
Tests are performed on two end points to check if application is ready and healthy
/will - this endpoint verifies if application is healthy
/ready - this endpoint will verify if application is ready to handle incomming traffic

If the above endpoint tests fail then the application is rolled back to previous stable and successful deployed image

