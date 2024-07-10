
#Creating VPC
resource "aws_vpc" "new" {
    cidr_block = "10.0.0.0/16"
    #region = "eu-north-1"

tags = {
    name = "Main_VPC"
}

}

#Creating two subnets inside VPC
resource "aws_subnet" "new_part1"{
    vpc_id = aws_vpc.new.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
 
    tags = {
        Name = "Main_subnet_1"
 }

}

resource "aws_subnet" "new_part2"{
    vpc_id = aws_vpc.new.id 
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true

    tags = {
        Name = "Main_subnet_2"
    }

}

#Creating Internet Gateway
resource "aws_internet_gateway" "new_igtw" {
    vpc_id = aws_vpc.new.id

    tags ={
        Name = "Main_internet_gateway"
    }
}

#Creating route table on existing VPC
resource "aws_route_table" "main_route_table" {
    vpc_id = aws_vpc.new.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.new_igtw.id
    }
    tags = {
        Name = "Route_Table"
    }
  
}