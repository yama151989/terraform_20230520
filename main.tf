terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  # AWSCLIの初期設定で指定したプロファイル。このIAMユーザーの情報で接続する。
  profile = "terraform"
  region  = "ap-northeast-1"
}

# 変数を2つ定義する。値は、「terraform.tfvars」で指定。
variable "project" {
  type = string
}

variable "environment" {
  type = string
}
