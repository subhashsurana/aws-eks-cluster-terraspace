post_bootstrap_user_data  = <<-EOT
      cd /tmp
      sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
      sudo systemctl enable amazon-ssm-agent
      sudo systemctl start amazon-ssm-agent
      EOT

instance_types            = ["c5.xlarge","c5a.xlarge","c5ad.xlarge","c5d.xlarge","c6i.xlarge"] # list(string)
min_size                  = "1"
max_size                  = "5"
desired_size              = "1"
capacity_type             = "ON_DEMAND"
disk_size                 = 50
volume_size               = 50
volume_type               = "gp3"
volume_iops               = "3000"
volume_throughput         = "150"