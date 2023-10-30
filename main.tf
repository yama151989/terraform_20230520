terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  # AWSCLIの初期設定で指定したプロファイル。このIAMユーザーの情報で接続する。
  profile = "terraform"
  region  = "ap-northeast-1"
}
