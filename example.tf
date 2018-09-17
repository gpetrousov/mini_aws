provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "eu-central-1"
}

resource "aws_instance" "ec2_isntance" {
  ami           = "ami-027583e616ca104df"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.ec2_isntance.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}