resource "null_resource" "copy_file" {
  depends_on = [aws_instance.ec2-drupal]

  provisioner "file" {
    source      = "/home/ubuntu/projetC/drupal"
    destination = "/home/ubuntu/drupal"  # Chemin sur l'instance EC2
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/ubuntu/projetC/infra-drupal/key.pem")
      host        = aws_instance.ec2-drupal.public_ip
    }
  }

 provisioner "local-exec" {
    command = <<-EOT
      chmod 400 /home/ubuntu/projetC/infra-drupal/key.pem &&
      scp -i /home/ubuntu/projetC/infra-drupal/key.pem /home/ubuntu/projetC/infra-drupal/copyfile.tf ubuntu@${aws_instance.ec2-drupal.public_ip}:/home/ubuntu/
    EOT
  }

  provisioner "local-exec" {
  command = <<-EOF
    cat <<ANSIBLE > ansible-playbook.yml
    ---
    - hosts: DrupalMachine
      become: true
      tasks:
        - name: Update apt packages
          apt:
            update_cache: yes

        - name: Install Docker and Docker Compose
          apt:
            name: "{{ item }}"
            state: present
          with_items:
            - docker
            - docker-compose

        - name: Change directory to Drupal project
          command: cd /home/ubuntu/drupal

        - name: Start Docker Compose
          command: docker-compose up -d
    ANSIBLE
  EOF
}

provisioner "local-exec" {
  command = <<-EOF
    echo -e "[defaults]\nprivate_key_file = /home/ubuntu/projetC/infra-drupal/key.pem" > ansible.cfg
    ansible-playbook -i /home/ubuntu/inventory.ini ansible-playbook.yml
  EOF
}

}

# resource "null_resource" "provision" {
#   depends_on = [aws_instance.ec2-drupal, null_resource.copy_file]
  
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt-get update",
#       "sudo apt-get install -y docker docker-compose",
#       "cd /home/ubuntu/drupal",
#       "docker-compose up -d"
#     ]
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("/home/ubuntu/projetC/infra-drupal/key.pem")
#       host        = aws_instance.ec2-drupal.public_ip
#     }
#   }
# }