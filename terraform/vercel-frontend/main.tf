terraform {
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 0.4"
    }
  }
}

provider "vercel" {
  api_token = var.vercel_api_token
}

resource "vercel_project" "vcs_vercel_project" {
  name           = replace("${var.project_name}-frontend", ".", "-")
  framework      = "nextjs"
  root_directory = "frontend"

  environment = [
    {
      key    = "API_DOMAIN"
      value  = "api.${var.vercel_project_domain}"
      target = ["production", "development", "preview"]
    },
  ]

  git_repository = {
    type = "github"
    repo = var.github_repo_identifier
  }
}

resource "vercel_project_domain" "project_domain" {
  project_id = vercel_project.vcs_vercel_project.id
  domain     = var.vercel_project_domain
}