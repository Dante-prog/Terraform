variable "linode_token" {
    description = "Linode API token"
    sensitive = true
  
}

variable "root_password" {
    description = "The root password for the Linode instance"
    sensitive = true
}

variable "ssh_public_key" {
    description = "The public SSH key to be added to the Linode instance"
}

variable "region" {
  type = string
  default = "us-east"
}

variable "image" {
  type = string
  default = "linode/ubuntu20.04"
  
}

variable "type_image" {
  type = string
  default = "g6-nanode-1"
  
}
