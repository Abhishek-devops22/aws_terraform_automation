# aws_terraform_automation
This terraform project automates the creation of AWS resources. No manual creation of resource is needed.

Infrastructure as Code with Terraform - AWS EC2 + Docker Nginx

This project provisions an AWS infrastructure using Terraform. It automates the deployment of a complete network environment and launches an EC2 instance running a Dockerized Nginx server.
Project Structure

lac_with_terraform/
│
├── modules/
│   ├── subnet/                     # Module for Subnet resources
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── webserver/                  # Module for EC2 and Docker Nginx setup
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
│
├── .gitignore
├── entryscript.sh                 # EC2 user data script to run Docker Nginx
├── main.tf                        # Root module orchestrating all modules
├── outputs.tf                     # Root outputs
├── terraform.tfvars               # Variable values (non-dev)
├── terraform-dev.tfvars           # Dev environment variables

What It Does
•	VPC: Creates a Virtual Private Cloud.
•	Subnet: Provisions a subnet within the VPC.
•	Internet Gateway & Route Table: Sets up internet access.
•	Security Group: Opens HTTP (port 80) and SSH (port 22).
•	EC2 Instance: Deploys an Amazon Linux 2 instance.
•	Docker + Nginx: Installs Docker and runs the official Nginx container.
Getting Started
Prerequisites
• Terraform
• AWS credentials (via CLI or environment variables)
• AWS Key Pair (for SSH access)
Commands

terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"

Accessing Nginx
After applying, Terraform will output the public IP. Open it in a browser to access the Nginx default page.
Teardown
To remove all resources:
terraform destroy -var-file="terraform.tfvars"
Modules
• subnet: Defines VPC subcomponents.
• webserver: Provisions EC2 with Docker and Nginx.
