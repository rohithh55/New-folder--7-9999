module "ec2" {
  source = "./modules/ec2"

  ami_id         = var.ami_id
  instance_type  = var.instance_type
  instance_name  = var.instance_name
}
module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
  environment = var.environment
}