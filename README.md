# 🚀 GCP Website Deployment using Terraform

This project defines the infrastructure required to deploy a website to Google Cloud Platform (GCP) using [Terraform](https://www.terraform.io/), following the Infrastructure as Code (IaC) approach.

---

## 🌐 Overview

This repository contains Terraform templates to provision and manage cloud infrastructure on GCP.  
It includes setting up a Compute Engine instance, startup scripts, firewall rules, and more.

---

## 🛠️ Technologies Used

- **Google Cloud Platform (GCP)**
- **Terraform**
- **Compute Engine**
- **Cloud Firewall**
- **Startup Scripts**
- **Infrastructure as Code (IaC)**

---

## 📁 Project Structure

├── main.tf # Core infrastructure configuration
├── variables.tf # Variable definitions
├── terraform.tfvars # Variable values
├── Outputs.tf # Outputs to display after deployment
├── startup.sh # Startup script for instance initialization
├── terraform.tfstate # Terraform state file (generated)
├── terraform.tfstate.backup
├── README.md

yaml
Copy
Edit

---

## 🚀 Getting Started

### ✅ Prerequisites

- A GCP project with billing enabled
- [Terraform installed](https://developer.hashicorp.com/terraform/downloads)
- `gcloud` CLI installed and authenticated (`gcloud init`)
- Enabled APIs:
  - `compute.googleapis.com`
  - `cloudresourcemanager.googleapis.com`

---

### ⚙️ Deployment Steps

1. Clone the repository and navigate into the directory:
   ```bash
   git clone https://github.com/MiryamMann/website-deployment-gcp-infra.git
   cd website-deployment-gcp-infra
Initialize Terraform:

bash
Copy
Edit
terraform init
Preview the execution plan:

bash
Copy
Edit
terraform plan
Apply the deployment:

bash
Copy
Edit
terraform apply
Confirm creation and monitor resources in the GCP Console.

📌 Notes
The infrastructure is modular and adjustable via terraform.tfvars.

Startup script (startup.sh) can be modified to install software or serve content.

Can be extended to include a Load Balancer, Cloud DNS, HTTPS, etc.

Ideal for learning Terraform and GCP provisioning basics.

📄 License
MIT License

Feel free to contribute, open issues, or suggest improvements!

Copy
Edit
