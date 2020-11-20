# oci-arch-db-migration

This repository stores a variety of examples demonstrating how to provision the infrastructure needed for 4 Database Migration use cases.

## How this project is organized

The terraform code for each Database Migration use case is stored in a separate folder.

The folders are organized as follows:

- [oci-arch-ee-atp-db-mig](oci-arch-ee-atp-db-mig): launch the VCN, a compute instance and an Autonomous Transaction Processing database.
- [oci-arch-ee-bm-db-mig](oci-arch-ee-bm-db-mig): launch the VCN, a compute instance and a Bare Metal Database System.
- [oci-arch-ee-exa-db-mig](oci-arch-ee-exa-db-mig): launch the VCN, a compute instance and a Exadata Cloud Service Database System.
- [oci-arch-se-vm-db-mig](oci-arch-se-vm-db-mig): launch the VCN, a compute instance and a Virtual Machine Database System.

## Prerequisites

First off we'll need to do some pre deploy setup.  That's all detailed [here](https://github.com/oracle/oci-quickstart-prerequisites).


