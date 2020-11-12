## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# This Terraform script provisions a compute instance

locals {
  # If ad_number is non-negative use it for AD lookup, else use ad_name.
  # Allows for use of ad_number in TF deploys, and ad_name in ORM.
  # Use of max() prevents out of index lookup call.
  # TODO: update to newer datasource?
  ad = var.ad_number >= 0 ? data.oci_identity_availability_domains.ads.availability_domains[max(0, var.ad_number)]["name"] : var.ad_name

}

# Create Compute Instance

resource "oci_core_instance" "compute_instance1" {
  availability_domain = local.ad
  compartment_id      = var.compartment_ocid
  display_name        = "App-Server"
  shape               = var.instance_shape
  fault_domain        = "FAULT-DOMAIN-1"
  source_details {
    source_type             = "image"
    source_id               = data.oci_core_images.InstanceImageOCID.images[0].id
    boot_volume_size_in_gbs = "50"
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet_1.id
    assign_public_ip = false 
  }
  metadata = {
    ssh_authorized_keys = tls_private_key.public_private_key_pair.public_key_openssh
  }
  timeouts {
    create = "60m"
  }
}

resource "oci_core_volume" "CreateVolume" {
  availability_domain = local.ad
  compartment_id = var.compartment_ocid
  display_name = var.volume_display_name
  size_in_gbs = var.volume_size_in_gbs
}

resource "oci_core_volume_attachment" "CreateVolumeAttachment" {
  count = var.volume_count
  attachment_type = var.volume_attachment_type
  instance_id = oci_core_instance.compute_instance1.id
  volume_id = oci_core_volume.CreateVolume.id
}
