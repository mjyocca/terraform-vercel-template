# Terraform Vercel Template

Manage your vercel projects with Terraform. Avoid manually configuring your vercel dashboards and automate changes with IAS (Infrastructure As Code).

## Getting Started

### Required Accounts
* Vercel
* Github
* Terraform Cloud

### Steps
1. Generate an API Token from each account, including Terraform Cloud
2. Install Vercel Integration with your Github Account, with access to your repository.
2. Registered domain
  - Via your domain registrar, point the NS (Name Servers) records to Vercel's Name Servers.
    * e.g. (`a.zeit-world.net`, `b.zeit-world.co.uk`, `d.zeit-world.org`, `f.zeit-world.com`)
3. Create a individual workspace in Terraform cloud for `terraform/cloud`, which houses the configuration for the two other workspaces
  - Upon workspace creation, choose VCS
  - Input the variables and select `sensitive` for any tokens
    * Terraform Variable(s):
      - `TFE_ORG`
      - `PROJECT_NAME`
      - `VERCEL_API_TOKEN`
      - `GITHUB_API_TOKEN`
      - `GITHUB_REPO_IDENTIFIER`
    * Terraform Environment Variable(s):
      - `TFE_TOKEN`: Need to create a token in Terraform Cloud for the `terraform/cloud` workspace to create resources in Terraform Cloud.


<br /><br />

## Project Description

```
├── README.md
├── backend
│   ├── api
│   │   └── hello.ts
│   └── vercel.json
├── frontend/*boilerplate nextjs*
│   
└── terraform
    ├── cloud
    │   ├── backend.workspace.tf
    │   ├── frontend.workspace.tf
    │   ├── main.tf
    │   ├── terraform.tf
    │   └── variables.tf
    ├── vercel-backend
    │   └── main.tf
    └── vercel-frontend
        └── main.tf
```

#### Backend
*Replace with your own function(s) needs.*

#### Frontend
*Replace with your own frontend/framework needs. Remember to alter the `framework` argument for the vercel frontend project configuration*


#### Terraform
Three separate workspaces, (`cloud`, `vercel-backend`, `vercel-frontend`)

1. cloud

*Workspace to manage resources within Terraform Cloud. This workspace can feel redundant if you wish to manage all resources in Terraform Cloud via the UI. As projects grow in complexity and size, using the tfe-provider may be desired*

2. vercel-backend 

*Workspace to manage the `backend` serverless functions project within Vercel. Instead of logging into the Vercel Dashboard, make settings changes via the UI. Can use this Terraform configuration to track your Vercel Project Settings.*

3. vercel-frontend

*Workspace to manage the `frontend` web project within Vercel. Instead of logging into the Vercel Dashboard, make settings changes via the UI. Can use this Terraform configuration to track your Vercel Project Settings.*
