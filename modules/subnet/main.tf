# create a subnet
resource "aws_subnet" "myapp-subnet-1" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr_block
    availability_zone = "ap-south-1a"
    tags = {
        Name = "${var.env_prefix}-subnet-1"
    }
}

resource "aws_internet_gateway" "myapp-igw" {
    vpc_id = var.vpc_id
    tags = {
        Name = "${var.env_prefix}-igw"
    }
}


resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = var.default_route_table_id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }
    tags = {
        Name = "${var.env_prefix}-main-rtb" 
    }
}