terraform {
  backend "s3" {
    bucket       = "rohith-demo-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}