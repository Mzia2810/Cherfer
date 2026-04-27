output "public_ip" {
  value = aws_instance.web.public_ip
}

output "iam_access_key" {
  value = aws_iam_access_key.dev_key.id
}

output "iam_secret" {
  value     = aws_iam_access_key.dev_key.secret
  sensitive = true
}
