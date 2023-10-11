resource "okta_policy_signon" "natl-employees" {
  description     = "Multifactor required for all NATL employees"
  groups_included = [data.okta_group.domain-users.id]
  name            = "Multifactor for all NATL employees"
  priority        = "1"
  status          = "ACTIVE"
}

resource "okta_policy_rule_signon" "force-multifactor" {
  access              = "ALLOW"
  authtype            = "ANY"
  identity_provider   = "ANY"
  mfa_lifetime        = "1440"
  mfa_prompt          = "SESSION"
  mfa_remember_device = "false"
  mfa_required        = "true"
  name                = "Force multifactor"
  network_connection  = "ANYWHERE"
  policy_id           = okta_policy_signon.natl-employees.id
  primary_factor      = "PASSWORD_IDP"
  priority            = "1"
  risc_level          = "ANY"
  session_idle        = "720"
  session_lifetime    = "1440"
  session_persistent  = "false"
  status              = "ACTIVE"
  users_excluded      = [var.env == "prd" ? data.okta_user.box-sd[0].id : ""]
}