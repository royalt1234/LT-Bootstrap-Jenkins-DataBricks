variable "region" {
  type = string
  description = "name of the region"
}

variable "alpha-template" {}

variable "name_prefix" {
  type = string
  description  = "name of launch template"
}

variable "image_id" {
  type = string
  description = "ami to use"
}

variable "instance_type" {
  type = string
  description = "your preferred instance type"
}

variable "key_name" {
  type = string
  description = "your keypair name"
}

variable "availability_zones" {
  type = string
}

variable "volume_size" {
  type = string
  description = "volume size of your ebs volume"
}