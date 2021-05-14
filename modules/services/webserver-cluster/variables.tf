variable "server_port" {
  description = "The HTTP server listener port"
  type        = number
  default     = 8080
}

variable "cluster-name" {
  description = "The name to use for all cluster resources"
  type = string
}

variable "db-remote-state-bucket" {
  description = "The name of the S3 bucket for the datatbase's remote state"
  type = string
}

variable "db-remote-state-key" {
  description = "The path for the database's remote state in S3"
  type = string
}
