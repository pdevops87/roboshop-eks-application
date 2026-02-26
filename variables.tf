variable "ami" {
  default="ami-0220d79f3f480ecf5"
}
variable "instance_type" {
  default="t2.micro"
}
variable "zone_id"{
  default="Z08520602FC482APPVUI7"
}

variable "env" {
  default = "dev"
}
variable "components" {
  default = {
    mongodb     =   ""
    redis       =   ""
    mysql       =   ""
    rabbitmq    =   ""
  }
}