variable "aws_region" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "environment" {
  type = string
}
variable "vpc_name" {}
variable "vpc_cidr" {}

variable "public_subnet_1_cidr" {}
variable "public_subnet_2_cidr" {}

variable "availability_zone_1" {}
variable "availability_zone_2" {}

