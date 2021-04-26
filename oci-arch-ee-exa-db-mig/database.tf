## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


resource "oci_database_db_system" "test_db_system1" {
  availability_domain = var.availablity_domain_name
  compartment_id      = var.compartment_ocid
  cpu_core_count      = var.db_system_cpu_core_count
  database_edition    = var.db_edition

  db_home {
    database {
      admin_password = var.db_admin_password
      db_name        = var.db_name
      pdb_name       = var.pdb_name
      character_set  = var.character_set
      ncharacter_set = var.n_character_set
      db_workload    = var.db_workload
      db_backup_config {
        auto_backup_enabled = var.db_auto_backup_enabled
        auto_backup_window  = var.db_auto_backup_window
        recovery_window_in_days = var.db_recovery_window_in_days
      }
    }
    db_version = var.db_version
  }

  shape                   = var.db_system_shape
  cluster_name            = var.db_cluster_name
  subnet_id               = oci_core_subnet.subnet_2.id
  nsg_ids                 = [oci_core_network_security_group.dbclnsg.id]
  backup_subnet_id        = oci_core_subnet.subnet_3.id
  ssh_public_keys         = var.ssh_public_key == "" ? [tls_private_key.public_private_key_pair.public_key_openssh] : [tls_private_key.public_private_key_pair.public_key_openssh, var.ssh_public_key]
  hostname                = var.hostname
  license_model           = var.license_model
  defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

data "oci_identity_region_subscriptions" "home_region_subscriptions" {
    tenancy_id = var.tenancy_ocid

    filter {
      name   = "is_home_region"
      values = [true]
    }
}

data "template_file" "key_script" {
  template = file("./scripts/sshkey.tpl")
  vars = {
    ssh_public_key = tls_private_key.public_private_key_pair.public_key_openssh
  }
}

data "template_cloudinit_config" "cloud_init" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "ainit.sh"
    content_type = "text/x-shellscript"
    content      = data.template_file.key_script.rendered
  }
}

