// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using CSE.SecureWebServerHelper;

namespace PointOfInterestSkill
{
    public class Program
    {
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run();
        }

        public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                // The KeyVault can be specified as parameter or in ENV 'KeyVaultName'
                // main Idea is to use Managed Identity to access the secrets in KeyVault, for non Azure Dev Environments you can specify
                // the ENV 'AzureConnectionString' with your Application ID and Secret 'RunAs=App;AppId={AppId};TenantId={TenantId};AppKey={ClientSecret}'
                .ConfigurationFromKeyVault()

                //// The Azure App Service ConfigurationString is a secret and should be stored within KeyVault,
                //// the configuration key where the ConfigurationString is stored can be specified as parameter 
                //// if not standard value of 'ConnectionStrings:AppConfig' will be used
                .ConfigurationFromAzureAppConfig()

                //// The KeyVault and Certificate Name can be specified as parameters or in ENV 'KeyVaultName' and ENV 'CertificateName'
                //// For this example it is not needed (no SSL calls to befriended microservices)
                ////.ConfigureRootCAFromKeyVault()

                // The KeyVault and Certificate Name can be specified as parameters or in ENV 'KeyVaultName' and ENV 'CertificateName'
                // Remark, if your RootCA differs from the SSL cert you should specify certificate name as a parameter
                .ConfigureKestrelSSLFromKeyVault("VmAMaster0711Kv", "LocalhostK8s")
                .UseStartup<Startup>() // Note: Application Insights is added in Startup.  Disabling is also handled there.
                .Build();
    }
}
