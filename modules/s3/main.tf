resource "aws_s3_bucket" "bucket" {

  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

#############################
# Versioning
#############################

resource "aws_s3_bucket_versioning" "versioning" {

  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

#############################
# Server Side Encryption
#############################

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {

  bucket = aws_s3_bucket.bucket.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

#############################
# Public Access Block
#############################

resource "aws_s3_bucket_public_access_block" "public_access" {

  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true

}

#############################
# Lifecycle Configuration
#############################

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {

  bucket = aws_s3_bucket.bucket.id

  rule {

    id = "cleanup"

    status = "Enabled"

    expiration {
      days = 365
    }

  }

}