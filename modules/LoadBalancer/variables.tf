variable "aws_lb_target_group" {}

variable "domain_name" {
  type = string
  description = "domain name which already exist"
}

variable "private_zone" {
  type = string
  description = "if the hosted zone is private or public. Values can only be true or false"
}

variable "sub_domain" {
  type = string
  description = "sub domain"
}

variable "lb_name" {
  type = string
  description = "name of load balancer"
}

variable "lb-tg-name" {
  type = string
  description = "name of load balancer target group"
}