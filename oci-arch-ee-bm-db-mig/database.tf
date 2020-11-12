## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


resource "oci_database_db_system" "test_db_system1" {
  availability_domain = local.ad
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
  subnet_id               = oci_core_subnet.subnet_2.id
  ssh_public_keys         = [tls_private_key.public_private_key_pair.public_key_openssh]
  hostname                = var.hostname
}


