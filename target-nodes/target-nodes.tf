resource "aws_instance" "target-node" {
  count                  = 3
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.observability-sg.id]
  key_name               = "vhsk"

  tags = {
    Name = "Target-Node-0${count.index + 1}"
    Role = "Observability-Target"
  }
}

output "target_nodes_public_ips" {
  value = aws_instance.target-node[*].public_ip
}