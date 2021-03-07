resource "aws_launch_configuration" "my-launchconfig" {
  name_prefix     = "my-launchconfig"
  image_id        = var.AWS_REGION
  instance_type   = var.instancetype
  key_name        = aws_key_pair.envkey.key_name
  security_groups = [aws_security_group.allow-ssh.id]
  user_data       = "#!/bin/bash\napt-get update\napt-get -y install net-tools nginx\nMYIP=`ifconfig | grep -E '(inet 10)|(addr:10)' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/www/html/index.html"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "my-autoscaling" {
  name                      = "my-autoscaling"
  vpc_zone_identifier       = [element(var.PRIVATE_SUBNETS, 0), element(var.PRIVATE_SUBNETS, 1)]
  launch_configuration      = aws_launch_configuration.my-launchconfig.name
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.my-elb.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}