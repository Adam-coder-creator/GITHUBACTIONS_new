# EC2 monitoring"
# File description :
## provaider.tf
*In this file we adding our provider (AWS) to interact with the resources which we create in futher action.*
## VPCwithcomponenets.tf
*We declare all the resources needed to create the VPC such as subnet, internet gateway, route table and function which is*
*responsible for conneting all this pices together. As well we created security group as a security level of our EC2 instance.*
## variable.tf
*To make project a bit more complex , to create our subnets inside our VPC we used variables which are declarete is separate folder.*
## EC2_instance.tf
*After when we created whole VPC with all resoures , its time to create EC2 instance in each subnet (require public IPv4 access to install*
*zabbix server)*
## user-data.sh
*File in which we write bash commands to run the instalation procces after lounching EC2 instances.*

## Installing zabbix on EC2 instance steps (all steps shows in the file). 

## Instruction (steps to execute EC2 instance):
*1.Run terraform init*

*2.Run terraform plan*

*3.Run terraform apply*
## Summary
*As a result of this project we create EC2 instance and install zabbix to provides monitoring metrics, such as network utilization, CPU load and disk space consumption*