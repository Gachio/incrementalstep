provider "aws" {
    region = "eu-west-1"
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
    instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"

    tags = {
        Name = "PoppaDynasty"
    }
}


# Remove the backend config
/*
terraform {
  backend "s3" {
    key = "workspaces-attempt/terraform.tfstate"
    bucket = "arm-running"
    region = "eu-west-1"
    dynamodb_table = "arm-running-locks"
    encrypt = true
  }
}
*/