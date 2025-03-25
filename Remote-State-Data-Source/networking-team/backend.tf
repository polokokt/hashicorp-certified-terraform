terraform {
  backend "s3" {
    bucket = "terraform-backend"            # s3 bucket name
    key    = "network/eip.tfstate"    # path and file name in the s3 bucket
    region = "eu-central-1"
    dynamodb_table = "terraform-state-locking"  # table created in dynamodb with proper filed, according to the documentation (LockID , type String)
  }
}