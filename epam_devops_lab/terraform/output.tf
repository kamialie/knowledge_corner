output "server-IP" {
  value = aws_instance.server.public_ip
}

output "web-server-IP" {
  value = aws_instance.web-server.public_ip
}

resource "local_file" "ansible_inventory" {
  content = templatefile("templates/inventory.tpl",
    {
      user      = "ubuntu",
      web-server-ip = aws_instance.web-server.public_ip,
      server-ip = aws_instance.server.public_ip,
      ssh-key   = "${var.ssh_key}.pem"
    }
  )
  filename = "../ansible/inventory"
}
