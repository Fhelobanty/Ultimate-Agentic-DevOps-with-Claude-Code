# Terraform Backend Configuration
#
# IMPORTANT: Uncomment the backend block below AFTER the initial deployment.
#
# Step 1: First run `terraform init` without this backend uncommented
# Step 2: Run `terraform apply` to create all resources (including the state bucket)
# Step 3: Uncomment the backend block below
# Step 4: Run `terraform init -migrate-state` to migrate state to S3
#
# terraform {
#   backend "s3" {
#     bucket         = "YOUR_STATE_BUCKET_NAME"
#     key            = "terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
