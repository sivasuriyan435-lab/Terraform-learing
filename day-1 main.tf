terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.34.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
}

# MAIN VPC
resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Terra-VPC"
  }
}

# PUBLIC SUBNET 
resource "aws_subnet" "public-sub" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Terra-Public-Subnet"
  }
}

# PRIVATE SUBNET 
resource "aws_subnet" "private-sub" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Terra-Private-Subnet"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "s3" {
  bucket = "my-tf-test-bucket-2404"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "s3-2" {
  bucket = "innovano tech"

  tags = {
    Name        = "innovano-1"
    Environment = "Dev"
  }
}
