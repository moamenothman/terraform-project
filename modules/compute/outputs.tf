output "app1_id" {
  value = aws_instance.app1.id
}

output "app2_id" {
  value = aws_instance.app2.id
}

output "app1_private_ip" {
  value = aws_instance.app1.private_ip
}

output "app2_private_ip" {
  value = aws_instance.app2.private_ip
}