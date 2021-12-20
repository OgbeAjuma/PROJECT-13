variable "vpc-cidr13" {
    default = "10.0.0.0/16"
    description = "vpc cidr block"
    type =string
}

variable "public-subnet-13-1" {
    default = "10.0.1.0/24"
    description = "public subnet 001 cidr block"
    type =string
}

variable "public-subnet-13-2" {
    default = "10.0.2.0/24"
    description = "public sub 002 cidr block"
    type =string
}

variable "public-subnet-13-3" {
    default = "10.0.3.0/24"
    description = "public sub 003 cidr block"
    type =string
}

variable "private-subnet-13-1" {
    default = "10.0.4.0/24"
    description = "private sub 001 cidr block"
    type =string
}

variable "private-subnet-13-2" {
    default = "10.0.5.0/24"
    description = "private sub 002 cidr block"
    type =string
}

variable "private-subnet-13-3" {
    default = "10.0.6.0/24"
    description = "private sub 003 cidr block"
    type =string
}

variable "Ami-id2" {
  description = "Ami id 2"
  type        = string
  default     = "ami-0fc15d50d39e4503c"
}

variable "region-1" {
  description = "region variable"
  type        = string
  default     = "eu-west-2"
}