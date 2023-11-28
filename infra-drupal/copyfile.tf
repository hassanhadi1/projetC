resource "null_resource" "copy_file" {
  depends_on = [aws_instance.ec2-drupal]

  provisioner "file" {
    source      = "drupal"
    destination = "/home/ubuntu/drupal"  # Chemin sur l'instance EC2
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("key.pem")
      host        = aws_instance.ec2-drupal.public_ip
    }
  }

}

resource "null_resource" "provision" {
  depends_on = [aws_instance.ec2-drupal, null_resource.copy_file]
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "curl -fsSL https://get.docker.com/ -o get-docker.sh",
      "sudo sh ./get-docker.sh",
      "cd /home/ubuntu/drupal",
      "sudo docker compose up -d"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("key.pem")
      host        = aws_instance.ec2-drupal.public_ip
    }
  }
}