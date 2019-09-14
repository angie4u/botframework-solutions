# VA Meets AKS (Virtual Assistant meets Azure Kubernetes Service)

## What is VA(Virtual Assistant Solution)?
* Link: [https://github.com/microsoft/botframework-solutions/blob/master/README.md](https://github.com/microsoft/botframework-solutions/blob/master/README.md)

 Provides a set of templates, solution accelerators and skills to help build sophisticated conversational experiences. 

## Key Objectives of this project
* Containerize Bot Framework Solutions 
* Ensure end-to-end secure communication
* Credentail management 

### Containerize Bot Framework Solutions
Since Kubernetes and Container technology is trending and a lot used together with DevOps paradigms we wanted to showcase an approach on how to containerize and deploy Virtual Assistant and its components (Skill Bots)

### Ensure end-to-end secure communication 
Bots are processing PII and other sensitive user data. Therefore, the end-to-end encryption of the communication is very important even within trusted boundaries.

To ensure end-to-end secure communication, we used SSL certificates for end-to-end encryption for (micro)services communication within a cluster. 

### Credentail management 
Microsoft Bot Framework Solutions consists of lots of different services. LUIS is used for natural language processing, Cosmos DB is used to store state information, and Application Insights is used to log telemetry information. In addition, because Bot can be connected to various services, it is important to securely store and manage multiple secret information.

To achive this, we use [Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-whatis) and [App Configuration(preview)](https://docs.microsoft.com/en-us/azure/azure-app-configuration/overview) to manage the configuration information. 
We used [CSE.SecureWebServerHelper NuGet package](https://www.nuget.org/packages/CSE.SecureWebServerHelper) to make the two services easy to use in the .NET project.

## Architecture
![VA Meets AKS Architecture](/docs/assets/images/readme-architecture.JPG)

## Benefits by containerizing VA solution
* **Reducing latency between Virtual Assistant and Skills** by placing them in the same AKS cluster
* **Reducing latency between LUIS and bots** by deploying LUIS containers directly next to the bots. 
* **Better orchestration experience and denser resource utilization** by using Kubernetes and Helm Chart which is a good option for a big solution like this. 
