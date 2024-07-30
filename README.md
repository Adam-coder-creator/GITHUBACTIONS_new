# EC2 with githubactions
# File description :
## main.tf
*In this file we adding our provider (AWS) to interact with the resources which we create in futher action like EC2 instance and*
*VPC with all components.*
## ci.yml
*After push command github is executing 3 actions in terraform , starting with terraform init, then terraform plan and if everthing* 
*is correct executing the instance using terraform apply.*

## Summary
*Simple CI/CD with github actions  .*