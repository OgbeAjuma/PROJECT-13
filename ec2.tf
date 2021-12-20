resource "aws_instance" "webserver1-proj-13" {
  ami           = var.Ami-id2
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-proj13.id]
  subnet_id =  aws_subnet.pubsub-13-1.id
  availability_zone = "eu-west-2a"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver2-proj-13" {
  ami           = var.Ami-id2
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-proj13.id ]
  subnet_id =  aws_subnet.pubsub-13-2.id
  availability_zone = "eu-west-2b"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver3-proj-13" {
  ami           = var.Ami-id2
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-proj13.id ]
  subnet_id =  aws_subnet.pubsub-13-3.id
  availability_zone = "eu-west-2c"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}