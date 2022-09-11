variable "TFE_ORG" {
  type        = string
  description = "name of your terraform cloud organization"
}

variable "PROJECT_NAME" {
  type        = string
  description = "name of your project"
}

variable "VERCEL_API_TOKEN" {
  type      = string
  sensitive = true
}

variable "VERCEL_PROJECT_DOMAIN" {
  type        = string
  description = "DNS domain without the protocol and top level domain (`example.com`, `example.io`)"
}

variable "GITHUB_API_TOKEN" {
  type      = string
  sensitive = true
}

variable "GITHUB_REPO_IDENTIFIER" {
  type = string
}