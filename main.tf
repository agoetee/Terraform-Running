provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0b0ea68c435eb488d"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-INFO
    #!/bin/bash
    echo "<h2>Hello, Ghana!!</h2> <br> <p> You fine ong??</p>" > index.html
    nohup busybox httpd -f -p ${var.server_port} &
    INFO

    tags = {
    Name = "TerraRun"
    }
}

resource "aws_security_group" "instance" {
  name = "terrarun-instance-secGp"
  ingress {
    from_port = var.server_port
    to_port = var.server_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 8080
}

output "puplic_ip" {
  value =  aws_instance.my_instance.public_ip
  description = "The public IP address of the web server"
}