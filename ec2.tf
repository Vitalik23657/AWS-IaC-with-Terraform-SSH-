data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = ["cmtr-m0n4rtob-vpc"]
  }
}

data "aws_security_group" "sg" {
  filter {
    name   = "group-name"
    values = ["cmtr-m0n4rtob-sg"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}

data "aws_subnet" "public" {
  id = data.aws_subnets.public.ids[0]
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "cmtr-m0n4rtob-ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  subnet_id = data.aws_subnet.public.id

  vpc_security_group_ids = [
    data.aws_security_group.sg.id
  ]

  key_name = aws_key_pair.cmtr-m0n4rtob-keypair.key_name

  associate_public_ip_address = true

  tags = {
    Name    = "cmtr-m0n4rtob-ec2"
    Project = "epam-tf-lab"
    ID      = "cmtr-m0n4rtob"
  }
}
