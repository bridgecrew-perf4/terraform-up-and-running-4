provider "aws" {
  profile = "tf_dev"
  region  = "us-east-2"
}

terraform {
  backend "s3" {
    region  = "us-east-2"
    profile = "tf_dev"
    bucket  = "dz-terraform-state"
    key     = "global/s3/terraform.tfstate"


    dynamodb_table = "dz-terraform-up-and-running-locks"
    encrypt        = true
  }

}

resource "aws_instance" "dz-example" {
  ami           = "ami-00399ec92321828f5"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}