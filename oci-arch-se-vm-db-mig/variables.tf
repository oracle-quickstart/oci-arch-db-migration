## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Variables
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "availablity_domain_name" {}

variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.1"
}

# OS Images
variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "8"
}

variable "instance_shape" {
  default     = "VM.Standard.E3.Flex"
}

variable "instance_shape_flex_ocpus" {
    default = 1
}

variable "instance_shape_flex_memory" {
    default = 10
}

variable "ssh_public_key" {
  default = ""
}

variable "volume_display_name" {
   default = "AppVolume1"
}

variable "volume_size_in_gbs" {
  default = "100"
}

variable "volume_count" {
  default = "1"
}

variable "volume_attachment_type" {
  default = "paravirtualized"
  }

variable "db_system_shape" {
  default = "VM.Standard2.4"
}

variable "db_edition" {
  default = "STANDARD_EDITION"
}

variable "db_admin_password" {
}

variable "db_name" {
  default = "aTFdb"
}

variable "db_version" {
  default = "12.2.0.1"
}

variable "db_home_display_name" {
  default = "MyTFDBHome"
}

variable "db_disk_redundancy" {
  default = "HIGH"
}

variable "db_system_display_name" {
  default = "MyTFDBSystem"
}

variable "hostname" {
  default = "myoracledb"
}

variable "host_user_name" {
  default = "opc"
}

variable "n_character_set" {
  default = "AL16UTF16"
}

variable "character_set" {
  default = "AL32UTF8"
}

variable "db_workload" {
  default = "OLTP"
}

variable "pdb_name" {
  default = "pdbName"
}

variable "data_storage_size_in_gb" {
  default = "256"
}

variable "license_model" {
  default = "LICENSE_INCLUDED"
}

variable "node_count" {
  default = "1"
}

variable "data_storage_percentage" {
  default = "40"
}


variable "db_auto_backup_enabled" {
  default = "true"
}

variable "db_auto_backup_window" {
  default = "SLOT_TWO"
}

variable "db_recovery_window_in_days" {
  default = "45"
}


# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex"
  ]
}

# Checks if is using Flexible Compute Shapes
locals {
  is_flexible_node_shape = contains(local.compute_flexible_shapes, var.instance_shape)
}