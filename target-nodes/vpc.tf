resource "aws_vpc" "target-node-vpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_hostnames = true
  tags                 = var.tags
}