# EC2 monitoring"
# File description:
## provider.tf
*In this file we adding our provider (AWS) to interact with the resources which we create in futher action.*
## VPCwithcomponenets.tf
*We declare all the resources needed to create the VPC such as subnet, internet gateway, route table and function which is*
*responsible for conneting all this pices together. As well we created security group as a security level of our EC2 instance.*
## variable.tf
*To make project a bit more complex , to create our subnets inside our VPC we used variables which are declarete is separate folder.*
*User is declares the variable of name of subnet , Cidr_block and the API image which will use to create EC2 instance"*
## EC2_instance.tf
*After when we created whole VPC with all resoures , its time to create EC2 instance in each subnet (require public IPv4 access to install*
*zabbix server)*
## user-data.sh
*File in which we write bash commands to execute them on previously created EC2 instance.*

## Instruction (steps to execute EC2 instance):
*1.Run terraform init*

*2.Run terraform plan*

*3.Run terraform apply*
## Summary
*As a result of this project we create EC2 instance and run simple bash command to execute it on EC2 instances. As a result we see the*
*newly created file hello.txt with message included insied "Hello World!"*
## GitHub Actions
*Added simple workflow which is checking the validation of the code.*
## wersja2.0