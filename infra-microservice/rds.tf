resource "aws_db_subnet_group" "sub-group" {
  name = "${var.user}-${var.app}-sub-group"
  subnet_ids = [ 
    aws_subnet.priv3.id,
    aws_subnet.priv4.id
   ]
  tags = {
    Name = "${var.user}-${var.app}-sub-group"
  }
}

resource "aws_db_instance" "mysql-db" {
  allocated_storage    = 10
  db_name              = "microservicedb"
  engine               = "mysql"
  engine_version       = "8.0.33"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = "admin1234"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.sub-group.name
  identifier = "${var.user}-${var.app}-db"
  vpc_security_group_ids = [aws_security_group.sg-db.id]
}