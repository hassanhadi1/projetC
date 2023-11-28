resource "null_resource" "copy_file1" {
  depends_on = [aws_instance.ec2-ms1]

  provisioner "file" {
    source      = "/home/ubuntu/projetC/microservice"
    destination = "/home/ubuntu/microservice"  # Chemin sur l'instance EC2
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("key.pem")
      host        = aws_instance.ec2-ms1.private_ip
    }
  }

}

resource "null_resource" "provision1" {
  depends_on = [aws_instance.ec2-ms1, null_resource.copy_file1]
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "curl -fsSL https://get.docker.com/ -o get-docker.sh",
      "sudo sh ./get-docker.sh",
      "cd /home/ubuntu/microservice",
      "sudo docker compose up -d"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("key.pem")
      host        = aws_instance.ec2-ms1.private_ip
    }
  }
}


resource "null_resource" "copy_file2" {
  depends_on = [aws_instance.ec2-ms2]

  provisioner "file" {
    source      = "/home/ubuntu/projetC/microservice"
    destination = "/home/ubuntu/microservice"  # Chemin sur l'instance EC2
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("key.pem")
      host        = aws_instance.ec2-ms2.private_ip
    }
  }

}

resource "null_resource" "provision2" {
  depends_on = [aws_instance.ec2-ms2, null_resource.copy_file2]
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "curl -fsSL https://get.docker.com/ -o get-docker.sh",
      "sudo sh ./get-docker.sh",
      "cd /home/ubuntu/microservice",
      "sudo docker compose up -d"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("key.pem")
      host        = aws_instance.ec2-ms2.private_ip
    }
  }
}