provider "linode" {
  token = var.linode_token
}


resource "linode_instance" "web-instances" {
  count =  3
  label = "web-${count.index}"
  image = var.image
  private_ip = true
  region = var.region
  type = var.type_image
  root_pass = var.root_password
  authorized_keys = [var.ssh_public_key]
}


