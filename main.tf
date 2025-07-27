provider "aws" {
  region = var.aws_region
}


data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}


data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }

  filter {
    name   = "cidr-block"
    values = values(var.public_subnet_cidrs)
  }
}


data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }

  filter {
    name   = "cidr-block"
    values = values(var.private_subnet_cidrs)
  }
}

data "aws_security_group" "ec2" {
  name   = var.sg_ec2_name
  vpc_id = data.aws_vpc.existing.id
}

data "aws_security_group" "http" {
  name   = var.sg_http_name
  vpc_id = data.aws_vpc.existing.id
}

data "aws_security_group" "sglb" {
  name   = var.sg_sglb_name
  vpc_id = data.aws_vpc.existing.id
}

locals {
  common_tags = {
    Terraform = var.terraform_tag
    Project   = var.project_tag
  }
}
