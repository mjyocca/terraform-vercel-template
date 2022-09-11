
resource "tfe_workspace" "terraform-vercel-frontend" {
  name              = "${var.PROJECT_NAME}-vercel-frontend"
  organization      = data.tfe_organization.org.name
  working_directory = "./terraform/vercel-frontend"
  description       = "${var.PROJECT_NAME} frontend Vercel Workspace"
  auto_apply        = true

  vcs_repo {
    identifier     = var.GITHUB_REPO_IDENTIFIER
    oauth_token_id = tfe_oauth_client.oauth-client.oauth_token_id
  }
  depends_on = [
    tfe_workspace.terraform-vercel-backend
  ]
}


resource "tfe_workspace_variable_set" "frontend_workspace_variable_set" {
  variable_set_id = tfe_variable_set.project_variable_set.id
  workspace_id    = tfe_workspace.terraform-vercel-frontend.id
}
