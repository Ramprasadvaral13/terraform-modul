variable "vpc_cidr" {
    type = string
  
}

variable "subnet" {
    type = map(object({
      cidr = string
      az = string
      public = string
    }))
  
}

variable "route_cidr" {
    type = string
    sensitive = true
  
}