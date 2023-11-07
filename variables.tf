variable "linode_token" {
    description = "Linode API token"
    sensitive = true
  
}

### OBJECT WAY OF CREATING VARIABLES
variable "linode_config" {
  description = "Configuration for the Linode instance"
  type = object({
    region         = string
    image          = string
    type_image     = string
  })
  default = {
    region         = "us-east"
    image          = "linode/ubuntu20.04"
    type_image     = "g6-nanode-1"
  }
  // sensitive = true // Mark as sensitive if any of the attributes are sensitive.
}

### NORMAL WAY OF CREATING VARIABLES
variable "root_password" {
    description = "The root password for the Linode instance"
    sensitive = true
}

variable "ssh_public_key" {
    description = "The public SSH key to be added to the Linode instance"
}

# variable "region" {
#   type = string
#   default = "us-east"
# }

# variable "image" {
#   type = string
#   default = "linode/ubuntu20.04"
  
# }

# variable "type_image" {
#   type = string
#   default = "g6-nanode-1"
  
# }


