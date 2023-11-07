# output "web-server-ips" {
#   value = linode_instance.web-instances.*.ip_address // This is the older way which does not worok for more complex structures 
# }


output "web-server-ips-labels" {
  // New Way to output the values of the instances when it's a list or complex object 
  value = [for instance in linode_instance.web-instances-web : instance.ip_address]
}