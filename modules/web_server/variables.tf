## VARIABLES OF THE MODULE  ##

variable "linode_token" {
  type = string
  description = "The Linode API token to use for Linode resources"
  
}

variable "server_settings" {
  type = map(object({
    type_image=string 
    labels=map(string)
  }))
}

variable "prefix" {
  type = string
  default = "web"
}

variable "region" {
  type = string 
}

variable "root_password" {
  type = string
  
}

variable "ssh_public_key" {
  type = string
}

variable "image" {
  type = string
  description = "The image to use for the Linode instance (e.g. linode/ubuntu20.04)"  
}
