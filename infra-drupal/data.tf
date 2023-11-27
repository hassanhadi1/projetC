data "aws_vpc" "vpc" {
  tags = {
    Name = "VPC-A"
  }
}

data "aws_internet_gateway" "igw" {
  tags = {
    Name = "IGW-A"
  }
}

data "aws_nat_gateway" "ngw" {
  tags = {
    Name = "NGW-A"
  }
}

data "template_file" "install_ansible" {
  template = file("./install_ansible.tftpl")

  vars = {
    ec2_drupal_private_ip = "aws_instance.ec2_drupal.private_ip"
  }
}
