terraform {
  #required_version = "~> 1.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.74.2"
    }
    #datadog = {
    #  source = "DataDog/datadog"
    #}
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "twks-cohort"
    workspaces {
      prefix = "five-lab-iam-profiles-"
    }
  }
}

provider "aws" {
  #region = var.aws_default_region
  region = "eu-central-1"
  access_key="ASIA3JVLIUIHAWYFMAE3"
  secret_key="oAZ4HaBhtjR1bW28x7xotiMlDmOrB5UT7fK5e3tI"

  # this section commented out during the initial bootstrap run
  # once the assumeable roles are created, uncomment and change
  # secrethub.*.env to contain the appropriate service account identity
  #assume_role {
  #  role_arn     = "arn:aws:iam::${var.aws_account_id}:role/${var.aws_account_role}"
  #  session_name = "lab-iam-profiles"
  #}

  default_tags {
    tags = {
      pipeline = "five-lab-iam-profiles"
    }
  }
}

#provider "datadog" {
#  api_key = var.datadog_api_key
#  app_key = var.datadog_app_key
#}
