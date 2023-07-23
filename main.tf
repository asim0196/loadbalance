##### Ec2 ###########

resource "aws_instance" "webserver" {
  count = var.inst_count
  ami           = var.inst_ami_id
  instance_type = var.inst_type
  subnet_id = var.inst_subnet
  user_data = file("httpd.sh")
  security_groups = [var.inst_sg]
  key_name = "Pub_rsa_for_all"
  tags = {
    Name = var.inst_name
  }
}




#### Load Balancer ####

resource "aws_elb" "bar" {
  name               = "foobar-terraform-elb"
  availability_zones = var.elb_az
  security_groups = [var.inst_sg]



  listener {
    
    instance_port     = var.elb_listener_port
    instance_protocol = "http"
    lb_port           = var.elb_listener_port
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = aws_instance.webserver[*].id
  cross_zone_load_balancing   = true
  idle_timeout                = 40
  connection_draining         = true
  connection_draining_timeout = 40

  tags = {
    Name = var.elb_name
  }
}

output "ELB" {
  value = aws_elb.bar.dns_name
}