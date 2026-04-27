resource "aws_iam_user" "dev_user" {
  name = "devops-user"
}

resource "aws_iam_access_key" "dev_key" {
  user = aws_iam_user.dev_user.name
}

resource "aws_iam_user_policy_attachment" "attach_ec2" {
  user       = aws_iam_user.dev_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_user_policy_attachment" "attach_vpc" {
  user       = aws_iam_user.dev_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}