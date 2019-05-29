$thumbprint = (New-SelfSignedCertificate `
-Subject "CN=$env:COMPUTERNAME @ Sitecore, Inc." `
-Type SSLServerAuthentication `
-FriendlyName "$env:USERNAME Certificate").Thumbprint
 
$certificateFilePath = "c:\sitecore902\$thumbprint.pfx"
Export-PfxCertificate `
-cert cert:\LocalMachine\MY\$thumbprint `
-FilePath "$certificateFilePath" `
-Password (Read-Host -Prompt "Enter password that would protect the certificate" -AsSecureString)



api key : 236e1a9a-5816-4aae-9d69-efdbe2dab866