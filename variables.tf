variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
}

variable "project_tag" {
  description = "The value for the 'Project' tag."
  type        = string
}

variable "terraform_tag" {
  description = "The value for the 'Terraform' tag."
  type        = string
}

variable "vpc_name" {
  description = "The name of the pre-existing VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A map of public subnet CIDRs to look up."
  type        = map(string)
}

variable "private_subnet_cidrs" {
  description = "A map of private subnet CIDRs to look up."
  type        = map(string)
}

variable "sg_ec2_name" {
  description = "The name of the EC2 security group."
  type        = string
}

variable "sg_http_name" {
  description = "The name of the HTTP security group for instances."
  type        = string
}

variable "sg_sglb_name" {
  description = "The name of the security group for the load balancer."
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances."
  type        = string
}

variable "ssh_key_name" {
  description = "The name of the key pair for SSH access."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instances."
  type        = string
}

variable "template_name" {
  description = "The name for the Launch Template."
  type        = string
}

variable "asg_name" {
  description = "The name for the Auto Scaling Group."
  type        = string
}

variable "lb_name" {
  description = "The name for the Application Load Balancer."
  type        = string
}
