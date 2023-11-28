resource "aws_route53_record" "record" {
  zone_id = "Z04407843NK6AZIR5YB6N"
  type = "A"
  name = "hadi-drupal.kevin-billerach.me"
  ttl = 300
  records = [ aws_instance.ec2-drupal.public_ip ]
}