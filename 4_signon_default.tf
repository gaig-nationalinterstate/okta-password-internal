resource "okta_policy_signon" "default-policy" {
  description     = "The default policy applies in all situations if no other policy applies."
  groups_included = [data.okta_group.everyone.id]
  name            = "Default Policy"
  priority        = "5"
  status          = "ACTIVE"
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

