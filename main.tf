terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.61"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      "SomeTag" = "SomeTagValue"
    }
  }
}
