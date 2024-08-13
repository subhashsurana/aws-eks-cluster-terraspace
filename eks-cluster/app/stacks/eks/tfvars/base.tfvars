vpc_id = <%= output('vpc.vpc_id') %>

private_subnets = <%= output('vpc.private_subnets') %>
public_subnets = <%= output('vpc.public_subnets') %>
intra_subnets = <%= output('vpc.intra_subnets') %>
vpc_cidr_block = <%= output('vpc.vpc_cidr_block') %>
#vpc_name                  = "eks-<%= Terraspace.env %>-vpc"
cluster_name = "eks-<%= Terraspace.env %>-cluster"
node_group_name           = "eks-managed-ng"
cluster_enabled_log_types = [ "api", "audit", "authenticator", "controllerManager", "scheduler",] # list(string)

