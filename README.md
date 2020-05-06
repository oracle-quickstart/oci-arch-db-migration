# oci-arch-db-migration

This repository stores a variety of examples demonstrating how to provision the infrastructure needed for 4 Database Migration use cases.

## How this project is organized

The terraform code for each Database Migration use case is stored in a separate folder.

The folders are organized as follows:

- [oci-arch-ee-atp-db-mig](oci-arch-ee-atp-db-mig): launch the VCN, a compute instance and an Autonomous Transaction Processing database.
- [oci-arch-ee-bm-db-mig](oci-arch-ee-bm-db-mig): launch the VCN, a compute instance and a Bare Metal Database System.
- [oci-arch-ee-exa-db-mig](oci-arch-ee-exa-db-mig): launch the VCN, a compute instance and a Exadata Cloud Service Database System.
- [oci-arch-ee-vm-db-mig](oci-arch-ee-vm-db-mig): launch the VCN, a compute instance and a Virtual Machine Database System.

## Prerequisites

First off we'll need to do some pre deploy setup.  That's all detailed [here](https://github.com/oracle/oci-quickstart-prerequisites).

## License

You may not use the identified files except in compliance with the Apache License, Version 2.0 (the "License.")

You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0. A copy of the license is also reproduced in LICENSE.md

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and limitations under the License.

