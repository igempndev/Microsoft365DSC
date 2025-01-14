<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credscredential
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        IntuneWindowsInformationProtectionPolicyWindows10MdmEnrolled 'Example'
        {
            AzureRightsManagementServicesAllowed   = $False;
            Credential                             = $Credscredential;
            Description                            = "DSC";
            DisplayName                            = "WIP";
            EnforcementLevel                       = "encryptAndAuditOnly";
            Ensure                                 = "Present";
            EnterpriseDomain                       = "domain.co.uk";
            EnterpriseIPRanges                     = @(
                MSFT_MicrosoftGraphwindowsInformationProtectionIPRangeCollection{
                    DisplayName = 'ipv4 range'
                    Ranges = @(
                        MSFT_MicrosoftGraphIpRange{
                            UpperAddress = '1.1.1.3'
                            LowerAddress = '1.1.1.1'
                            odataType = '#microsoft.graph.iPv4Range'
                        }
                    )
                }
            );
            EnterpriseIPRangesAreAuthoritative     = $True;
            EnterpriseProxyServersAreAuthoritative = $True;
            IconsVisible                           = $False;
            Id                                     = "M_5c927889-a683-4588-afdb-4c90aa5e7e93";
            IndexingEncryptedStoresOrItemsBlocked  = $False;
            ProtectedApps                          = @(
                MSFT_MicrosoftGraphwindowsInformationProtectionApp{
                    Description = 'Microsoft.MicrosoftEdge'
                    odataType = '#microsoft.graph.windowsInformationProtectionStoreApp'
                    Denied = $False
                    PublisherName = 'CN=Microsoft Corporation, O=Microsoft Corporation, L=Redmond, S=Washington, C=US'
                    ProductName = 'Microsoft.MicrosoftEdge'
                    DisplayName = 'Microsoft Edge'
                }
            );
            ProtectionUnderLockConfigRequired      = $False;
            RevokeOnUnenrollDisabled               = $False;
        }
    }
}
