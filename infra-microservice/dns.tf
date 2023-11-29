resource "aws_route53_record" "record" {
  zone_id = "Z04407843NK6AZIR5YB6N"
  type = "A"
  name = "hadi-ms.kevin-billerach.me"
  
  alias {
    name                   = aws_lb.lb.dns_name
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}