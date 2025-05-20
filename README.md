
# Dragon Hunter Labs Infrastructure

This Terraform project sets up:

- Route53 for domain `dragonhunterlabs.com`
- AWS Amplify deployment from GitHub (Vite/npm app)
- API Gateway + Lambda to handle contact form and send emails using SES

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in:
   - `github_repo`
   - `github_token`
   - `notification_email`

2. Run:
```bash
terraform init
terraform apply
```

3. Verify your email address in SES if required (sandbox mode).

4. Your contact form can POST to the API Gateway URL (see output).
