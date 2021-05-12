provider "aws" {
  region  = "us-east-2"
  profile = "tf_dev"
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster-name           = "webserver-prod"
  db-remote-state-bucket = "dz-terraform-state"
  db-remote-state-key    = "${var.enviro}/data-stores/mysql/terraform.tfstate"
  enviro            = "prod"
}
