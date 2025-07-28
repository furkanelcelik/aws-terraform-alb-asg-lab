variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
}

variable "vpc_name" {
  description = "The name of the pre-existing VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of public subnet CIDRs to look up."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of private subnet CIDRs to look up."
  type        = list(string)
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

variable "common_tags" {
  description = "A map of common tags to apply to resources."
  type        = map(string)
}

variable "lb_type" {
  description = "The type of Load Balancer."
  type        = string
}

variable "tg_port" {
  description = "The port for the target group."
  type        = number
}

variable "tg_protocol" {
  description = "The protocol for the target group."
  type        = string
}

variable "tg_health_check_path" {
  description = "The health check path for the target group."
  type        = string
}

variable "listener_port" {
  description = "The port for the LB listener."
  type        = string
}

variable "listener_protocol" {
  description = "The protocol for the LB listener."
  type        = string
}

variable "listener_default_action_type" {
  description = "The default action type for the listener."
  type        = string
}

variable "lt_delete_on_termination" {
  description = "Whether to delete the network interface on instance termination."
  type        = bool
}

variable "lt_metadata_http_endpoint" {
  description = "State of the metadata service endpoint."
  type        = string
}

variable "lt_metadata_http_tokens" {
  description = "State of the metadata service tokens."
  type        = string
}

variable "asg_desired_capacity" {
  description = "The desired capacity for the Auto Scaling Group."
  type        = number
}

variable "asg_max_size" {
  description = "The maximum size for the Auto Scaling Group."
  type        = number
}

variable "asg_min_size" {
  description = "The minimum size for the Auto Scaling Group."
  type        = number
}

variable "lb_internal" {
  description = "Whether the Load Balancer is internal."
  type        = bool
}

variable "lt_tag_resource_type" {
  description = "The resource type for the launch template tag specification."
  type        = string
}

variable "asg_lt_version" {
  description = "The version of the launch template for the ASG to use."
  type        = string
}
