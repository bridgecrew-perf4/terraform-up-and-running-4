provider "aws" {
  region  = "us-east-2"
  profile = "tf_dev"
}

terraform {
  backend "s3" {
    region  = "us-east-2"
    profile = "tf_dev"
    bucket  = "dz-terraform-state"
    key     = "stage/services/webserver-cluster/terraform.tfstate"

    dynamodb_table = "dz-terraform-up-and-running-locks"
    encrypt        = true
  }

}


module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster-name           = "webserver-cluster"
  db-remote-state-bucket = "dz-terraform-state"
  db-remote-state-key    = "stage/services/webserver-cluster/terraform.tfstate"
}
