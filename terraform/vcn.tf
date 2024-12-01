data "oci_core_services" "agent_services" {
}

resource "oci_core_vcn" "agent_vcn" {
  compartment_id = var.compartment_ocid
  cidr_block     = "10.0.0.0/16"
  display_name   = "Agent VCN"
  dns_label      = "agent"
  freeform_tags = {
    Managed = var.tags
  }
}

resource "oci_core_internet_gateway" "agent_IG" {
  compartment_id = var.compartment_ocid
  display_name = "Agent Internet Gateway"
  enabled      = "true"
  freeform_tags = {
    Managed = var.tags
  }
  vcn_id = oci_core_vcn.agent_vcn.id
}

resource "oci_core_default_route_table" "agent_public_rt" {
  compartment_id = var.compartment_ocid
  display_name = "Agent Default Route Table"
  freeform_tags = {
    Managed = var.tags
  }
  manage_default_resource_id = oci_core_vcn.agent_vcn.default_route_table_id
  
  route_rules {
    description = "Internet Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.agent_IG.id
  }
}

resource "oci_core_subnet" "agent_public_subnet" {
  vcn_id              = oci_core_vcn.agent_vcn.id
  cidr_block          = "10.0.0.0/24"
  compartment_id      = var.compartment_ocid
  display_name        = "Agent Public Subnet"
  freeform_tags       = {
    Managed = var.tags
  }
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_default_route_table.agent_public_rt.id
}