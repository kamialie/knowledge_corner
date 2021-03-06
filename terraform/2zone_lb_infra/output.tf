output "aws_lb_public_dns" {
  value = aws_lb.main.dns_name
}

output "nginx1_instance_ip" {
  value = aws_instance.nginx1.public_ip
}

output "nginx2_instance_ip" {
  value = aws_instance.nginx2.public_ip
}
