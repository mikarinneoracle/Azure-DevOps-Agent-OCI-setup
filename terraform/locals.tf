locals {
  image_id = one(toset([for image in data.oci_core_images.sources.images : image.id if image.display_name == var.vm_image_name]))
}