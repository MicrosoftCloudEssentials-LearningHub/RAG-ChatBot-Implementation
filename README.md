# RAG ChatBot Implementation - Overview 

> Retrieval-Augmented Generation (RAG)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-03

----------

> [Quick overview](./0_RAG_Overview.md), explaining how it works, its applications, and how to implement it using Azure AI services.

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Azure Developer CLI commands overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-commands)
- [Azure Developer CLI (azd)](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [What is PowerShell?](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.5)
- [Integrate Azure services with virtual networks for network isolation](https://learn.microsoft.com/en-us/azure/virtual-network/vnet-integration-for-azure-services)

</details>

> [!IMPORTANT]
> Disclaimer: This repository contains example of a Retrieval-Augmented Generation (RAG) chat bot with a basic architecture (designed for scenarios without network isolation), and a standard Zero-Trust Architecture deployment. This is `just a guide`. It is not an official solution. For official guidance, support, or more detailed information. Please refer [RAG with Zero-Trust – Architecture Referenceto Microsoft's official documentation](https://github.com/Azure/GPT-RAG) or contact Microsoft directly: [Microsoft Sales and Support](https://support.microsoft.com/contactus?ContactUsExperienceEntryPointAssetId=S.HP.SMC-HOME)

## Content 

<details>
<summary><b>List of Content</b> (Click to expand)</summary>

- [Where to start?](#where-to-start)
- [Basic Architecture](#basic-architecture)
  - [Important Considerations for Production Environment](#important-considerations-for-production-environment)
- [Zero Trust Architecture](#zero-trust-architecture)
  - [Step 0.1: Install azd](#step-01-install-azd)
  - [Step 0.2: Install PowerShell 7](#step-02-install-powershell-7)
  - [Step 1: Download the repository](#step-1-download-the-repository)
  - [Step 2: Enable network isolation](#step-2-enable-network-isolation)
  - [Step 3: Login to Azure](#step-3-login-to-azure)
  - [Step 4: Deploy the insfrastructure](#step-4-deploy-the-insfrastructure)

</details>

## Where to start? 

- An `Azure subscription is required`. All other resources, including instructions for creating a Resource Group, are provided.
- `Contributor role assigned or any custom role that allows`: access to manage all resources, and the ability to deploy resources within subscription.

> RAG Solution Accelerators options:

- If you choose to use the [Basic Architecture](#basic-architecture), ([Terraform approach](./terraform-infrastructure/README.md)), please ensure that:
  -  [Terraform is installed on your local machine](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli#install-terraform).
  -  [Install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) to work with both Terraform and Azure commands.
- If you opt for the [Zero Trust Architecture](#zero-trust-architecture), (Bicep approach), please ensure that you have installed all the requirements mentioned in the [prerequisites section](https://github.com/Azure/GPT-RAG?tab=readme-ov-file#getting-started) before proceeding.

## Basic Architecture

> Please follow the [Terraform guide](./terraform-infrastructure/README.md) to deploy the necessary Azure resources for the solution.

<div align="center">
  <img src="https://github.com/user-attachments/assets/5444e87c-32af-44e8-aa86-22fe4082c4f4" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

### Important Considerations for Production Environment

<details>
  <summary>Public Network Site</summary>
  This example is based on a public network site and is intended for demonstration purposes only. It showcases how several Azure resources can work together to achieve the desired result.
</details>

<details>
  <summary>Private Network Configuration</summary>
  For enhanced security, consider configuring your Azure resources to operate within a private network. This can be achieved using Azure Virtual Network (VNet) to isolate your resources and control inbound and outbound traffic. Implementing private endpoints for services like Azure Blob Storage and Azure Functions can further secure your data by restricting access to your VNet.
</details>

<details>
  <summary>Security</summary>
  Ensure that you implement appropriate security measures when deploying this solution in a production environment. This includes:

  - Securing Access: Use Azure Entra ID (formerly known as Azure Active Directory or Azure AD) for authentication and role-based access control (RBAC) to manage permissions.
  - Managing Secrets: Store sensitive information such as connection strings and API keys in Azure Key Vault.
  - Data Encryption: Enable encryption for data at rest and in transit to protect sensitive information.
</details>

<details>
  <summary>Scalability</summary>
  While this example provides a basic setup, you may need to scale the resources based on your specific requirements. Azure services offer various scaling options to handle increased workloads. Consider using:

  - Auto-scaling: Configure auto-scaling for Azure Functions and other services to automatically adjust based on demand.
  - Load Balancing: Use Azure Load Balancer or Application Gateway to distribute traffic and ensure high availability.

</details>

<details>
  <summary>Cost Management</summary>
  Monitor and manage the costs associated with your Azure resources. Use Azure Cost Management and Billing to track usage and optimize resource allocation.
</details>

<details>
  <summary>Compliance</summary>
  Ensure that your deployment complies with relevant regulations and standards. Use Azure Policy to enforce compliance and governance policies across your resources.
</details>

<details>
  <summary>Disaster Recovery</summary>
   Implement a disaster recovery plan to ensure business continuity in case of failures. Use Azure Site Recovery and backup solutions to protect your data and applications.
</details>

## Zero Trust Architecture

> Zero Trust AI architecture in Microsoft Azure is a `security framework designed to protect data, applications, and infrastructure by assuming that threats can come from both inside and outside the network`. This model operates on the principle of "never trust, always verify", meaning `every access request is thoroughly authenticated and authorized based on all available data points, regardless of its origin. The architecture integrates multiple layers of security, including strong identity verification, device compliance checks, and least privilege access, ensuring that only authorized users and devices can access sensitive resources`. By continuously monitoring and validating each request, Zero Trust AI architecture helps organizations minimize risks and enhance their overall security posture

> [!IMPORTANT]
> Click [here for a more quick guidance about Zero Trust](./instructions/1_ZeroTrustRAG). For a `solution accelerator with a zero-trust architecture` please refer to [Microsoft's official GPT-RAG Solution Accelerator](https://github.com/Azure/GPT-RAG) or contact Microsoft directly: [Microsoft Sales and Support](https://support.microsoft.com/contactus?ContactUsExperienceEntryPointAssetId=S.HP.SMC-HOME)

To deploy this solution accelerator, please make sure that you have installed all the requirements mentioned in the [prerequisites section](https://github.com/Azure/GPT-RAG?tab=readme-ov-file#getting-started) before proceeding. Below, you will find visual guidance that complements the [Zero Trust Architecture Deployment](https://github.com/Azure/GPT-RAG?tab=readme-ov-file#zero-trust-architecture-deployment) from the [Microsoft's official GPT-RAG Solution Accelerator](https://github.com/Azure/GPT-RAG).

### Step 0.1: Install azd 

> The Azure Developer CLI (azd) is an `open-source tool` designed to streamline the end-to-end developer workflow on Azure. It provides `high-level commands` that simplify common developer tasks such as `project initialization, infrastructure provisioning, code deployment, and monitoring`. 

<details>
<summary><strong>Key Features</strong></summary>

- High-level commands for common developer tasks
- Integration with azd templates
- Support for terminal, IDE, and CI/CD pipelines
- Developer-friendly commands mapping to key workflow stages
- Supported Languages: C#, Java, Node.js, Python
- Integration: Terminal, IDE (Integrated Development Environment), GitHub Actions pipeline
- **Command Line Interface (CLI)**: azd provides a streamlined CLI experience for developers, enabling quick execution of tasks without needing to navigate complex Azure interfaces.
- **Template Management**: azd templates are designed to be easily customizable, allowing developers to adapt them to specific project requirements.
- **CI/CD Integration**: azd supports integration with popular CI/CD tools, facilitating automated deployment and testing workflows.

</details>

<details>
<summary><strong>Commands Overview</strong></summary>

- **Initialization (`azd init`)**: Initialize a new project; sets up the project structure, including necessary configuration files and directories.
- **Provisioning (`azd provision`)**: Provision multiple Azure resources; automates the creation of Azure resources such as virtual machines, databases, and storage accounts.
- **Deployment (`azd deploy`)**: Handles the deployment of application code to Azure, ensuring that all dependencies and configurations are correctly applied.
- **Monitoring (`azd monitor`)**: Provides tools for tracking the performance and health of deployed resources, integrating with Azure Monitor and Application Insights.

</details>

<details>
<summary><strong>Comparison with Other Tools</strong></summary>

- **Azure CLI**: Provides granular control over individual Azure resources; ideal for detailed management of Azure resources, offering extensive command options for precise control.
- **Azure PowerShell**:Similar to Azure CLI but uses PowerShell cmdlets; leverages PowerShell scripting capabilities for Azure management, suitable for users familiar with PowerShell syntax.
- **azd**:  Automates higher-level development tasks; focuses on simplifying the overall development workflow, reducing the complexity of managing multiple Azure services.

</details>

<details>
<summary><strong>Templates</strong></summary>

- **Project Structure**: azd templates follow a standardized structure, making it easier for developers to understand and navigate the project.
- **Sample Code**: Templates include sample application code to demonstrate best practices and provide a starting point for development.
- **Infrastructure Files**: Templates come with predefined infrastructure files, such as ARM templates or Terraform scripts, to streamline resource provisioning.
- **Configuration Management**: The `.azure` folder contains essential configuration files for managing Azure settings and secrets.

</details>

<details>
<summary><strong>Customization</strong></summary>

- **Use Terraform with azd**: Allows developers to use Terraform for infrastructure management, providing a consistent approach to resource provisioning; integrate Terraform scripts within azd workflows to manage infrastructure as code, allowing for consistent and repeatable deployments across different environments.
- **Customize workflows using hooks**: Custom hooks enable developers to execute specific actions at various points in the deployment process, enhancing flexibility and control.; implement custom scripts or commands at various stages of the azd workflow (e.g., pre-deploy, post-deploy) to tailor the deployment process to specific project needs.
- **Manage environment variables**: Define and manage environment variables within azd to configure application settings and secrets, ensuring consistent behavior across different deployment environments.
- **Remote environment support**: Use azd to manage and deploy applications to remote environments, facilitating development and testing across geographically distributed teams and resources.

</details>

https://github.com/user-attachments/assets/2a9d7c6b-1260-4ad1-8889-ce01057d2b44

### Step 0.2: Install PowerShell 7

> PowerShell 7 `complements Azure Developer CLI (azd) by providing robust automation capabilities that enhance the development and deployment workflows on Azure`. With PowerShell 7, you can `automate tasks such as provisioning resources, deploying applications, and managing configurations, which are integral to azd's operations.` For instance, you can use PowerShell scripts to automate the azd provision command, ensuring consistent infrastructure setup across different environments. PowerShell 7's ability to execute commands remotely aligns with azd's remote environment support, allowing seamless management of Azure resources from any location. By integrating PowerShell 7 scripts into azd workflows, developers can streamline their processes, improve efficiency, and maintain greater control over their Azure deployments.

https://github.com/user-attachments/assets/9bb475e4-7fef-46d9-9147-a28e806b4e1c

### Step 1: Download the repository

> Standard orchestrator

  ```
  azd init -t azure/gpt-rag
  ```

> Add -b agentic if you want to use the Agentic AutoGen-based orchestrator

  ```
  azd init -t azure/gpt-rag -b agentic
  ```

https://github.com/user-attachments/assets/22d2c66b-fd1e-4967-9f6c-ae02e27b2036

> [!IMPORTANT]
> Update the information in the `GPT-RAG_SolutionAccelerator/infra/main.parameters.json` file, and make sure to save your changes before proceeding with the infrastructure deployment.

### Step 2: Enable network isolation

> Azure network isolation is a security strategy that segments a network into distinct subnets or segments, each functioning as its own small network. This approach enhances security by preventing unauthorized access and data leakage. In Azure, network isolation can be achieved using Virtual Networks (VNets), Network Security Groups (NSGs), and Private Link, allowing precise control over inbound and outbound traffic.

  ```
  azd env set AZURE_NETWORK_ISOLATION true  
  ```

https://github.com/user-attachments/assets/4f493506-970d-4b1d-aee2-1b0972a365d7

### Step 3: Login to Azure

> Make sure you log in to both:

1. Azure Developer CLI: 
      
      ```
      azd auth login
      ```

2. Azure CLI:

      ```
      az login
      ```

https://github.com/user-attachments/assets/ed8833ee-5edc-4d28-8b45-2d6ae75e2bf6

### Step 4: Deploy the insfrastructure

> `azd provision` command in Azure Developer CLI (azd) automates the deployment of necessary Azure resources for an application. It uses infrastructure-as-code templates to set up Azure services, ensuring consistent and repeatable deployments across different environments.

  ```
  azd provision
  ```

https://github.com/user-attachments/assets/015d2e96-978f-4606-beac-e25f03253585

> Once it is finished, you will see something like this:

<div align="center">
  <img src="https://github.com/user-attachments/assets/c481f323-3b9b-4354-811c-feb8bd8e05a3" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img src="https://github.com/user-attachments/assets/b4976132-2b3e-4bdf-b02f-aa8b0643455d" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

### Step 5: Application deployment

1. To proceed with the deployment, use the Virtual Machine connected via Bastion (set up in step 4).

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/aee21cda-d047-4f6d-a568-8c9772639ca2" />

2. Log into the VM using the username and authenticate with the `password stored in the keyvault`, as illustrated in the figure below.

   https://github.com/user-attachments/assets/6b927de3-d54d-43b0-8fb1-7c0998827714

   https://github.com/user-attachments/assets/25ec1fb6-d999-41e4-ac17-0c16b14a946d

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
