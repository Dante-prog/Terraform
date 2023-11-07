output "web-server-ips" {
  value = linode_instance.web-instances.*.ip_address
}