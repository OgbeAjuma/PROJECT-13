resource "aws_elb" "project13-alb" {
  name               = "project9-alb"
  subnets = [
    aws_subnet.pubsub-13-1.id,
    aws_subnet.pubsub-13-2.id,
    aws_subnet.pubsub-13-3.id,
  ]

  

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = "project13-alb"
  }
}

#Create ALB Target group
resource "aws_lb_target_group" "ELB-TG-project13" {
  name     = "ELB-TG-project9"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project-13.id
}

#Create ELB Target group attachment for Instance 1/web server
resource "aws_lb_target_group_attachment" "elb-server-attachment001" {
  target_group_arn = aws_lb_target_group.ELB-TG-project13.arn
  target_id        = aws_instance.webserver1-proj-13.id

  depends_on       = [aws_instance.webserver1-proj-13]
}

#Create ELB Target group attachment for Instance 2/web server
resource "aws_lb_target_group_attachment" "elb-server-attachment002" {
  target_group_arn = aws_lb_target_group.ELB-TG-project13.arn
  target_id        = aws_instance.webserver2-proj-13.id

  depends_on       = [aws_instance.webserver2-proj-13]
}
#Create ELB Target group attachment for Instance 3/web server
resource "aws_lb_target_group_attachment" "elb-server-attachment003" {
  target_group_arn = aws_lb_target_group.ELB-TG-project13.arn
  target_id        = aws_instance.webserver3-proj-13.id

  depends_on       = [aws_instance.webserver3-proj-13]
}