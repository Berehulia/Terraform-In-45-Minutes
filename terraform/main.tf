terraform {

  backend "s3" {
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
  }
}

provider "aws" {

  region = var.region
}

module "iam" {

  source = "./modules/iam"
  env    = var.env
}

resource "aws_lambda_function" "function" {

  function_name    = "${var.env}-function"
  role             = module.iam.role_arn
  filename         = "../java/target/java-function-1.0.jar"
  source_code_hash = filebase64sha256("../java/target/java-function-1.0.jar")
  handler          = "dev.berehulia.Function"
  timeout          = 30
  runtime          = "java17"
  memory_size      = 256
}
