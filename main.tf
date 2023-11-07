provider "linode" {
  token = var.linode_token
}

#Count meta argument for creating multiple instances
# resource "linode_instance" "web-instances" {
#   count =  3
#   label = "web-${count.index}"
#   image = var.linode_config.image
#   private_ip = true
#   region = var.linode_config.region
#   type = var.linode_config.type_image
#   root_pass = var.root_password
#   authorized_keys = [var.ssh_public_key]
# }


# Using the For each meta argument 
resource "linode_instance" "web-instances-web" {
  for_each = var.environment_instance_settings
  label = "web-${lower(each.key)}"
  image = each.value.image
  private_ip = true
  region = each.value.region
  type = each.value.type_image
  root_pass = var.root_password
  authorized_keys = [var.ssh_public_key]
}