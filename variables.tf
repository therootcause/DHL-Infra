
variable "domain_name" {
  default = "dragonhunterlabs.com"
}

variable "github_repo" {
  description = "GitHub repo in owner/repo format"
}

variable "github_token" {
  description = "GitHub personal access token"
  sensitive = true
}

variable "notification_email" {
  description = "Email address SES can send to"
}
