resource "aws_security_group" "sg-micro-pj"{
    description = "Http Access from web and ssh"
    vpc_id = var.vpc-id
    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "ec2-instance-pb"{
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  availability_zone = var.availability_zone
  key_name = var.key-id
  vpc_security_group_ids = [aws_security_group.sg-micro-pj.id]
  
  user_data = file(var.user-data)
  tags ={
    "Name" = "Ec2-micro-instance-public"
  }
}
