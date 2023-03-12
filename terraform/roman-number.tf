terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

/* data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
} */

/* resource "aws_instance" "XXXXXXXXX" {
  ami             = "ami-XXXXXXXXXXXXXXX"
  instance_type   = "t2.micro"
  key_name        = "XXXXXXXXXXXX"
  security_groups = ["roman-sg"]
  user_data       = file("${path.module}/userdata.sh")

} */
resource "aws_instance" "web" {
  ami           = "ami-XXXXXXXXXXXX"
  instance_type = "t2.micro"
  security_groups = ["romanNUMBERsg"]
  user_data = file("${path.module}/userdata.sh")
  key_name = "XXXXXXXXX"
}
resource "aws_route53_record" "www" {
  zone_id = "Z02125032QH4SG2LG751G"
  name    = "www.XXXXXXXXXXX"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web.public_ip]
}
