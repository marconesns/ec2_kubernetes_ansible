variable "aws_ami_id" {
  type = string
  default = "ami-03f65b8614a860c29"
}

variable "chave" {
  type = string
  default = "ec2-key"
}

variable "regiao_aws" {
  type = string
  default = "us-west-2"
}

variable "ami_type" {
  type = string
  default = "t3.large"
}