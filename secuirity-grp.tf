# Security group

resource "aws_security_group" "sg" {
  name = "webserver-sg"
  description = "allow 22 and 80"
  vpc_id = aws_vpc.V1.id

  ingress {
    description = "allow 22 80"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0"]
  }

    ingress {
    description = "allow 8080"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}