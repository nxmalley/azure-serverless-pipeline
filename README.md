\# Event-Driven Serverless Security Pipeline (Azure \& Terraform)



\##  Project Summary



Designed and deployed an event-driven serverless pipeline in Azure using Terraform, automating secure data processing triggered by Blob Storage events. This project demonstrates cloud-native architecture, identity-based access control, and elimination of hardcoded credentials using zero-trust principles.



---



\##  Architecture



Blob Storage → Event Grid → Azure Function → Key Vault → Processed Output



\* \*\*Blob Storage:\*\* Receives uploaded files

\* \*\*Event Grid:\*\* Detects new file events and triggers execution

\* \*\*Azure Function:\*\* Processes files serverlessly

\* \*\*Key Vault:\*\* Stores and retrieves secrets securely

\* \*\*Managed Identity:\*\* Enables authentication without credentials



---



\##  Key Features



\* Event-driven architecture using Azure Event Grid

\* Serverless processing with Azure Functions

\* Secure secret management via Key Vault

\* Managed Identity (no hardcoded credentials)

\* Fully automated infrastructure using Terraform

\* Private storage containers for controlled data flow



---



\##  Technologies Used



\* Microsoft Azure

\* Terraform (Infrastructure as Code)

\* Azure Functions

\* Azure Blob Storage

\* Azure Event Grid

\* Azure Key Vault

\* Managed Identity (IAM)



---



\##  Infrastructure Design



\* Modular Terraform architecture (storage, identity, key vault, function, event grid)

\* Storage containers for \*\*incoming\*\* and \*\*processed\*\* data

\* Event Grid system topic + subscription for real-time triggers

\* Function App integrated with Key Vault via Managed Identity



---



\##  Key Outcomes



\* Implemented event-driven automation without manual triggers or scheduling

\* Applied zero-trust security by removing credential-based authentication

\* Designed scalable, serverless data processing workflow

\* Built reusable Terraform modules for consistent deployments



---



\##  Challenges \& Lessons Learned



\* Navigated Azure quota and SKU limitations impacting Function App deployment

\* Resolved Terraform provider/version conflicts and module dependency issues

\* Troubleshot identity, Key Vault access policies, and Event Grid integration

\* Reinforced importance of cost-aware architecture and resource planning 



---



\##  Future Improvements



\* Add logging and monitoring (Azure Monitor / Application Insights)

\* Implement CI/CD pipeline for automated deployments

\* Expand processing logic (data transformation, validation, scanning)

\* Add alerting for pipeline failures



---



\##  Author



Nicholas Malley

Aspiring Cloud \& Infrastructure Engineer



