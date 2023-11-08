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


# MAP OBJECTS FOR CREATING VARIABLES
# variable "environment_instance_settings" {
# default = {
#     "dev" = {
#         region = "us-east"
#         image = "linode/ubuntu20.04"
#         type_image = "g6-nanode-1"
#         labels = {
#           environment = "dev"
#         }
#     }
#     "prod" = {
#         region = "us-east"
#         image = "linode/ubuntu20.04"
#         type_image = "g6-standard-2"
#         labels = {
#           environment = "prod"
#         }
#     }
#     "qa" = {
#         region = "us-east"
#         image = "linode/ubuntu20.04"
#         type_image = "g6-standard-1"
#         labels = {
#           environment = "qa"
#         }
#     }
# }
# }

# MAP OBJECTS FOR CREATING VARIABLES
variable "environment_instance_settings" {
  type = map(object({type_image=string, labels=map(string)}))
  default = {
    "DEV" = {
      region = "us-east"
      type_image = "g6-nanode-1"
      image = "linode/ubuntu20.04"
      labels = {
        environment = "dev"
      }
    },
   "QA" = {
      region = "us-east"
      image = "linode/ubuntu20.04"
      type_image = "g6-standard-1"
      labels = {
        environment = "qa"
      }
    },
    "PROD" = {
      region = "us-east"
      image = "linode/ubuntu20.04"
      type_image = "g6-standard-2"
      labels = {
        environment = "prod"
      }
    }
  }
}

// Target Environment
variable "target_environment" {
  description = "The target environment to deploy to"
  type = string
  default = "DEV"
}

// Environment machine Type
variable "environment_machine_type" {
  description = "The machine type to deploy to"
  default = {
    "DEV" = "g6-nanode-1"
    "PROD" = "g6-standard-2"
    "QA" = "g6-standard-1"
  }
}

// Environment Map
variable "environment_map" {
  type = map(string)
  description = "The environment map"
  default = {
    "DEV" = "dev"
    "PROD" = "prod"
    "QA" = "qa"
  }
}
