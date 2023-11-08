terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.30.0"
    }
  }
}

## PROVIDER CONFIGURATION
provider "linode" {
  token = var.linode_token
}

locals {
    prefix = var.prefix != "" ? "${var.prefix}-" : ""
}

# RESOURCE DEFINITIONS
resource "linode_instance" "web-servers" {
    for_each = var.server_settings
    label = each.value.labels
    image = each.value.image
    private_ip = true
    region = each.value.region
    type = each.value.type_image
    root_pass = var.root_password
    authorized_keys = [var.ssh_public_key]
}

