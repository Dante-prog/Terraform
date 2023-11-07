provider "linode" {
  token = var.linode_token
}


resource "linode_instance" "web-instances" {
  count =  3
  label = "web-${count.index}"
  image = var.linode_config.image
  private_ip = true
  region = var.linode_config.region
  type = var.linode_config.type_image
  root_pass = var.root_password
  authorized_keys = [var.ssh_public_key]
}


