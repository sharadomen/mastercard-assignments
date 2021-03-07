variable "ENV" {
}

variable "instancetype" {
  default = "t2.micro"
}

variable "PUBLIC_SUBNETS" {
  type = list
}

variable "PRIVATE_SUBNETS" {
  type = list
}

variable "VPC_ID" {
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/envkey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/envkey.pub"
}

# variable "AMIS" {
#   type = map(string)
#   default = {
#     us-east-1 = "ami-09943f9da1f1b7899"
#     us-west-2 = "ami-00f1e37d20049f858"
#     eu-west-1 = "ami-0d67111dcacb4a14a"
#   }
# }