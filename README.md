# infrastructure-code-project

Terraform-based Infrastructure-as-Code (IaC) starter with:
- environment layout (`dev`, `prod`)
- reusable module pattern (`terraform/modules/*`)
- simple PowerShell wrapper scripts

This template provisions **no real cloud resources by default** (it uses `random` + `local` providers) so you can validate your workflow safely. Replace the example module with real cloud modules (AWS/Azure/GCP) when ready.

## Prereqs
- Terraform installed (`terraform -version`)

## Quick start (dev)
From this folder:

```powershell
.\scripts\tf.ps1 init dev
.\scripts\tf.ps1 plan dev
.\scripts\tf.ps1 apply dev
```

## Structure
- `terraform/environments/dev` / `terraform/environments/prod`: environment roots (thin wrappers)
- `terraform/modules/example`: sample reusable module
- `scripts/tf.ps1`: helper to run Terraform against an environment

