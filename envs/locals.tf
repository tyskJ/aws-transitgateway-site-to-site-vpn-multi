/************************************************************
Common
************************************************************/
locals {
  account_id     = data.aws_caller_identity.current.account_id
  region_name    = data.aws_region.current.region
  partition_name = data.aws_partition.current.partition
}

/************************************************************
VPC & Subnets
************************************************************/
locals {
  vpcs = {
    aws = {
      name          = "aws-vpc"
      cidr          = "172.16.0.0/16"
      dns_hostnames = true
      dns_support   = true
    }
    onpremises = {
      name          = "onpremises-vpc"
      cidr          = "192.168.0.0/16"
      dns_hostnames = true
      dns_support   = true
    }
  }
  subnets = {
    aws_client_private_a = {
      vpc_key    = "aws"
      name       = "aws-client-private-subnet-a"
      az         = "a"
      cidr       = "172.16.1.0/24"
      map_public = false
    }
    aws_tgw_private_a = {
      vpc_key    = "aws"
      name       = "aws-client-tgw-subnet-a"
      az         = "a"
      cidr       = "172.16.254.240/28"
      map_public = false
    }
    onpremises_client_private_a = {
      vpc_key    = "onpremises"
      name       = "onpremises-client-private-subnet-a"
      az         = "a"
      cidr       = "192.168.1.0/24"
      map_public = false
    }
    onpremises_gateway_public_a = {
      vpc_key    = "onpremises"
      name       = "onpremises-gateway-public-subnet-a"
      az         = "a"
      cidr       = "192.168.254.240/28"
      map_public = false
    }
    onpremises_gateway_public_c = {
      vpc_key    = "onpremises"
      name       = "onpremises-gateway-public-subnet-c"
      az         = "c"
      cidr       = "192.168.255.240/28"
      map_public = false
    }
  }
}