terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "trailmapper"
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = var.ami_type
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = var.instance_name
  }
}