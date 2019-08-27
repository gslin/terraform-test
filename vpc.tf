provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "gslin-terraform-test"
    region = "us-east-1"
    key = "remote/terraform.tfstate"
    dynamodb_table = "gslin-terraform-test-lock"
  }
}

resource "aws_vpc" "test" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "test"
  }
}

resource "aws_subnet" "SN-fixed-1a" {
  vpc_id = "${aws_vpc.test.id}"
  cidr_block = "10.10.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "SN-test-fixed-1a"
  }
}

resource "aws_subnet" "SN-fixed-1b" {
  vpc_id = "${aws_vpc.test.id}"
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "SN-test-fixed-1b"
  }
}
