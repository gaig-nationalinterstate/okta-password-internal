data "okta_user" "box-sd" {
  count = var.env == "prd" ? 1 : 0
  search {
    name  = "profile.firstName"
    value = "box"
  }

  search {
    name  = "profile.lastName"
    value = "sd"
  }
}