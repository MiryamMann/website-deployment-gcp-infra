# GCP Website Deployment using Infrastructure Manager (YAML-based IaC)

This project defines the infrastructure required to deploy a website to Google Cloud Platform (GCP) using [Google Cloud Infrastructure Manager (Infra Manager)](https://cloud.google.com/infrastructure-manager), based on YAML configuration files.

## 🌐 Overview

The repository contains Infrastructure as Code (IaC) templates written in YAML for managing and deploying cloud resources on GCP using Google Cloud's native Infra Manager.

## 🛠️ Technologies Used

- **Google Cloud Platform (GCP)**
- **Infrastructure Manager (Infra Manager)**
- **YAML-based configuration**
- **Cloud DNS**
- **HTTPS Load Balancer**
- **Static website hosting**

## 📁 Project Structure

. ├── main.yaml # Root deployment configuration ├── network.yaml # VPC and subnets ├── dns.yaml # DNS configuration ├── loadbalancer.yaml # Load balancer and backend setup ├── ssl.yaml # SSL certificate definitions └── README.md

markdown
Copy
Edit

## 🚀 Getting Started

### Prerequisites

- A GCP project with billing enabled
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed and authenticated
- `gcloud` alpha APIs enabled (for Infra Manager)
- Enabled APIs: Deployment Manager V2 or Infrastructure Manager (depending on region)

### Steps

1. Enable necessary services:
   ```bash
   gcloud services enable gcdn-api cloudresourcemanager.googleapis.com
Deploy infrastructure:

bash
Copy
Edit
gcloud deployment-manager deployments create website-infra --config main.yaml
Or, if using Infra Manager (YAML templates with resource hierarchy):

bash
Copy
Edit
gcloud beta resource-manager deployments apply --project=YOUR_PROJECT_ID --config=main.yaml
Verify resources in the GCP Console.

📌 Notes
Templates are modular and can be reused across environments.

This project follows the Infrastructure as Code approach natively supported by Google Cloud.

Consider integrating with CI/CD pipelines (e.g., GitHub Actions, Cloud Build).

📄 License
MIT License

Feel free to contribute or open issues if you'd like to improve or expand this deployment.

yaml
Copy
Edit
