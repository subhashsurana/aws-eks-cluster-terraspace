locals {
  common_tags = {
    Env       = "<%= Terraspace.env %>"  
    ManagedBy = "terraform"
  }
}