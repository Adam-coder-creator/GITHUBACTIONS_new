
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