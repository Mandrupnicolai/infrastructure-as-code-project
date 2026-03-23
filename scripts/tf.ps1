param(
  [Parameter(Mandatory = $true, Position = 0)]
  [ValidateSet("init", "plan", "apply", "destroy", "fmt", "validate", "output")]
  [string]$Command,

  [Parameter(Mandatory = $false, Position = 1)]
  [ValidateSet("dev", "prod")]
  [string]$Env = "dev"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$envDir = Join-Path $repoRoot ("terraform/environments/{0}" -f $Env)

if (-not (Test-Path $envDir)) {
  throw "Unknown environment directory: $envDir"
}

Push-Location $envDir
try {
  switch ($Command) {
    "init"     { terraform init }
    "plan"     { terraform plan -out=plan.tfplan }
    "apply"    { terraform apply plan.tfplan }
    "destroy"  { terraform destroy }
    "fmt"      { terraform fmt -recursive }
    "validate" { terraform validate }
    "output"   { terraform output }
  }
} finally {
  Pop-Location
}

