#####################################################################################
#VPC RESOURCE VARIABLES
#####################################################################################

variable "cluster_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  type        = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "intra_subnets" {
  type = list(string)
}

#####################################################################################
# EKS CLUSTER VARIABLES
#####################################################################################

variable "cluster_enabled_log_types" {
  description = "A list of the desired control plane logs to enable."
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "instance_types" {
  description = "Set of instance types associated with the EKS Node Group. Defaults to t3.medium"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "post_bootstrap_user_data" {
  description = "User data that is appended to the user data script after of the EKS bootstrap script. Not used when `platform` = `bottlerocket`"
  type        = string
  default     = ""
}

variable "bootstrap_extra_args" {
  description = "Additional arguments passed to the bootstrap script. When `platform` = `bottlerocket`; these are additional [settings](https://github.com/bottlerocket-os/bottlerocket#settings) that are provided to the Bottlerocket user data"
  type        = string
  default     = ""
}

variable "pre_bootstrap_user_data" {
  description = "User data that is injected into the user data script ahead of the EKS bootstrap script. Not used when `platform` = `bottlerocket`"
  type        = string
  default     = ""
}

variable "min_size" {
  description = "Minimum number of instances/nodes"
  type        = number
  default     = 0
}

variable "max_size" {
  description = "Maximum number of instances/nodes"
  type        = number
  default     = 3
}


variable "desired_size" {
  description = "Desired number of instances/nodes"
  type        = number
  default     = 1
}

variable "capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: `ON_DEMAND`, `SPOT`"
  type        = string
  default     = "ON_DEMAND"
}

variable "disk_size" {
  description = "Disk size in GiB for nodes. Defaults to `20`"
  type        = number
  default     = 20
}

variable "volume_size" {
  description = "Launch Template EBS volume type to be used."
  type        = number
  default     = 50
}

variable "volume_type" {
  description = "Launch Template EBS volume type to be used."
  type        = string
  default     = "gp3"
}

variable "volume_iops" {
  description = "IOPS value used for Launch Template EBS Volume"
  type        = number
  default     = 3000
}


variable "volume_throughput" {
  description = "Throughput value used for Launch Template EBS Volume"
  type        = number
  default     = 150
}

variable "node_group_name" {
  description = "Managed node group name"
  type        = string
  default     = "eks-managed-node-group"
}