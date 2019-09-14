# How to containerising VA(a.k.a Mother Bot)?
## Step1. Download VSIX template for Virtual Assistant
* [Download and Install tools](https://microsoft.github.io/botframework-solutions/tutorials/csharp/create-assistant/2_download_and_install/)
* [Create your assistant](https://microsoft.github.io/botframework-solutions/tutorials/csharp/create-assistant/3_create_project/)

## Step2. Create required Azure Resources using Azure CLI
The final goal of this project is "One click deployment" experience to deloy VA solution by using Terraform & Azure CLI & containers.
To achieve that goal, we tried to create Azure Resources by using scripts instead of using Azure Portal. 

[Resources for VA]
* Application Insights creation
* Cosmos DB creation
* LUIS key creation
* Azure Storage creation
* Bot Channel Registration creation
* QnA Maker service creation

[Resources for credential management]
* Azure Key Vault creation
* App Configuration creation

[Resources for containerization]
* AKS(Azure Kubernetes Service) cluster creation
* Azure Container Registry creation

## Step3. Containerize .NET solution
3-1. Create Docker file(Dockerfile) under your directory and paste below script in your Dockerfile.

```dockerfile
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
# Set your workdir
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build
COPY . ./
RUN rm *.json
RUN dotnet publish -c Release -o out

# build runtime image /aspnet -> ASP.NET /runtime -> .NET Core
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app

# Copy from build
COPY --from=build-env /app/out .

# Run your app (dll name has to be changed)
ENTRYPOINT ["dotnet", "<YOUR DLL Name>"]
```

3-2. Build and run container locally 
```
docker images
docker build -t motherbot . 
docker ps -a
docker run -it -p 5001:80 motherbot
```

## Step4. Deploy docker image to your private registery(Azure Container Registry)
4-0. Login to your ACR
```
az login
az acr login --name vameetsaks0711
```
4-1. Tagging docker image by following naming rule and push the image to the ACR
```
docker build -t vameetsaks0711.azurecr.io/va/motherbot .
docker push vameetsaks0711.azurecr.io/va/motherbot
``` 
4-2. Running the container using the pushed image
```
docker run -it -p 5001:443 -e KeyVaultName=<KeyVaultName> -e CertificateName=<CertiName> -e AzureConnectionString="<ConnectionString From line9>" motherbotvameetsaks0711.azurecr.io/va/motherbot
```

## (Optional) Step5. Manage Parameter using HELM chart
5-1. Initialize Helm Chart
```
helm init
```
5-2. Updating Helm Chart
```
helm upgrade va-dev .   
// When there is no change for your container image, you can set this option to update your parameters 
helm upgrade --recreate-pods va-dev .   
```
5-3. Apply changes for secret.yaml file 
```
kubectl apply -f secret.yaml
```
5-4. Check the values inside secret.yaml
```
kubectl get secret azuresecret -o yaml
```

## Useful command to check contianer status

```
kubectl logs <container name>
kubectl get pods --namespace kube-system
helm ls -a
```


