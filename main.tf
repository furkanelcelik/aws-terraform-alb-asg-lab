provider "aws" {
  region = var.aws_region
}

# --- Data Sources to find existing infrastructure ---
data "aws_vpc" "existing" {
  filter {
    name   = var.vpc_filter_name
    values = [var.vpc_name]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = var.subnet_filter_name_vpc
    values = [data.aws_vpc.existing.id]
  }
  filter {
    name   = var.subnet_filter_name_cidr
    values = var.public_subnet_cidrs
  }
}

data "aws_subnets" "private" {
  filter {
    name   = var.subnet_filter_name_vpc
    values = [data.aws_vpc.existing.id]
  }
  filter {
    name   = var.subnet_filter_name_cidr
    values = var.private_subnet_cidrs
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

# Use a locals block for tags as a best practice
locals {
  common_tags = var.common_tags
}
