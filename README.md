# kubernetes-exercise
Repository for AWS EKS Cluster - Cyara Assignment

For the EKS cluster, Terraspace has been utilized for better code management and provisioning
Separate subdirectory 
- For cluster creation - `eks-cluster`
- sample nginx application deployment - `k8s`

  Commands to create **VPC** & **EKS** Stacks

  To create terraform plan - `terraspace plan vpc --out=vpc.plan`
  
  To provision the VPC Infrastructure `terraspace up vpc --plan=vpc.plan`

  Similarly for `eks` just replace with `vpc` in the above command
  
