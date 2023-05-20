provider "aws" {
    profile = "terraform"
    region = "ap-northeast-1"
}

resource "aws_instance" "test_ec2" {
  ami = "ami-0e0820ad173f20fbb"
  instance_type = "t2.micro"
}
