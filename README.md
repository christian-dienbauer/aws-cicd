[![Super-Linter](https://github.com/dieni/aws-cicd/actions/workflows/super-linter/badge.svg)](https://github.com/marketplace/actions/super-linter)

# Continuous Integration and Continuous Delivery with GitHub Actions and AWS

Welcome, this repository demonstrates a robust CI/CD pipeline using Python, GitHub Actions, and AWS CodeBuild. This repository provides a comprehensive guide and implementation for automating the integration and delivery process of your applications, leveraging the power of AWS for scalable and efficient build processes.

## Features

- **Python Integration**: Utilize Python for building, testing, and deploying your applications.
- **GitHub Actions**: Automate workflows directly from your GitHub repository for seamless integration.
- **AWS CodeBuild**: Host GitHub runners on AWS CodeBuild for efficient build and test processes.
- **Docker Integration**: Build and push Docker images to AWS Elastic Container Registry (ECR) upon merging to the main branch.
- **AWS CloudFormation**: Automate the setup of the necessary AWS infrastructure using CloudFormation templates.

## Overview

This repository showcases an end-to-end CI/CD pipeline designed to streamline your development workflow. By integrating GitHub Actions with AWS services, you can ensure that your code is automatically tested, built, and deployed with minimal manual intervention. Key components include:

1. **Continuous Integration**:
    - Automated testing and linting using GitHub Actions.
    - Building Docker images using AWS CodeBuild.

2. **Continuous Delivery**:
    - Pushing Docker images to AWS ECR upon successful merge to the main branch.
    - Deploying infrastructure using AWS CloudFormation.

## Getting Started
To get started with this example implementation, follow the instructions in the subsequent sections of this README. You will learn how to configure GitHub Actions, set up AWS CodeBuild and ECR, and deploy CloudFormation templates for your infrastructure.

I hope this example repository serves as a valuable resource for setting up your own CI/CD pipeline, enhancing your development workflow, and ensuring rapid and reliable delivery of your applications.


Steps
1. Create an AWS Account
1. Install and Configure AWS CLI
    1. locally to deploy a CloudFormation stack
    1. provide credentials via GitHub secrets to push docker images to ECR
1. Create a connection between AWS and GitHub
1. Deploy AWS CloudFormation stack

### Create an AWS Account
In order to use Amazon Web Services you have to create an account. The sign up is for free and you can make use of the free tier for this project. Follow the instructions [here](https://aws.amazon.com/resources/create-account/).

Hint: For best practices, create a separate IAM user for this project and don't use the root account

### Install and Configure AWS Cli
The AWS CLI is used to deploy the CloudFormation stack, create an AWS Elastic Container Registry for the applicaiton and push the the docker images to this registry. The CloudFormation stack is deployed from your development envrionment, same as the creationg of the docker registry on AWS. If you don't want to use the CLI for this, you can also use the management console to deploy the CloudFormation stack and create the registry. 

The docker images are built using the GitHub runners and will be deployed to the AWS ECR using the CLI. Therefore, it is mandatory to provide the runners with the credentials. This is done via GitHub secrets.

For detailed information on how to setup and use the AWS CLI have a look [here](https://github.com/aws/aws-cli/tree/v2)

#### Provide GitHub runners with AWS CLI credentials
TBD

### Create a Connection between AWS and GitHub
Please follow the instructions as mentioned [here](https://docs.aws.amazon.com/dtconsole/latest/userguide/connections-create-github.html)

### Deploy AWS CloudFormation stack
The [CloudFormation Stack](iac/codebuild_project.yml) in this repository creates the necessary resources to set up AWS CodeBuild. For more information about self-hosted GitHub runners have a look [here](https://docs.aws.amazon.com/codebuild/latest/userguide/action-runner.html)

If you set up the AWS CLI in your development environment, deploy the CloudFormation stack by using the [Makefile](Makefile). Enter following command

```
make cloudformation_deploy
```

## How to use the repository

The repository provides mechanisms for continuous integration and for continuous delivery




## Adjust and Troubleshoot
TBD


## Use OIDC to use GitHub as an Identity Provider and retrieve short lived credentials to connect to AWS

Useful links:
- https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services
- https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc.html
- https://aws.amazon.com/blogs/security/use-iam-roles-to-connect-github-actions-to-actions-in-aws/
