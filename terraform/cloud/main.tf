data "tfe_organization" "org" {
  name = var.TFE_ORG
}

resource "tfe_oauth_client" "oauth-client" {
  name             = "Github.com (${var.PROJECT_NAME})"
  organization     = data.tfe_organization.org.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.GITHUB_API_TOKEN
  service_provider = "github"
}

resource "tfe_variable_set" "project_variable_set" {
  name         = "Project (${var.PROJECT_NAME}) variable set"
  description  = "variable set used across one or more workspaces"
  organization = data.tfe_organization.org.name
}

resource "tfe_variable" "project_name" {
  key             = "project_name"
  value           = var.PROJECT_NAME
  category        = "terraform"
  sensitive       = false
  variable_set_id = tfe_variable_set.project_variable_set.id
}

resource "tfe_variable" "vercel_api_token" {
  key             = "vercel_api_token"
  value           = var.VERCEL_API_TOKEN
  category        = "terraform"
  sensitive       = true
  variable_set_id = tfe_variable_set.project_variable_set.id
}


resource "tfe_variable" "vercel_project_domain" {
  key             = "vercel_project_domain"
  value           = var.VERCEL_PROJECT_DOMAIN
  category        = "terraform"
  variable_set_id = tfe_variable_set.project_variable_set.id
}


resource "tfe_variable" "github_repo_identifier" {
  key             = "github_repo_identifier"
  value           = var.GITHUB_REPO_IDENTIFIER
  category        = "terraform"
  variable_set_id = tfe_variable_set.project_variable_set.id
}
