# Data source to the "Everyone" group. This ensures we grab correct group ID per environment
data "okta_group" "everyone" {
  name = "Everyone"
}

data "okta_group" "domain-users" {
  name = "Domain Users"
}

data "okta_group" "cognos-external" {
  name = "Cognos_External"
}

data "okta_group" "cognos-external-dev" {
  name = "Cognos_External_Dev"
}

data "okta_group" "copilot-agents" {
  name = "Copilot_Agents"
}

data "okta_group" "copilot-insureds" {
  name = "Copilot_Insureds"
}

data "okta_group" "copilot-users" {
  name = "Copilot_Users"
}

data "okta_group" "copilot-internal" {
  name = "Copilot_Internal"
}

data "okta_group" "quote-agents" {
  name = "Quote_Agents"
}

data "okta_group" "quote-underwriters" {
  name = "Quote_Underwriters"
}