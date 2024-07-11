variable "cidr_block_01" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "name_01" {
  type    = list(string)
  default = ["Main_subnet_1", "Main_subnet_2"]
}
