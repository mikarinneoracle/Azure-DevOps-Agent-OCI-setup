variable "region" {
  description = "Your region"
}

variable "compartment_ocid" {
  description = "Compartment for Agent"
}

variable "vm_image_name" {
  default = "Oracle-Linux-8.10-2024.09.30-0"
  description = "Agent image"
}

variable "vm_shape" {
  default = "VM.Standard.E4.Flex"
  description = "Agent shape"
}

variable "vm_shape_ocpus" {
  default = "1"
  description = "Agent OCPUs"
}

variable "vm_shape_mem" {
  default = "8"
  description = "Agent memory (GB)"
}

variable "ssh_public_key" {
  description = "Your public ssh key to login to the Agent vm"
  default = ""
}

variable "agent_file" {
  description = "Azure Devops Agent tar file"
  default = "https://vstsagentpackage.azureedge.net/agent/3.248.0/vsts-agent-linux-x64-3.248.0.tar.gz"
}

variable "agent_url" {
  description = "Azure Devops url for Agent"
}

variable "agent_pat" {
  description = "PAT for Agent"
}

variable "agent_pool" {
  default = "Default"
  description = "Azure DevOps Agent pool"
}

variable "tags" {
  default = "Created for Azure DevOps Agent"
}
