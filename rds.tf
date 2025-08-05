resource "aws_db_subnet_group" "private" {
  name       = "private-subnet-group"
  subnet_ids = [for subnet in aws_subnet.private : subnet.id]

  tags = {
    Name = "private-subnet-group"
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7"             # ✅ Let AWS pick the best minor version
  instance_class         = "db.t3.micro"     # ✅ Recommended over t2.micro
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.private.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  multi_az               = false

  tags = {
    Name = "rds-mysql-instance"
  }
}


