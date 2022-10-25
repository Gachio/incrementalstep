provider "aws" {
    region = "us-west-2"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "dynasty" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"

    tags = {
        Name = "PoppaDynasty"
    }
}

terraform {
  backend "s3" {
    key = "workspaces-attempt/terraform.tfstate"
    bucket = "unlimit-up"
    region = "us-west-2"
    dynamodb_table = "unlimit-up-locks"
    encrypt = true
  }
}