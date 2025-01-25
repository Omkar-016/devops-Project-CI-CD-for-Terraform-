#root 

module "vpc" {
    source = "./vpc"
}

module "ec2" {
    source = "./container(ec2)"
    local_pbsub = module.vpc.local_pbsub
    sec_local =  module.vpc.sec_local
}