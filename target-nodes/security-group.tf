resource "aws_security_group" "observability-sg" {
  name        = "observability-sg"
  description = "observability-sg"
  vpc_id      = aws_vpc.target-node-vpc.id

  # SSH Management
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}