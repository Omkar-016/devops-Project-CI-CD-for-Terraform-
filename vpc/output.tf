
output "local_pbsub" {
    value = aws_subnet.public_sub.id   
}

output "sec_local" {
    value = aws_security_group.sec_local.id
  
}