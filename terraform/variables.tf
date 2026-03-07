variable "aws_region" {
  description = "AWS region for the infrastructure"
  type        = string
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "172.16.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "172.16.2.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "172.16.3.0/24"
}

variable "availability_zone" {
  description = "Availability zone for both subnets"
  type        = string
  default     = "us-east-2b"
}

variable "frontend_ami" {
  description = "AMI for the frontend EC2 instance"
  type        = string
  default     = "ami-040855b0715ee6f0b"
}

variable "database_ami" {
  description = "AMI for the database EC2 instance"
  type        = string
  default     = "ami-040855b0715ee6f0b"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "practice-time-key"
}