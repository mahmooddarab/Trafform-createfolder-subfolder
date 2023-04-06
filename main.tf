terraform {
  required_providers {
    vsphere = {
      version = "2.2.0"
    }
  }
}
provider "vsphere" {
    user = "administrator@vsphere.local"
    password = "PASSWORD"
    vsphere_server = "IP_VCENTER"
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "Datacenter" {
  name = "Datacenter"

}

resource "vsphere_folder" "parent" {
  path = "mahmood"
  type = "vm"
  datacenter_id = data.vsphere_datacenter.Datacenter.id
}


resource "vsphere_folder" "subfolder" {
  
  #path = "parentfolder/subfolder"
  #shekle dovom be sorat dynamic
  path = "${vsphere_folder.parent.path}/database"
  type = "vm"
  datacenter_id = data.vsphere_datacenter.Datacenter.id
}