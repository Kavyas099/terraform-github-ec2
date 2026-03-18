resource "aws_instance" "kavya" {
  ami = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_groups.allow_tls.id]
  instance_type = "t3.micro"

  tags = {
    Name = "kavya"
  }
}

resource "aws_security_group" "allow_tls" {
  name = "allow-tls"
  description = "this is sg id"

   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
