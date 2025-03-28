output "id" {
  value = aws_eip.eip.id
}

output "public_ip" {
  value = aws_eip.eip.public_ip
}

output "public_dns" {
  value = aws_eip.eip.public_dns
}