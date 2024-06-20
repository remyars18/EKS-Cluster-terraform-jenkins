terraform {
  backend "s3" {
    bucket = "eks-cluster-terra-state"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}