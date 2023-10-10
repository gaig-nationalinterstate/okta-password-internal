resource "okta_policy_signon" "internal-accounts" {
  description     = "Policy applied to accounts that are internal to NATL (Active Directory)"
  groups_included = [data.okta_group.copilot-internal.id, data.okta_group.quote-underwriters.id]
  name            = "Multifactor for Internal Accounts"
  priority        = "3"
  status          = "ACTIVE"
}

resource "okta_policy_rule_signon" "outside-of-network" {
  access              = "ALLOW"
  authtype            = "ANY"
  mfa_lifetime        = "15"
  mfa_prompt          = "SESSION"
  mfa_remember_device = "false"
  mfa_required        = "true"
  identity_provider   = ""
  name                = "MFA when outside of network"
  risc_level          = ""
  network_connection  = "ZONE"
  network_excludes    = [data.okta_network_zone.internal.id]
  policy_id           = okta_policy_signon.internal-accounts.id
  primary_factor      = "PASSWORD_IDP"
  priority            = "1"
  session_idle        = "120"
  session_lifetime    = "0"
  session_persistent  = "false"
  status              = "ACTIVE"
}