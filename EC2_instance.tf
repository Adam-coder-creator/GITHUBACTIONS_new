#Creating EC2 instance on VPC
resource "aws_instance" "new_ec2"{
    #ami = "ami-07c8c1b18ca66bb07"
    ami = var.ami 
    instance_type = "t3.small"
    key_name = "New_pair"
    associate_public_ip_address = true
    count = length(var.cidr_block_01)
    subnet_id = aws_subnet.new[count.index].id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    user_data = "${file("user-data.sh")}"

}
   
