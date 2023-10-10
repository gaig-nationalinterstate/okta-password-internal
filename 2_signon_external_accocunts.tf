resource "okta_policy_signon" "external-accounts" {
  description = "External users are required to setup SMS 2 factor to access okta. Once authenticated they can access all assigned applications without having to use 2 factor again. See multifactor enrollment policies for more info."
  groups_included = [
    data.okta_group.cognos-external.id,
    data.okta_group.cognos-external-dev.id,
    data.okta_group.copilot-agents.id,
    data.okta_group.copilot-insureds.id,
    data.okta_group.copilot-users.id,
    data.okta_group.quote-agents.id
  ]
  name     = "Multifactor for External Accounts"
  priority = "2"
  status   = "ACTIVE"
}

resource "okta_policy_rule_signon" "new-connections" {
  access   = "ALLOW"
  authtype = "ANY"
  behaviors = [
    data.okta_behavior.new-geo-location.id,
    data.okta_behavior.new-country.id,
    data.okta_behavior.new-state.id,
    data.okta_behavior.new-city.id,
    data.okta_behavior.new-ip.id,
    data.okta_behavior.new-device.id,
    data.okta_behavior.velocity.id
  ]
  mfa_lifetime        = "43200"
  mfa_prompt          = "SESSION"
  mfa_remember_device = "false"
  mfa_required        = "true"
  identity_provider   = ""
  name                = "Prompts for MFA - New Connections"
  network_connection  = "ANYWHERE"
  policy_id           = okta_policy_signon.external-accounts.id
  primary_factor      = "PASSWORD_IDP"
  priority            = "1"
  risc_level          = "ANY"
  session_idle        = "120"
  session_lifetime    = "0"
  session_persistent  = "false"
  status              = "ACTIVE"
}