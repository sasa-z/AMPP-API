using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

$APIName = $TriggerMetadata.FunctionName
Log-Request -user $request.headers.'x-ms-client-principal' -API $APINAME  -message "Accessed this API" -Sev "Debug"

write-host $request
write-host $request.query
# Clear Cache
if ($request.Query.ClearCache -eq "true") {
write-host "Removing catche"
    Remove-CIPPCache
    $GraphRequest = [pscustomobject]@{"Results" = "Successfully completed request." }
    Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
            StatusCode = [HttpStatusCode]::OK
            Body       = $GraphRequest
        })
    exit
}


write-host $env:refreshtoken

Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $Body
    })
    
