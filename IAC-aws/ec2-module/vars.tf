variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "ami" {
  type = string
}
variable "availability_zone" {
  type = string
}
variable "key-id" {
    type = string
}
variable "vpc-id" {
    type = string
}
variable "public_subnet_id" {
  type = string
}
variable "user-data" {
    type = string
  
}