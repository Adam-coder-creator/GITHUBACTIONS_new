
#Creating VPC
resource "aws_vpc" "new" {
    cidr_block = "10.0.0.0/16"
    #region = "eu-north-1"

tags = {
    name = "Main_VPC"
}

}