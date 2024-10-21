terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.70" # Does not work: "InvalidParameterValueException: Tags not supported in request"
#      version = "= 5.69" # Works
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
