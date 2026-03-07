
# ---------------------------
# S3 Bucket for Terraform State
# ---------------------------

resource "aws_s3_bucket" "terraform_state" {
  bucket = "two-tier-webapp-bucket"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "dev"
  }
}

# Enable versioning for safety
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable encryption for security
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ---------------------------
# DynamoDB Table for State Locking
# ---------------------------

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "tf-state-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform State Lock Table"
    Environment = "dev"
  }
}
