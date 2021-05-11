provider "aws" {
  region  = "us-east-2"
  profile = "tf_dev"
}

terraform {
  backend "s3" {
    region  = "us-east-2"
    profile = "tf_dev"
    bucket  = "dz-terraform-state"
    key     = "stage/data-stores/mysql/terraform.tfstate"


    dynamodb_table = "dz-terraform-up-and-running-locks"
    encrypt        = true
  }

}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = "example_database"
  username          = "admin"

  password = var.db_password
}

