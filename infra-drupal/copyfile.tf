resource "null_resource" "copy_file" {
  depends_on = [aws_instance.ec2-drupal]

  provisioner "local-exec" {
    command = "scp -i /home/ubuntu/projetC/infra-drupal/key.pem /home/ubuntu/projetC/infra-drupal/copyfile.tf ec2-user@${aws_instance.ec2-drupal.public_ip}:/home/ubuntu/"
  }
}

resource "null_resource" "provision" {
  depends_on = [aws_instance.ec2-drupal, null_resource.copy_file]
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y docker docker-compose",
      "cd /home/ubuntu/drupal",
      "docker-compose up -d"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/ubuntu/projetC/infra-drupal/key.pem")
      host        = aws_instance.ec2-drupal.public_ip
    }
  }
}