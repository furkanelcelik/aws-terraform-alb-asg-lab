aws_region    = "us-east-1"
project_tag   = "cmtr-s5mse3rq"
terraform_tag = "true"
vpc_name      = "cmtr-s5mse3rq-vpc"
public_subnet_cidrs = {
  "a" = "10.0.1.0/24",
  "b" = "10.0.3.0/24"
}
private_subnet_cidrs = {
  "a" = "10.0.2.0/24",
  "b" = "10.0.4.0/24"
}
sg_ec2_name               = "cmtr-s5mse3rq-ec2_sg"
sg_http_name              = "cmtr-s5mse3rq-http_sg"
sg_sglb_name              = "cmtr-s5mse3rq-sglb"
ami_id                    = "ami-09e6f87a47903347c"
ssh_key_name              = "cmtr-s5mse3rq-keypair"
iam_instance_profile_name = "cmtr-s5mse3rq-instance_profile"
instance_type             = "t3.micro"
template_name             = "cmtr-s5mse3rq-template"
asg_name                  = "cmtr-s5mse3rq-asg"
lb_name                   = "cmtr-s5mse3rq-loadbalancer"
