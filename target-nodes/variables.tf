variable "vpc-cidr" {
  type        = string
  default     = "192.168.0.0/16"
  description = "VPC CIDR Block"
}

variable "tags" {
  type        = map(string)
  description = "Tag to apply to all resources"
  default = {
    name      = "target-node"
    terraform = "yes"
    project   = "observability"
  }
}

variable "subnet-cidr-block" {
  type        = string
  default     = "192.168.1.0/24"
  description = "Subnet CIDR Block"
}

variable "subnet-az" {
  type        = string
  default     = "us-east-1a"
  description = "Subnet Availability Zone"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Target Node Instance Type"
}

variable "ami" {
  type    = string
  default = "ami-0ecb62995f68bb549"
}
