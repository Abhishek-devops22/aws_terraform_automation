# aws_terraform_automation

****Infrastructure as Code with Terraform - AWS EC2 + Docker Nginx**
**
This project provisions an AWS infrastructure using Terraform. It automates the deployment of a complete network environment and launches an EC2 instance running a Dockerized Nginx server.
Project Structure

**lac_with_terraform/
**
<img width="625" alt="image" src="https://github.com/user-attachments/assets/f7c40ec9-2fef-4ef2-85e9-4ceefb1f6c39" />


**What It Does
**
•	**VPC**: Creates a Virtual Private Cloud.

•	**Subnet**: Provisions a subnet within the VPC.

•	**Internet Gateway & Route Table**: Sets up internet access.

•	**Security Group**: Opens HTTP (port 80) and SSH (port 22).

•	**EC2 Instance**: Deploys an Amazon Linux 2 instance.

•	**Docker + Nginx**: Installs Docker and runs the official Nginx container.

****Getting Started**
**



**Prerequisites**

• Terraform

• AWS credentials (via CLI or environment variables)

• AWS Key Pair (for SSH access)

**Commands
**

terraform init

_terraform plan -var-file="terraform.tfvars"
_
terraform apply -var-file="terraform.tfvars"


Accessing Nginx
After applying, Terraform will output the public IP. Open it in a browser to access the Nginx default page.

**Teardown**
To remove all resources:

terraform destroy -var-file="terraform.tfvars"

**Modules
**
• **subnet**: Defines VPC subcomponents.

• **webserver**: Provisions EC2 with Docker and Nginx.
