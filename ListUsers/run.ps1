using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)


$GraphRequest = 'testing'

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = @($GraphRequest)
    })
