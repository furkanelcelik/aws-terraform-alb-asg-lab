# --- Load Balancer, Target Group, and Listener ---
resource "aws_lb" "main" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.sglb.id]
  subnets            = data.aws_subnets.public.ids

  tags = local.common_tags
}

resource "aws_lb_target_group" "main" {
  name     = "${var.lb_name}-tg" 
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.existing.id

  health_check {
    path = "/"
  }

  tags = local.common_tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

# --- Launch Template and Auto Scaling Group ---
resource "aws_launch_template" "main" {
  name_prefix   = var.template_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name

  network_interfaces {
    security_groups       = [data.aws_security_group.ec2.id, data.aws_security_group.http.id]
    delete_on_termination = true
  }

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  user_data = base64encode(file("${path.module}/user_data.sh"))

  tag_specifications {
    resource_type = "instance"
    tags = local.common_tags
  }
}

resource "aws_autoscaling_group" "main" {
  name                = var.asg_name
  desired_capacity    = 2
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = data.aws_subnets.private.ids

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [target_group_arns]
  }
}

# --- Attachment Resource ---
resource "aws_autoscaling_attachment" "main" {
  autoscaling_group_name = aws_autoscaling_group.main.id
  lb_target_group_arn    = aws_lb_target_group.main.arn
}
