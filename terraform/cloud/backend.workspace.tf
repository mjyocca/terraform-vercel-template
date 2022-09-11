
resource "tfe_workspace" "terraform-vercel-backend" {
  name              = "${var.PROJECT_NAME}-vercel-backend"
  organization      = data.tfe_organization.org.name
  working_directory = "./terraform/vercel-backend"
  description       = "${var.PROJECT_NAME} backend Vercel Workspace"
  auto_apply        = true

  vcs_repo {
    identifier     = var.GITHUB_REPO_IDENTIFIER
    oauth_token_id = tfe_oauth_client.oauth-client.oauth_token_id
  }
}

resource "tfe_workspace_variable_set" "project_workspace_variable_set" {
  variable_set_id = tfe_variable_set.project_variable_set.id
  workspace_id    = tfe_workspace.terraform-vercel-backend.id
}


