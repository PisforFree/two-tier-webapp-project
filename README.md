# two-tier-webapp-project
Frontend-Backend Ansible configuration with CI-scanning

Project Overview

This project demonstrates how to deploy and configure a simple two-tier web application environment in AWS using automation tools.

The environment was built using Terraform for infrastructure provisioning and Ansible for server configuration. The goal was to simulate a basic real-world DevOps workflow where infrastructure and server setup are fully automated.

The architecture separates the web application and the database onto two different servers, which is a common design pattern used in cloud environments for security and scalability. 

Project_specifications

The system consists of:

Frontend Server (Public Subnet)
Runs Apache and PHP to host the web application.
This server receives HTTP traffic from the internet and communicates with the database server.

Database Server (Private Subnet)
Runs MariaDB to store application data.
This server is not publicly accessible and only accepts database connections from the frontend server.

This setup demonstrates how applications can be deployed securely using network isolation and controlled access between application tiers.

The project also includes a CI security pipeline using GitHub Actions that automatically runs security and quality checks whenever code is pushed to the repository. These checks include Terraform validation, security scanning, and Ansible linting.

During development, several real-world troubleshooting situations occurred.

One issue involved Terraform failing during deployment because a NAT Gateway already existed in the AWS account. Terraform attempted to recreate the resource, which caused the deployment to fail. The issue was resolved by importing the existing NAT Gateway into the Terraform state, demonstrating an important real-world skill: reconciling Terraform state with existing infrastructure.

Another issue occurred during CI testing with ansible-lint. Although the Ansible playbooks already used the correct fully qualified module names, the CI pipeline produced errors due to differences between local linting behavior and the GitHub Actions environment. This was resolved by adding a configuration file that downgraded the rule to a warning, allowing the pipeline to pass while still highlighting the recommendation.

By completing this project, the following DevOps skills are demonstrated:

Infrastructure provisioning using Terraform

AWS VPC networking design

Public and private subnet architecture

Configuration management using Ansible

Secure database connectivity between application tiers

CI security scanning with GitHub Actions

Troubleshooting infrastructure automation issues

This project reflects a simplified version of how engineers automate infrastructure and server configuration in real cloud environments.
