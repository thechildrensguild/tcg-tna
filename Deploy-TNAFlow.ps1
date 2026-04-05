# =====================================================================
# Deploy-TNAFlow.ps1
# Deploys TCG-TNA-Submit flow via Power Platform API
# Run in pwsh 7
# =====================================================================

# --- CONNECT ---
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# Add-PowerAppsAccount

$envName = "Default-a074af5d-321f-4e67-a992-697496183a46"

# --- LOAD DEFINITION ---
$flowDef = Get-Content ".\flow-tna-submit-definition.json" -Raw | ConvertFrom-Json -Depth 50

# --- BUILD PAYLOAD ---
$payload = @{
    properties = @{
        displayName = "TCG-TNA-Submit"
        definition = $flowDef
        state = "Started"
        connectionReferences = @{
            shared_sharepointonline = @{
                connectionName = "shared-sharepointonl-81875eeb-ac6c-4472-8335-272e6d9a7bf6"
                id = "/providers/Microsoft.PowerApps/apis/shared_sharepointonline"
            }
        }
    }
}

# --- DEPLOY (new flow) ---
$result = InvokeApi -Method POST -Route "https://api.flow.microsoft.com/providers/Microsoft.ProcessSimple/environments/$envName/flows" -ApiVersion "2016-11-01" -Body $payload

# --- OUTPUT ---
Write-Host "Flow ID: $($result.name)"
Write-Host "Flow created successfully"

# --- GET HTTP TRIGGER URL ---
# After deployment, get the trigger URL:
# $triggerUrl = InvokeApi -Method POST -Route "https://api.flow.microsoft.com/providers/Microsoft.ProcessSimple/environments/$envName/flows/$($result.name)/triggers/When_a_HTTP_request_is_received/listCallbackUrl" -ApiVersion "2016-11-01"
# Write-Host "HTTP Trigger URL: $($triggerUrl.value)"
