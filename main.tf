provider "aws" {
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami = "ami-7c22b41c"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags {
    Name = "terraform-example"
  }
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 8080
}

variable "aws_access_key" {
  description = "Please input your AWS access key, make sure it has root access to create and change EC2 instances."
}

variable "aws_secret_key" {
  description = "Please input your AWS secret key, make sure it has root access to create and change EC2 instances."
}

output "public_ip_that_is_running_your_app" {
  value = "${aws_instance.example.public_ip}"
}
