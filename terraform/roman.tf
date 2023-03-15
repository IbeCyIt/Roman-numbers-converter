terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  key_name = var.key_name
  user_data       = file("${path.module}/userdata.sh")
  security_groups = [aws_security_group.allow_tls.name]
  tags = {
    Name = "Roman-numbers-convert"
  }
}
 output "my-Output" {
    value = "aws_route53_record"
 }

 output "myOutput" {
    value = "aws_instance.web.public_ip"
 }