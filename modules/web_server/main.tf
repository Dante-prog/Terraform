## PROVIDER CONFIGURATION
provider "aws" {
  token = var.linode_token
}

locals {
    prefix = var.prefix != "" ? "${var.prefix}-" : ""
}

# RESOURCE DEFINITIONS
resource "linode_instance" "web-servers" {
    for_each = var.server_settings
    label = "${local.prefix}${lower(each.key)}"
    image = var.image
    private_ip = true
    region = var.region
    type = each.value.type_image
    root_pass = var.root_password
    authorized_keys = [var.ssh_public_key]
}