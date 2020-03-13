# this section stores the terraform state for the s3 bucket in the terraform state bucket we created in step 1.
terraform {
  required_version = ">=0.12.19"
  
  backend "s3" {
    bucket = "tf-state" # the terraform state bucket has to be hand entered unfortunately
    key    = "tf_vpc_sub/terraform.tfstate"
    region = "us-east-1" # hand entered as well
    profile = "default" # hand entered as well
  }
}

# this is for an aws specific provider(not gcp or azure)
provider "aws" {
  version = "~> 2.44.0"
  region  = var.region
  profile = var.aws_profile
}