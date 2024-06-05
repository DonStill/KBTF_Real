module "vpc" {
  source        = "./vpc"
  cidr_block    = "192.168.0.0/16"
  cidr_block_s1 = "192.168.1.0/24"
  az_s1         = "us-east-2a"
  cidr_block_s2 = "192.168.2.0/24"
  az_s2         = "us-east-2b"
  cidr_block_rt = "0.0.0.0/0"
}

module "lt_sg" {
  source             = "./lt_sg"
  launchtemp         = module.lt_sg.launchtemp
  launchtemp_version = module.lt_sg.launchtemp_version
  vpcid              = module.vpc.vpcid
  depends_on         = [module.vpc]
}

module "eks" {
  source             = "./eks"
  subnet1            = module.vpc.subnet1
  subnet2            = module.vpc.subnet2
  sgid               = module.lt_sg.sgid
  launchtemp         = module.lt_sg.launchtemp
  launchtemp_version = module.lt_sg.launchtemp_version
  depends_on         = [module.lt_sg]
}