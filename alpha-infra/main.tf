provider "aws" {
  region = var.region
}

# resource "aws_s3_bucket" "terraform-state" {
#   bucket = var.bucket_name

# /* Only uncomment the force destroy after you have migrated the state away from the s3 backend. Then you can force destroy the s3 bucket */

#   # force_destroy = true
# }

# resource "aws_s3_bucket_versioning" "bucket-version" {
#   bucket = aws_s3_bucket.terraform-state.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "terraform-state" {
#   bucket = aws_s3_bucket.terraform-state.id
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }


# resource "aws_dynamodb_table" "backend-state-locks" {
#   name         = var.dynamodb_name
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

module "Autoscaling" {
  source              = "../modules/AutoScaling"
  alpha-template      = module.LaunchTemplate.alpha-template
  aws_lb_target_group = module.LoadBalancer.aws_lb_target_group
  name                = var.asg_name
  availability_zones  = var.availability_zones
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
}

module "LaunchTemplate" {
  source               = "../modules/LaunchTemplate"
  region               = var.region
  alpha-template       = module.LaunchTemplate.alpha-template
  name_prefix          = var.name_prefix
  image_id             = var.image_id
  instance_type        = var.instance_type
  volume_size          = var.volume_size
  iam_instance_profile = var.iam_instance_profile
  key_name             = var.key_name
  availability_zones   = var.availability_zones
}

module "LoadBalancer" {
  source              = "../modules/LoadBalancer"
  aws_lb_target_group = module.LoadBalancer.aws_lb_target_group
  domain_name         = var.domain_name
  private_zone        = var.private_zone
  sub_domain          = var.sub_domain
  lb_name             = var.lb_name
  lb-tg-name          = var.lb-tg-name
}

module "Security" {
  source               = "../modules/Security"
  iam_instance_profile = var.iam_instance_profile
}