/*terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  cloud {
    organization = "neeamradia"

    workspaces {
      name = "RoboPhazis-main"
    }
  }
}*/

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "neeamradia"

    workspaces {
      name = "RoboPhazis-main"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "RoboPhazis-EC2" {
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"

  lifecycle {
    ignore_changes = [ami]
  }
}