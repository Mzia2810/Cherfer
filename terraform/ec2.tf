resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"

  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd git

              systemctl enable httpd
              systemctl start httpd

              cd /var/www/html
              rm -rf *

              # 🔥 YOUR WEBSITE FOLDER FROM GITHUB
              git clone https://github.com/Mzia2810/Cherfer.git .

              systemctl restart httpd
              EOF

  tags = {
    Name = "SSM-Web-Server"
  }
}