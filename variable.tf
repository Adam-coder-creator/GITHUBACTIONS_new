variable "cidr_block_01" {
  type    = list(string)
  #default = ["10.0.1.0/24", "10.0.2.0/24"]
}

#variable "name_01" {
  #type    = list(string)
 # default = ["Main_subnet_1", "Main_subnet_2"]
#}
/*
variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block of the VPC."
}
*/
variable "name_01" {
  type        = list(string)
  description = "The name of the subnet."  
}
/*
variable "cidr_block_01" {
  type        = string
  description = "The CIDR block of the subnet."
  validation {
   # condition     = cidrsubnet(var.cidr_block_01, 8, 0) #== var.cidr_block_01
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/\\d{1,2}$", var.cidr_block_01))
    error_message = "The subnet CIDR block must be a valid subnet within the VPC CIDR block."
  }
}
*/

variable "ami" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
