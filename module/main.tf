module "s3" {
    source = "./s3"
    bucket_name = var.bucket_name 
    depends_on = [ module.vpc1 ]
  
}
module "vpc1" {
  source = "./vpc"
  cidr = var.cidr
  vpc1 = var.vpc
}

module "ami" {
  source = "./ec2"
  ami = var.ami
  instance = var.instance
  
}