resource "aws_lb" "lb" {
  name               = "${var.user}-lb-${var.app}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-lb.id]
  subnets            = [aws_subnet.pub1.id, aws_subnet.pub2.id]
  tags = {
    Environment = "${var.site}-lb-${var.user}"
  }
}

resource "aws_lb_target_group" "lb-tg" {
  target_type = "instance"
  name     = "${var.user}-tg-${var.app}"
  port     = 31000
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.lb.arn
  port = "443"
  protocol = "HTTPS"
  certificate_arn = data.aws_acm_certificate.certificate.arn
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "redirect"
    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}