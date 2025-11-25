locals {
  owner       = "yletter"
  environment = "dev"
  project     = "release-management"
  common_tags = {
    Owner       = local.owner
    Environment = local.environment
    Project     = local.project
  }
  vpc_tags = merge(
    local.common_tags,
    { Date = "2025-11-25" }
  )

}