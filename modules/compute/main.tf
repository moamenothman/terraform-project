resource "aws_instance" "app1" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  subnet_id = var.private_subnet_1

  vpc_security_group_ids = [var.alb_sg_id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install nginx1 -y
    systemctl start nginx
    systemctl enable nginx
    echo "App running in AZ1" > /usr/share/nginx/html/index.html
  EOF
}

resource "aws_instance" "app2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  subnet_id = var.private_subnet_2

  vpc_security_group_ids = [var.alb_sg_id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install nginx1 -y
    systemctl start nginx
    systemctl enable nginx
    echo "App running in AZ2" > /usr/share/nginx/html/index.html
  EOF
}

resource "aws_lb_target_group_attachment" "app1" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.app1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app2" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.app2.id
  port             = 80
}