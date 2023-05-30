variable "workspace_iam_roles" {
  default = {
    dev  = "arn:aws:iam::756517308436:role/azure-devops-agent-role"
  }
}

variable "environment" {
  default = {
    default  = "dev"
    dev  = "dev"
  }
}

variable "aws_region" {
  default = {
    dev  = "eu-west-2"
  }
}

variable "availability_zone" {
  default = {
    dev  = "eu-west-2a"
  }
}

variable "aws_account_id" {

  default = {
    dev  = "000000000000"
  }
}
