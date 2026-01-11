resource "aws_security_group" "observability-sg" {
  name        = "observability-sg"
  description = "observability-sg"
  vpc_id      = aws_vpc.target-node-vpc.id

  # SSH Management
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }
}