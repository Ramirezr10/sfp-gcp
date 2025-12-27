# GCP Infrastructure Automation: Storage & Identity

## 🎯 Project Goal
The objective of this project was to build a secure, automated environment in Google Cloud Platform (GCP) using Infrastructure as Code (IaC) and Python. It demonstrates the "Least Privilege" security model by connecting a Python application to a GCS bucket using a dedicated Service Account.

## 🛠 Tech Stack
- **Infrastructure:** Terraform (HCL)
- **Language:** Python 3.14
- **Cloud:** Google Cloud Platform (GCS, IAM)
- **Tools:** GCloud CLI, Virtual Environments (venv)

## 🏗 Architecture
1. **Terraform** provisions:
   - A private GCS Bucket with Uniform Bucket-Level Access.
   - A Service Account with `roles/storage.objectViewer` permissions.
2. **Python** script uses:
   - Google Cloud Client Libraries to authenticate via ADC.
   - List and verify file availability in the bucket.

## 🚀 Key Learning Moments (SRE Focus)
- **State Locking:** Handled Terraform state locks when processes were interrupted.
- **Org Policies:** Resolved `Error 412` by enforcing Uniform Bucket-Level Access via IaC.
- **Dependency Isolation:** Used Python Virtual Environments (PEP 668) to prevent system-level package conflicts.
- **IAM Logic:** Implemented authoritative IAM bindings to ensure infrastructure drift is prevented.

## 📖 How to Run
1. `cd terraform && terraform init && terraform apply`
2. `cd ../function`
3. `python3 -m venv venv && source venv/bin/activate`
4. `pip install -r requirements.txt`
5. `python3 main.py`