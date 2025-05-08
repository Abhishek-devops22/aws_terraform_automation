# create a default security group
resource "aws_default_security_group" "default-sg" {
    vpc_id = var.vpc_id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.env_prefix}-default-sg"
    }
}

# get the latest Amazon Linux AMI
data "aws_ami" "latest-amazon-linux" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        # values = ["al2023-ami-*-x86_64"]
        values = [var.image_name]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
  
}
# create a key pair
resource "aws_key_pair" "ssh-key" {
  key_name = "ssh-key"
  public_key = file(var.public_key_location)
  
}

# create an EC2 instance
resource "aws_instance" "myapp-server" {
  ami = data.aws_ami.latest-amazon-linux.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  security_groups = [aws_default_security_group.default-sg.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.ssh-key.key_name
  user_data = file("./entryscript.sh")
  
  tags = {
    Name = "${var.env_prefix}-server"
  }

}