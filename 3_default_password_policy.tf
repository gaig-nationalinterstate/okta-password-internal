resource "okta_policy_password" "default-password-policy" {
  name                           = "Default Policy"
  call_recovery                  = "INACTIVE"
  description                    = "The default policy applies in all situations if no other policy applies."
  email_recovery                 = "ACTIVE"
  groups_included                = [data.okta_group.everyone.id]
  password_auto_unlock_minutes   = "0"
  password_dictionary_lookup     = "true"
  password_exclude_username      = "true"
  password_expire_warn_days      = "0"
  password_history_count         = "24"
  password_max_age_days          = "0"
  password_max_lockout_attempts  = "10"
  password_min_age_minutes       = "120"
  password_min_length            = "12"
  password_min_lowercase         = "1"
  password_min_number            = "1"
  password_min_symbol            = "0"
  password_min_uppercase         = "1"
  password_show_lockout_failures = "false"
  question_min_length            = "4"
  question_recovery              = "ACTIVE"
  recovery_email_token           = "60"
  skip_unlock                    = "false"
  sms_recovery                   = "INACTIVE"
}

resource "okta_policy_rule_password" "default-password-rule" {
  name               = "Default Rule"
  network_connection = "ANYWHERE"
  password_change    = "ALLOW"
  password_reset     = "ALLOW"
  password_unlock    = "DENY"
  policy_id          = okta_policy_password.default-password-policy.id
  priority           = "1"
  status             = "ACTIVE"
}