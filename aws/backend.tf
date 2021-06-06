terraform {
  backend "s3" {
    bucket                  = "ohr486.terraform"               # SET YOUR BUCKET
    key                     = "blog-sample-app-runner.tfstate" # SET YOUR KEY
    region                  = "ap-northeast-1"
    dynamodb_table          = "tfstate"                        # SET YOUR DDB TABLE
    shared_credentials_file = "./credentials"
    profile                 = "blog-sample-app-runner"         # SET YOUR PROFILE
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                  = "ap-northeast-1"
  shared_credentials_file = "./credentials"
  profile                 = "blog-sample-app-runner" # SET YOUR PROFILE
}
