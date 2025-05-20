
resource "aws_ses_email_identity" "notify" {
  email = var.notification_email
}
