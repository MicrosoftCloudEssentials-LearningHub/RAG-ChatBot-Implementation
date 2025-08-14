# Microsoft Copilot Product & Platform Decision Guide — Overview

> How to choose between **Microsoft 365 Copilot**, **Copilot Studio**, and **Azure AI Foundry (Azure AI Studio)** for your scenario.

Costa Rica

[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com) 
[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-08-14

----------

<details>
<summary><b>List of References</b> (Click to expand)</summary>

*   **AI strategy & decision tree** — *Cloud Adoption Framework*\
    <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>
*   **Which Copilot is right for your org** — *Microsoft 365 Copilot*\
    <https://learn.microsoft.com/copilot/microsoft-365/which-copilot-for-your-organization>
*   **Choose the right agent solution** — *Copilot Studio vs SDKs vs Azure AI*\
    <https://learn.microsoft.com/microsoft-365/agents-sdk/choose-agent-solution>
*   **Copilot Studio overview**\
    <https://learn.microsoft.com/microsoft-copilot-studio/fundamentals-what-is-copilot-studio>
*   **Declarative agents tool comparison**\
    <https://learn.microsoft.com/microsoft-365-copilot/extensibility/declarative-agent-tool-comparison>
*   **Extensibility planning guide (agents for M365 Copilot)**\
    <https://learn.microsoft.com/microsoft-365-copilot/extensibility/planning-guide>
*   **Training path: Build a foundation to build AI agents & extend M365 Copilot**\
    <https://learn.microsoft.com/training/paths/build-foundation-extend-microsoft-365-copilot/>

</details>

<details>
<summary><b>Table of Content</b> (Click to expand)</summary>


</details>

> [!IMPORTANT]
> This is a practical **selection guide** synthesized from Microsoft Learn. For official canonical guidance (which evolves), always verify the linked docs: **AI Strategy decision tree** and **Which Copilot is right for you**.\
> Sources: <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>, <https://learn.microsoft.com/copilot/microsoft-365/which-copilot-for-your-organization>

***

## Where to start?

1.  **Clarify the goal**: productivity in M365 apps, a custom line-of-business agent, or a full-blown AI app/platform?
2.  **Match to service model**: **SaaS (Copilots)** for speed, **PaaS (Azure AI)** for control, **IaaS** for maximum customization.\
    Sources: <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>, <https://learn.microsoft.com/microsoft-365/agents-sdk/choose-agent-solution>


## Quick decision tree (text + mermaid)


*   If you need **in‑app AI in Word/Excel/PowerPoint/Teams with enterprise protections** → choose **Microsoft 365 Copilot**.\
    Source: <https://learn.microsoft.com/copilot/microsoft-365/which-copilot-for-your-organization>
*   If you need a **custom business agent** (low-code), **multi‑channel** (Teams/web), automation with **Power Platform**, and quick time‑to‑value → choose **Copilot Studio**.\
    Sources: <https://learn.microsoft.com/microsoft-copilot-studio/fundamentals-what-is-copilot-studio>, <https://learn.microsoft.com/microsoft-365/agents-sdk/choose-agent-solution>
*   If you need a **developer platform** for **RAG**, multi‑agent patterns, **model choice**, evaluations, and deep integration → choose **Azure AI Foundry (Azure AI Studio)**.\
    Source: <https://learn.microsoft.com/microsoft-365/agents-sdk/choose-agent-solution>, <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>
*   If you simply want a **web-grounded personal assistant** (not for sensitive work data) → **Microsoft Copilot (consumer)**.\
    Source: <https://learn.microsoft.com/copilot/microsoft-365/which-copilot-for-your-organization>


## At-a-glance: Product picker

| Scenario                                                                                                  | Choose                                                  | Why this fits                                                                    | Key notes                                                                                                                                                                                                                                          |
| --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Employees want AI in **Word/Excel/PowerPoint/Outlook/Teams** with enterprise-grade protections            | **Microsoft 365 Copilot**                               | Natively integrated experiences; work & web chat; governed by M365 controls      | Requires org licensing; respects Microsoft Graph permissions. Source: <https://learn.microsoft.com/copilot/microsoft-365/which-copilot-for-your-organization>                                                                                      |
| Build a **custom agent** quickly, connect business data, **automate** flows, publish to **Teams or web**  | **Copilot Studio**                                      | Low-code authoring, topics, knowledge sources, **agent flows**, Power Automate   | Great for fusion teams; supports channels via Azure Bot Service. Sources: <https://learn.microsoft.com/microsoft-copilot-studio/fundamentals-what-is-copilot-studio>, <https://learn.microsoft.com/microsoft-365/agents-sdk/choose-agent-solution> |
| Develop a **RAG** app or **multi-agent** solution with fine control over models, evals, safety, and infra | **Azure AI Foundry (Azure AI Studio)**                  | Unified SDK/APIs, integrates Azure OpenAI & Cognitive Services, deep ops control | Best for pro-code; aligns with PaaS patterns in CAF. Sources: <https://learn.microsoft.com/microsoft-365/agents-sdk/choose-agent-solution>, <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>                     |
| Extend M365 Copilot with **task-specific agents** using declarative tools                                 | **Agents for M365 Copilot** (via Copilot Studio & SDKs) | Purpose-built extensions that run inside M365 Copilot orchestrator               | See tool comparison & planning guide. Sources: <https://learn.microsoft.com/microsoft-365-copilot/extensibility/declarative-agent-tool-comparison>, <https://learn.microsoft.com/microsoft-365-copilot/extensibility/planning-guide>               |
| Personal, **non-sensitive** queries with image creation                                                   | **Microsoft Copilot (consumer)**                        | Free web-grounded assistant                                                      | Don’t use for confidential work content. Source: <https://learn.microsoft.com/copilot/microsoft-365/which-copilot-for-your-organization>                                                                                                           |


## Copilot Studio vs Azure AI Foundry (Azure AI Studio)

| Dimension             | **Copilot Studio**                                                                         | **Azure AI Foundry (Azure AI Studio)**                                              |
| --------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------- |
| **Audience**          | Fusion teams, citizen developers                                                           | Pro-code developers                                                                 |
| **Approach**          | **Low-code SaaS** agent builder with topics, knowledge, **agent flows**, plugins           | **PaaS** development platform with unified SDKs/APIs, RAG, multi-agent, evals       |
| **Typical use**       | Helpdesk bots, HR/IT FAQ, approvals, guided flows, Teams agents                            | Custom RAG apps, multi-agent orchestration, domain copilots with bespoke logic      |
| **Data & connectors** | Prebuilt/custom plugins, Power Platform connectors; Azure AI Search supported as knowledge | Bring your own data stores; Azure AI Search, vector DBs; full orchestration control |
| **Channels**          | Publish to **Teams**, web, channels via Azure Bot Service                                  | You host and expose services; integrate into custom apps, Teams, M365 via SDKs      |
| **Governance**        | Power Platform governance, DLP, environment controls                                       | Azure governance (RBAC, VNets, Private Link), CI/CD, responsible AI reviews         |
| **When to pick**      | Rapid time-to-value; low-code; align with Power Platform ops                               | Need model choice, fine-grained data/infra control, complex pipelines & testing     |

Sources: <https://learn.microsoft.com/microsoft-365/agents-sdk/choose-agent-solution>, <https://learn.microsoft.com/microsoft-copilot-studio/fundamentals-what-is-copilot-studio>, <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>


## Extending Microsoft 365 Copilot with agents

*   **Declarative agents & tools**: Compare Copilot Studio, Agents SDK, Semantic Kernel, and more to pick the right extensibility path.\
    Sources: <https://learn.microsoft.com/microsoft-365-copilot/extensibility/declarative-agent-tool-comparison>, <https://learn.microsoft.com/microsoft-365-copilot/extensibility/planning-guide>
*   **Agent design**: Define instructions, actions, knowledge, and channels; leverage **agent flows** for automation; publish to Teams/web.\
    Source: <https://learn.microsoft.com/microsoft-copilot-studio/fundamentals-what-is-copilot-studio>
*   **Developers’ route**: Use the **Microsoft 365 Agents SDK** to build agents deployable across channels (M365 Copilot, Teams, web) with your preferred AI services.\
    Source: <https://learn.microsoft.com/microsoft-365/agents-sdk/choose-agent-solution>


## Implementation considerations (security, data, networking)

*   **Service model fit**: SaaS (Copilots) → fastest; PaaS (Azure AI Foundry) → control & customization; IaaS → maximum flexibility.\
    Source: <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>
*   **Data readiness & access**: For M365 Copilot, review data exposure via Microsoft Graph permissions and labels; for Azure AI, plan grounding data stores and search.\
    Sources: <https://learn.microsoft.com/copilot/microsoft-365/which-copilot-for-your-organization>, <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>
*   **Networking & isolation**: Azure PaaS workloads can use Private Link/VNet integration; consider egress controls and content filtering for AI endpoints.\
    Source: <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>
*   **Governance & lifecycle**: Use Power Platform environments/DLP (Copilot Studio) or Azure policies/DevOps pipelines (Azure AI Foundry).\
    Sources: <https://learn.microsoft.com/microsoft-copilot-studio/fundamentals-what-is-copilot-studio>, <https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/strategy>


## FAQ

### Q1. Is Copilot Studio only for chat?

> It builds `agents` (beyond simple chat) that can call flows, connect to data, and act across channels (Teams/web).

Source: <https://learn.microsoft.com/microsoft-copilot-studio/fundamentals-what-is-copilot-studio>

### Q2. When do I prefer Azure AI Foundry?

> When you need `RAG/multi-agent`, model choice, evaluations, and deep integration/testing under your DevOps and networking controls.

Source: <https://learn.microsoft.com/microsoft-365/agents-sdk/choose-agent-solution>

### Q3. Can I extend Microsoft 365 Copilot with my own domain agent?

> Yes—use `agents` (declarative) and related SDKs; see the tool comparison and planning guidance.

Sources: <https://learn.microsoft-365-copilot/extensibility/declarative-agent-tool-comparison>, <https://learn.microsoft.com/microsoft-365-copilot/extensibility/planning-guide>

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1332-limegreen" alt="Total views">
  <p>Refresh Date: 2025-08-14</p>
</div>
<!-- END BADGE -->
