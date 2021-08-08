provider "aws" {
  region = var.region
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "emyeukhoahoc"

    workspaces {
      prefix = "dailycookies-tfc-"
    }
  }
}
