# Event-Driven Serverless Security Pipeline (Azure & Terraform)

##  Project Summary

Designed and deployed an event-driven serverless pipeline in Azure using Terraform, automating secure data processing triggered by Blob Storage events while eliminating hardcoded credentials through managed identity and Key Vault integration.

---

##  Architecture

Blob Storage → Event Grid → Azure Function → Key Vault → Processed Output

* **Blob Storage:** Receives uploaded files
* **Event Grid:** Detects new file events and triggers execution
* **Azure Function:** Processes files serverlessly
* **Key Vault:** Securely stores and retrieves secrets
* **Managed Identity:** Enables credential-free authentication

---

##  Technologies Used

* Microsoft Azure
* Terraform (Infrastructure as Code)
* Azure Functions
* Azure Blob Storage
* Azure Event Grid
* Azure Key Vault
* Managed Identity (IAM)

---

##  Key Features

* Event-driven automation using Event Grid
* Serverless processing with Azure Functions
* Secure secret management via Key Vault
* Managed Identity (no hardcoded credentials)
* Fully automated infrastructure deployment with Terraform
* Private storage containers for controlled data flow

---

##  Infrastructure Design

* Modular Terraform architecture (storage, identity, key vault, function, event grid)
* Storage containers for **incoming** and **processed** data
* Event Grid system topic and subscription for real-time triggers
* Function App integrated with Key Vault via Managed Identity

---

##  Key Outcomes

* Built a serverless pipeline with automated event-based execution
* Applied zero-trust principles using identity-based authentication
* Designed scalable, cloud-native processing workflow
* Created reusable Terraform modules for consistent deployments

---

##  Challenges & Lessons Learned

* Navigated Azure quota and SKU limitations impacting Function App deployment
* Resolved Terraform provider and module dependency issues
* Troubleshot identity, Key Vault access, and Event Grid integration
* Reinforced importance of cost-aware architecture and resource planning

---

##  Future Improvements

* Add monitoring (Azure Monitor / Application Insights)
* Implement CI/CD for Terraform deployments
* Expand processing logic (validation, transformation, scanning)
* Add alerting for pipeline failures

---

##  Author

Nicholas Malley
Aspiring Cloud Engineer | Cybersecurity Background
