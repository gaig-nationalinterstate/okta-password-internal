resource "okta_policy_password" "active-directory-policy" {
  auth_provider                          = "ACTIVE_DIRECTORY"
  call_recovery                          = "INACTIVE"
  description                            = "The active directory policy contains settings that apply to users using delegated authentication from active directory integrations."
  email_recovery                         = "ACTIVE"
  groups_included                        = [data.okta_group.everyone.id]
  name                                   = "Active Directory Policy"
  password_auto_unlock_minutes           = "10"
  password_dictionary_lookup             = "true"
  password_exclude_first_name            = "true"
  password_exclude_last_name             = "true"
  password_exclude_username              = "true"
  password_expire_warn_days              = "0"
  password_history_count                 = "30"
  password_lockout_notification_channels = ["EMAIL"]
  password_max_age_days                  = "0"
  password_max_lockout_attempts          = "7"
  password_min_age_minutes               = "120"
  password_min_length                    = "16"
  password_min_lowercase                 = "1"
  password_min_number                    = "1"
  password_min_symbol                    = "1"
  password_min_uppercase                 = "1"
  password_show_lockout_failures         = "true"
  priority                               = "2"
  question_min_length                    = "4"
  question_recovery                      = "ACTIVE"
  recovery_email_token                   = "30"
  skip_unlock                            = "false"
  sms_recovery                           = "ACTIVE"
  status                                 = "ACTIVE"
}

resource "okta_policy_rule_password" "self-service" {
  name               = "Self-Service"
  network_connection = "ANYWHERE"
  password_change    = "ALLOW"
  password_reset     = "ALLOW"
  password_unlock    = "ALLOW"
  policy_id          = okta_policy_password.active-directory-policy.id
  priority           = "1"
  status             = "ACTIVE"
}

resource "okta_policy_rule_password" "default-active-directory-rule" {
  name               = "Default Rule"
  network_connection = "ANYWHERE"
  password_change    = "DENY"
  password_reset     = "DENY"
  password_unlock    = "DENY"
  policy_id          = okta_policy_password.active-directory-policy.id
  priority           = "2"
  status             = "ACTIVE"
}