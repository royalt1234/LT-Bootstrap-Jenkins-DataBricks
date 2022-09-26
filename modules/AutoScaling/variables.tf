variable "alpha-template" {}

variable "aws_lb_target_group" {}

variable "vpc_id" {
  ##### vpc id here ####
}

variable "subnet_id" {
  ##### 1st subnet_id here ####
}

variable "subnet_id" {
  ##### 2nd subnet_id here ####
}

variable "asg_name" {
  type = "string"
  description = "autoscaling group name"
}

variable "desired_capacity" {
  type = number
  description = "number of desired capacity"
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "availability_zones" {
  type = string
}