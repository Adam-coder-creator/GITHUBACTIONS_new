#Variable to set the cidr_block of the subnet
variable "cidr_block_01" {
  type    = list(string)
  #default = ["10.0.1.0/24", "10.0.2.0/24"]
}
#Variable to set the name of the subnets
variable "name_01" {
  type        = list(string)
  description = "The name of the subnet."  
  #deafult = ["subnet-1" , "subnet-2"]
}
#Variable to set the AMI which we prefer
variable "ami" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
