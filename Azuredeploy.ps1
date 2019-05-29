$SCSDK="C:\sitecore902\tools"
$SCTemplates="https://raw.githubusercontent.com/rakeshbindal4/SitecoreAzure/master"
$DeploymentId = "euw-asev2-dev-rg"
$ResourceGroup = "euw-asev2-dev-rg"
$LicenseFile = "C:\sitecore902\license.xml"
$CertificateFile = "C:\sitecore902\F6E95FD11CE541500A7AB35DEE6014C8E3604749.pfx"
$SubscriptionId = "f7ae3eeb-3ca0-42a2-b9e2-34c2480a9c1b"
$Location="West Europe"
$ParamFile="C:\sitecore902\azuredeploy.parameters.json"
$Parameters = @{
"deploymentId"=$DeploymentId;
"authCertificateBlob" = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($CertificateFile))
}
Import-Module $SCSDK\Sitecore.Cloud.Cmdlets.psm1
Add-AzureRMAccount
Set-AzureRMContext -SubscriptionId $SubscriptionId
Start-SitecoreAzureDeployment -Name $ResourceGroup -Location $Location -ArmTemplateUrl "$SCTemplates/azuredeploy.json" -ArmParametersPath $ParamFile -LicenseXmlPath $LicenseFile -SetKeyValue $Parameters -Verbose
