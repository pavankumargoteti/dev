terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"

    }
  }
}

terraform {
  backend "s3" {
    bucket = "gotetipavankumar"
    key    = "path/to/terraform.tfstate"
    region = "ap-south-1"
  }
}

