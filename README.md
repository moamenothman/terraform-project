AWS Web Infrastructure Project using Terraform (Modular Architecture)

This project demonstrates the design and implementation of a scalable and production-style AWS infrastructure using Terraform with a modular architecture. The goal was to deploy a simple web application (Nginx) behind an Application Load Balancer (ALB) across multiple Availability Zones.

The infrastructure follows Infrastructure as Code (IaC) best practices, including separation of concerns, modular design, and reusability.

Architecture Design

The system is built on a high availability multi Availability Zone architecture.

Internet
Application Load Balancer (ALB)
EC2 Instances running Nginx Web Servers
VPC with public and private subnets across two Availability Zones

Key Components

Network Module
Custom VPC with CIDR 10.1.0.0/16
Two public subnets distributed across two Availability Zones
Two private subnets distributed across two Availability Zones
Internet Gateway for public access
NAT Gateway for outbound internet access from private subnets
Route tables and subnet associations for proper routing
This module provides the foundational network layer for the entire infrastructure.

Application Load Balancer Module
Internet facing Application Load Balancer
Security group allowing HTTP traffic on port 80
Target group to register backend EC2 instances
HTTP listener forwarding traffic to the target group
This module handles traffic distribution and high availability across instances.

Compute Module
Two EC2 instances deployed in different Availability Zones
Nginx installed automatically using user data scripts
Instances placed in private subnets
Instances registered with the ALB target group
This module represents the application layer of the infrastructure.

Terraform Modules Structure

modules
network
alb
compute

Each module is independent and reusable.
The network module defines the base infrastructure.
The alb module handles traffic management.
The compute module manages application servers.

Integration Flow

The network module creates the VPC and subnets.
The ALB module deploys the load balancer in public subnets.
The compute module launches EC2 instances in private subnets.
The EC2 instances are registered in the ALB target group.
User traffic is routed through the ALB to the backend instances.

Key Features

Infrastructure as Code using Terraform
Modular and reusable architecture
Multi Availability Zone high availability design
Load balancing using AWS Application Load Balancer
Automated Nginx deployment using user data
Separation of public and private network layers

Skills Demonstrated

AWS networking including VPC, subnets, NAT, and Internet Gateway
Load balancing using Application Load Balancer and target groups
EC2 provisioning and automation using user data
Infrastructure as Code with Terraform
Modular cloud architecture design
DevOps best practices and multi environment thinking

Outcome

The final result is a fully functional and scalable web infrastructure. Users access the application through an ALB endpoint, and traffic is distributed across multiple EC2 instances running in different Availability Zones. The entire infrastructure is automated and reusable using Terraform modules.

Future Improvements

Replace EC2 instances with Auto Scaling Groups for better scalability
Add HTTPS support using ACM certificates
Integrate a custom domain using Route 53
Add CI/CD pipeline for automated deployments
Add monitoring and logging using CloudWatch
