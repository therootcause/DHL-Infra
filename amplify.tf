
resource "aws_amplify_app" "frontend" {
  name         = "dragonhunterlabs-site"
  repository   = "https://github.com/${var.github_repo}"
  oauth_token  = var.github_token
  platform     = "WEB"

  build_spec = <<EOT
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - npm install
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: dist
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
EOT
}

resource "aws_amplify_branch" "main" {
  app_id  = aws_amplify_app.frontend.id
  branch_name = "main"
}

resource "aws_amplify_branch" "dev" {
  app_id  = aws_amplify_app.frontend.id
  branch_name = "dev"
}

