module "vpc" {
  source = "./modules/vpc"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  public_subnets = [
    var.public_subnet_1_cidr,
    var.public_subnet_2_cidr
  ]

  availability_zones = [
    var.availability_zone_1,
    var.availability_zone_2
  ]

  environment = var.environment
}
module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
  environment = var.environment
}