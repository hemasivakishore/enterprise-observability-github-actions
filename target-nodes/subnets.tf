resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.target-node-vpc.id
  cidr_block              = var.subnet-cidr-block
  map_public_ip_on_launch = true #Automatically assign the public IP Addresses
  availability_zone       = var.subnet-az
  tags                    = var.tags
}