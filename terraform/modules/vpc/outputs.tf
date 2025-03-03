output "public_subnets" {
  description = "IDs of the public subnets"
  value = { for key, subnet in  aws_subnet.public_subnets : key => subnet.id }
}

output "private_subnets" {
  description = "IDs of the private subnets"
  value = { for key, subnet in aws_subnet.private_subnets : key => subnet.id }
}