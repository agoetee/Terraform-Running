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
    nohup busybox httpd -f -p 8080 &
    INFO

    tags = {
    Name = "TerraRun"
    }
}

resource "aws_security_group" "instance" {
  name = "terrarun-instance-secGp"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}