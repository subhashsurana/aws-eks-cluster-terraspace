provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  name   = "${var.cluster_name}-${var.vpc_name}"
  region = "<%= ENV['AWS_REGION'] %>"

  vpc_cidr = var.eks_vpc_block
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)

  tags = {
    Name    = local.name
    Environment = "<%= Terraspace.env %>"
  }
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../../modules/vpc" # updated by terraspace

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  # Private subnets
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]

  # Public subnets
  public_subnets = [
    for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k + length(local.azs))
  ]

  enable_nat_gateway = true
  single_nat_gateway = false
  one_nat_gateway_per_az = false
  
  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_flow_log                      = true
  create_flow_log_cloudwatch_iam_role  = true
  create_flow_log_cloudwatch_log_group = true

  public_subnet_tags = {
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
      "kubernetes.io/role/elb" = "1"
    }

  private_subnet_tags = {
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
      "kubernetes.io/role/internal-elb" = "1"
    }
  

  tags = merge(
    local.common_tags
  )

  vpc_tags = merge(
    local.common_tags,
    {
      Name = local.name
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    },
    )
    
  manage_default_network_acl = true
  
  manage_default_route_table = true
  
  manage_default_security_group = true
}
