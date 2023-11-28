resource "aws_instance" "ec2-drupal" {
  ami = "ami-0694d931cee176e7d"
  instance_type = "t3.small"
  key_name = "Hadi-EC2-Drupal-key5"
  subnet_id = aws_subnet.pub3.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg-drupal.id]

  tags = {
    Name = "${var.user}-ec2-${var.app}"
  }
  volume_tags = {
    owner = "hhassan@thenuumfactory.fr"
    ephemere = "non"
    entity = "numfactory"
  }
}



