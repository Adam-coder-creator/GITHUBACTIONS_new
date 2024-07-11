
#Creating VPC
resource "aws_vpc" "new" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    #region = "eu-north-1"

tags = {
    name = "Main_VPC"
}

}

#Creating two subnets inside VPC
/*resource "aws_subnet" "new_part1"{
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
*/
resource "aws_subnet" "new" {
  count = length(var.cidr_block_01)

  vpc_id     = aws_vpc.new.id
  cidr_block = var.cidr_block_01[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_01[count.index]
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

#Creating function route table association
resource "aws_route_table_association" "new_function"{
    count = length(var.cidr_block_01)
    subnet_id = aws_subnet.new[count.index].id
    route_table_id = aws_route_table.main_route_table.id
}

#Creating security group
resource "aws_security_group" "allow_tls"{
    description = "Allow specific inbound traffic and all outbound traffic"
    vpc_id = aws_vpc.new.id
    name = "allow TLS"

    tags ={
        Name = "Main_security-group"
    }
}

#Creating rules
resource "aws_vpc_security_group_ingress_rule" "allow_tls"{
    cidr_ipv4 = aws_vpc.new.cidr_block
    from_port = 22
    to_port = 22
    security_group_id = aws_security_group.allow_tls.id
    ip_protocol = "tcp"
    
    tags ={
        Name = "First_rule"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_2"{
    cidr_ipv4 = "0.0.0.0/0"
    #from_port = 22
    #to_port = 22
    security_group_id = aws_security_group.allow_tls.id
    ip_protocol = "-1"
    
    tags ={
        Name = "Second_rule"
    }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 

  tags ={
    Name = "First_egress"
  }
}