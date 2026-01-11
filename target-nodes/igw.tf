resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.target-node-vpc.id
  tags   = var.tags
}