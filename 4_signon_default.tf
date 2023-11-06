resource "okta_policy_signon" "default-policy" {
  description     = "The default policy applies in all situations if no other policy applies."
  groups_included = [data.okta_group.everyone.id]
  name            = "Default Policy"
  priority        = "4"
  status          = "ACTIVE"
}

resource "okta_policy_rule_signon" "force-multifactor-prd" {
  count               = var.env == "prd" ? 1 : 0
  access              = "ALLOW"
  authtype            = "ANY"
  identity_provider   = "ANY"
  mfa_lifetime        = "1440"
  mfa_prompt          = "SESSION"
  mfa_remember_device = "false"
  mfa_required        = "true"
  name                = "Force multifactor"
  network_connection  = "ANYWHERE"
  policy_id           = okta_policy_signon.default-policy.id
  primary_factor      = "PASSWORD_IDP"
  priority            = "1"
  risc_level          = "ANY"
  session_idle        = "720"
  session_lifetime    = "1440"
  session_persistent  = "false"
  status              = "ACTIVE"
}

resource "okta_policy_rule_signon" "default-rule" {
  access              = "ALLOW"
  authtype            = "ANY"
  mfa_lifetime        = "0"
  mfa_remember_device = "false"
  mfa_required        = "false"
  identity_provider   = ""
  name                = "Default Rule"
  risc_level          = ""
  network_connection  = "ANYWHERE"
  policy_id           = okta_policy_signon.default-policy.id
  primary_factor      = "PASSWORD_IDP"
  priority            = "2"
  session_idle        = "120"
  session_lifetime    = "0"
  session_persistent  = "false"
  status              = "ACTIVE"
}

