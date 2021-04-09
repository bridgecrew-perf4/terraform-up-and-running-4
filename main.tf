provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "example" {
  ami                    = "ami-0577b787189839998"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data              = <<-EOF
              yum install httpd -y
              echo "Hello, World!" >> /var/www/html/index.html"
              systemctl enable httpd
              systemctl start httpd
              EOF

  tags = {
    Name = "terraform-instance-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}