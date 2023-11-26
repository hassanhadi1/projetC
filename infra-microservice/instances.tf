resource "aws_instance" "ec2-ms1" {
  ami = "ami-0694d931cee176e7d"
  instance_type = "t2.micro"
  key_name = "Hadi-EC2-Drupal-key5"
  subnet_id = aws_subnet.priv1.id
  vpc_security_group_ids = [aws_security_group.sg-ms.id]
  tags = {
    Name = "${var.user}-ec2-${var.app}-1"
  }
  volume_tags = {
    owner = "hhassan@thenuumfactory.fr"
    ephemere = "non"
    entity = "numfactory"
  }
}

resource "aws_instance" "ec2-ms2" {
  ami = "ami-0694d931cee176e7d"
  instance_type = "t2.micro"
  key_name = "Hadi-EC2-Drupal-key5"
  subnet_id = aws_subnet.priv2.id
  vpc_security_group_ids = [aws_security_group.sg-ms.id]
  tags = {
    Name = "${var.user}-ec2-${var.app}-2"
  }
  volume_tags = {
    owner = "hhassan@thenuumfactory.fr"
    ephemere = "non"
    entity = "numfactory"
  }
}