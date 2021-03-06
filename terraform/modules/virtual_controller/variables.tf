#
# Required Parameters
#

variable "os_cloud" {
  description = "OpenStack creds in clouds.yaml"
  type = string
}

variable "cluster_name" {
  description = "Name of the mangum cluster created"
  type = string
}

variable "image_name" {
  description = "Name of image in openstack cloud"
  type = string
}

variable "flavor_name" {
  description = "Name of baremetal flavor. Must match hostnames."
  type = string
}

variable "key_pair" {
  description = "Name of key_pair to inject"
  type = string
}

variable "networks" {
  description = "List of network names"
  type = list(string)
}

variable "vm_count" {
  description = "Number of vms to create"
  type = number
}

#
# Optional Parameters
#

variable "inventory_location" {
   description = "location of generated inventory"
   type = string
   default = "../inventory/controller"
}

variable "inventory_groupname" {
   description = "inventory groupname"
   type = string
   default = "login"
}

variable "availability_zone" {
  description = "OpenStack AZ name"
  type = string
  default = "nova"
}

variable "hostname_prefix" {
  description = "Add a prefix to supplied hostname pattern"
  type = string
  default = "vm"
}
