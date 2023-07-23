variable "elb_az" {
  type = list
}

variable "elb_listener_port" {
  type = number
}

variable "elb_name" {
    type = string
}

variable "inst_type" {
    type = string
}

variable "inst_ami_id" {
    type = string
}

variable "inst_name" {
    type = string
}

variable "inst_count" {
    type = number  
}

variable "inst_subnet" {
    type = string 
}

variable "inst_sg"{
    type = string
}