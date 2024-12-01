data "oci_core_images" "sources" {
    compartment_id = var.compartment_ocid
}

data "template_file" "init" {
  template = "${file("${path.module}/init.tpl")}"
  vars = {
    filename = "${var.agent_file}",
    pat = "${var.agent_pat}",
    url = "${var.agent_url}",
    pool = "${var.agent_pool}"
  }
}