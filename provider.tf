terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}


terraform {
  backend "s3" {
    bucket = "goteti"
    key    = "path/to/terraform.tfstate"
    region = "ap-south-1"
  }
}
