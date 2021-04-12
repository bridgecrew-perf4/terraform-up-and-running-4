provider "aws" {
    region = "us-east-2"    
}

resource "aws_instance" "example" {
    ami = "ami-01e7ca2ef94a0ae86"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-example"
    }
}