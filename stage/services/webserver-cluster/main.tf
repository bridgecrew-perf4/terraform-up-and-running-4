provider "aws" {
  region = "us-east-2"
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster-name           = "webserver-${enviro}"
  db-remote-state-bucket = "dz-terraform-state"
  db-remote-state-key    = "${enviro}/data-stores/mysql/terraform.tfstate"
  enviro                 = "stage"
}
