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
  subnet_id           = oci_core_subnet.subnet_1.id
  fault_domain        = "FAULT-DOMAIN-1"

source_details {
    source_type             = "image"
    source_id               = data.oci_core_images.InstanceImageOCID.images[0].id
    boot_volume_size_in_gbs = "50"
  }

  metadata = {
    ssh_authorized_keys = chomp(file(var.ssh_public_key))
  }

  timeouts {
    create = "60m"
  }
}


