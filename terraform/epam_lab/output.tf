output "server-IP" {
  value = aws_instance.server.public_ip
}

output "database-IP" {
  value = aws_instance.database.public_ip
}

output "database-private-IP" {
  value = aws_instance.database.private_ip
}

resource "local_file" "ansible_inventory" {
  content = templatefile("files/inventory.tpl",
    {
      user        = "ubuntu",
      nginx_user  = "www-data",
      server-ip   = aws_instance.server.public_ip,
      database-ip = aws_instance.database.public_ip,
      ssh-key     = "${var.ssh_key}.pem"
    }
  )
  filename = "inventory"
}
