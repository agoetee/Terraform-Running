provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0b0ea68c435eb488d"
    instance_type = "t2.micro"

    tags = {
    Name = "TerraRun"
    }
}