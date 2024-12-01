resource "oci_core_instance" "agent_vm" {
  availability_domain = lookup(data.oci_identity_availability_domains.this.availability_domains[0], "name")
  compartment_id      = var.compartment_ocid
  display_name        = var.agent_vm_name
  shape               = var.vm_shape
  freeform_tags = {
    Managed = var.tags
  }
  
  shape_config {
    baseline_ocpu_utilization = "BASELINE_1_1"
    memory_in_gbs     = var.vm_shape_mem
    ocpus             = var.vm_shape_ocpus
  }

  create_vnic_details {
    assign_private_dns_record = true
    subnet_id                 = oci_core_subnet.agent_public_subnet.id
    display_name              = "Agent VNIC"
    assign_public_ip          = true
    freeform_tags = {
      Managed = var.tags
    }
  }

  source_details {
    source_type = "image"
    source_id   = local.image_id
    boot_volume_size_in_gbs  = var.vm_shape_disk
  }

  metadata = {
    user_data           = base64encode(data.template_file.init.rendered)
  }

}