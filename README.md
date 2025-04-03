# RAG ChatBot Implementation

> Retrieval-Augmented Generation (RAG)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-03

----------

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Azure Developer CLI commands overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-commands)
- [Azure Developer CLI (azd)](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [What is PowerShell?](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.5)
- [Integrate Azure services with virtual networks for network isolation](https://learn.microsoft.com/en-us/azure/virtual-network/vnet-integration-for-azure-services)

</details>

> [!IMPORTANT]
> Disclaimer: This repository contains example of a Retrieval-Augmented Generation (RAG) chat bot with a basic architecture (designed for scenarios without network isolation), and a standard Zero-Trust Architecture deployment. This is `just a guide`. It is not an official solution. For official guidance, support, or more detailed information. Please refer [RAG with Zero-Trust – Architecture Referenceto Microsoft's official documentation](https://github.com/Azure/GPT-RAG) or contact Microsoft directly: [Microsoft Sales and Support](https://support.microsoft.com/contactus?ContactUsExperienceEntryPointAssetId=S.HP.SMC-HOME)

## Where to start? 

- An `Azure subscription is required`. All other resources, including instructions for creating a Resource Group, are provided.
- `Contributor role assigned or any custom role that allows`: access to manage all resources, and the ability to deploy resources within subscription.

RAG Solution Accelerators options:

- If you choose to use the [Basic Architecture](#basic-architecture), ([Terraform approach](./terraform-infrastructure/README.md)), please ensure that:
  -  [Terraform is installed on your local machine](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli#install-terraform).
  -  [Install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) to work with both Terraform and Azure commands.
- If you opt for the [Zero Trust Architecture](#zero-trust-architecture), (Bicep approach), please ensure that you have installed all the requirements mentioned in the [prerequisites section](https://github.com/Azure/GPT-RAG?tab=readme-ov-file#getting-started) before proceeding.

## Basic Architecture

> [!NOTE]
> [RAG Overview](./instructions/0_RAG_Overview.md): Quick overview, explaining how it works, its applications, and how to implement it using Azure AI services.

> Please follow the [Terraform guide](./terraform-infrastructure/README.md) to deploy the necessary Azure resources for the solution.

      <div align="center">
        <img src="https://github.com/user-attachments/assets/5444e87c-32af-44e8-aa86-22fe4082c4f4" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
      </div>

2. Then, follow each [section](#content) to complete the implementation.

### Important Considerations for Production Environment

- **Public Network Site**: This example is based on a public network site and is intended for demonstration purposes only. It showcases how several Azure resources can work together to achieve the desired result.
- **Private Network Configuration**: For enhanced security, consider configuring your Azure resources to operate within a private network. This can be achieved using Azure Virtual Network (VNet) to isolate your resources and control inbound and outbound traffic. Implementing private endpoints for services like Azure Blob Storage and Azure Functions can further secure your data by restricting access to your VNet.
- **Security**: Ensure that you implement appropriate security measures when deploying this solution in a production environment. This includes:
  - **Securing Access**: Use Azure Entra ID (formerly known as Azure Active Directory or Azure AD) for authentication and role-based access control (RBAC) to manage permissions.
  - **Managing Secrets**: Store sensitive information such as connection strings and API keys in Azure Key Vault.
  - **Data Encryption**: Enable encryption for data at rest and in transit to protect sensitive information.
- **Scalability**: While this example provides a basic setup, you may need to scale the resources based on your specific requirements. Azure services offer various scaling options to handle increased workloads. Consider using:
  - **Auto-scaling**: Configure auto-scaling for Azure Functions and other services to automatically adjust based on demand.
  - **Load Balancing**: Use Azure Load Balancer or Application Gateway to distribute traffic and ensure high availability.
- **Cost Management**: Monitor and manage the costs associated with your Azure resources. Use Azure Cost Management and Billing to track usage and optimize resource allocation.
- **Compliance**: Ensure that your deployment complies with relevant regulations and standards. Use Azure Policy to enforce compliance and governance policies across your resources.
- **Disaster Recovery**: Implement a disaster recovery plan to ensure business continuity in case of failures. Use Azure Site Recovery and backup solutions to protect your data and applications.

## Zero Trust Architecture

> Zero Trust AI architecture in Microsoft Azure is a `security framework designed to protect data, applications, and infrastructure by assuming that threats can come from both inside and outside the network`. This model operates on the principle of "never trust, always verify", meaning `every access request is thoroughly authenticated and authorized based on all available data points, regardless of its origin. The architecture integrates multiple layers of security, including strong identity verification, device compliance checks, and least privilege access, ensuring that only authorized users and devices can access sensitive resources`. By continuously monitoring and validating each request, Zero Trust AI architecture helps organizations minimize risks and enhance their overall security posture

> [!IMPORTANT]
> Click [here for a more quick guidance about Zero Trust](./instructions/1_ZeroTrustRAG). For a `solution accelerator with a zero-trust architecture` please refer to [Microsoft's official GPT-RAG Solution Accelerator](https://github.com/Azure/GPT-RAG) or contact Microsoft directly: [Microsoft Sales and Support](https://support.microsoft.com/contactus?ContactUsExperienceEntryPointAssetId=S.HP.SMC-HOME)

To deploy this solution accelerator, please make sure that you have installed all the requirements mentioned in the [prerequisites section](https://github.com/Azure/GPT-RAG?tab=readme-ov-file#getting-started) before proceeding. Below, you will find visual guidance that complements the [Zero Trust Architecture Deployment](https://github.com/Azure/GPT-RAG?tab=readme-ov-file#zero-trust-architecture-deployment) from the [Microsoft's official GPT-RAG Solution Accelerator](https://github.com/Azure/GPT-RAG).

### Install azd 

> The Azure Developer CLI (azd) is an `open-source tool` designed to streamline the end-to-end developer workflow on Azure. It provides `high-level commands` that simplify common developer tasks such as `project initialization, infrastructure provisioning, code deployment, and monitoring`. 

| **Category** | **Details**|
|-----------------------------|----------------------------------------|
| **Key Features**            | - High-level commands for common developer tasks<br>- Integration with azd templates<br>- Support for terminal, IDE, and CI/CD pipelines<br>- Developer-friendly commands mapping to key workflow stages <br/> - Supported Languages: C#, Java, Node.js, Python  <br/> - Integration: Terminal, IDE (Integrated Development Environment), GitHub Actions pipeline |
| **Commands Overview**       | - `azd init`: Initialize a new project<br>- `azd provision`: Provision multiple Azure resources<br>- `azd deploy`: Deploy application code<br>- `azd monitor`: Monitor deployed resources                    |
| **Comparison with Other Tools** | - **Azure CLI**: Provides granular control over individual Azure resources<br>- **Azure PowerShell**: Similar to Azure CLI but uses PowerShell cmdlets<br>- **azd**: Automates higher-level development tasks |
| **Templates**               | - Code projects adhering to azd structural conventions<br>- Include sample application code, infrastructure files, and configuration files<br>- `.azure` folder for essential Azure configurations            |
| **Customization**           | - **Use Terraform with azd**: Integrate Terraform scripts within azd workflows to manage infrastructure as code, allowing for consistent and repeatable deployments across different environments. <br>- **Customize workflows using hooks**: Implement custom scripts or commands at various stages of the azd workflow (e.g., pre-deploy, post-deploy) to tailor the deployment process to specific project needs. <br>- **Manage environment variables**: Define and manage environment variables within azd to configure application settings and secrets, ensuring consistent behavior across different deployment environments. <br>- **Remote environment support**: Use azd to manage and deploy applications to remote environments, facilitating development and testing across geographically distributed teams and resources. |

### Install PowerShell 7

> PowerShell 7 `complements Azure Developer CLI (azd) by providing robust automation capabilities that enhance the development and deployment workflows on Azure`. With PowerShell 7, you can `automate tasks such as provisioning resources, deploying applications, and managing configurations, which are integral to azd's operations.` For instance, you can use PowerShell scripts to automate the azd provision command, ensuring consistent infrastructure setup across different environments. PowerShell 7's ability to execute commands remotely aligns with azd's remote environment support, allowing seamless management of Azure resources from any location. By integrating PowerShell 7 scripts into azd workflows, developers can streamline their processes, improve efficiency, and maintain greater control over their Azure deployments.

### Download the repository

> Standard orchestrator

  ```
  azd init -t azure/gpt-rag
  ```

> Add -b agentic if you want to use the Agentic AutoGen-based orchestrator

  ```
  azd init -t azure/gpt-rag -b agentic
  ```

### Enable network isolation

> Azure network isolation is a security strategy that segments a network into distinct subnets or segments, each functioning as its own small network. This approach enhances security by preventing unauthorized access and data leakage. In Azure, network isolation can be achieved using Virtual Networks (VNets), Network Security Groups (NSGs), and Private Link, allowing precise control over inbound and outbound traffic.

  ```
  azd env set AZURE_NETWORK_ISOLATION true  
  ```

### Login to Azure

> Make sure you log in to both:

1. Azure Developer CLI: 
      
      ```
      azd auth login
      ```

2. Azure CLI:

      ```
      az login
      ```

### Deploy the insfrastructure

> `azd provision` command in Azure Developer CLI (azd) automates the deployment of necessary Azure resources for an application. It uses infrastructure-as-code templates to set up Azure services, ensuring consistent and repeatable deployments across different environments.

  ```
  azd provision
  ```

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
