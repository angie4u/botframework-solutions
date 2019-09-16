# Environment Set
## Download Project
## Create LUIS key for ToDo 
## Update appsettings.json
## Deploy LUIS model using script & update cognitivemodels.json
## Create and application registration to Azure AD
## Create Bot Registration using the ID/Pswd from above step
## Add OAuth Connections 
## Test Bot locally to check if it is working

# Dockerising Bot
## Create Dockerfile
## Run project at docker environment 

# Secret Management
## Create Key Vault & App Config for ToDo
## Upload appsettings.json, cognitivemodels.json to App config
## Create a service principal for todo app at AAD - App registration overview
## Add Access policy at master kv & ToDo kv to enable todo application can access the master kv & ToDo kv
## Enable to use KV and App Config by updating Startup.cs, Program.cs
## 

# Parameter Management using Helm Chart
## Initialize Helm Chart
## Save credentials at secret.yaml
## Update Dockerfiles to use Helm Chart

# Connect containerzied ToDo bot to VA(Mother Bot)
## Execute Botskills connect CLI
## Upload SkillManifest file to App Config service
## Testing bot using emulator


