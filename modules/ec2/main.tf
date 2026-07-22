resource "aws_instance" "ec2" {

  ami           = var.ami_id
  instance_type = var.instance_type

  monitoring = true

  ebs_optimized = true

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {

    encrypted = true

    volume_type = "gp3"

    volume_size = 20

    delete_on_termination = true

  }

  tags = {
    Name = var.instance_name
  }

}