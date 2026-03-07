resource "aws_instance" "frontend" {
  ami                         = var.frontend_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "two-tier-frontend"
  }
}

resource "aws_instance" "database" {
  ami                    = var.database_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.database_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "two-tier-database"
  }
}
