data "okta_user" "box-sd" {
  search {
    name  = "profile.firstName"
    value = "box"
  }

  search {
    name  = "profile.lastName"
    value = "sd"
  }
}