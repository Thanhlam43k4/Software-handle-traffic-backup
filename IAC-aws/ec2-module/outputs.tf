output "public_ip" {
  value = aws_instance.ec2-instance-pb.public_ip
}
output "public_dns" {
  value = aws_instance.ec2-instance-pb.public_dns
}