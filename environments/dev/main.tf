module "main-vpc" {
  source     = "../../modules/networking"
  ENV        = var.ENV
  AWS_REGION = var.AWS_REGION
}

module "instances" {
    source = "../../modules/ec2"
    ENV        = var.ENV
    VPC_ID = module.main-vpc.vpc_id
    PUBLIC_SUBNETS = module.main-vpc.public_subnets
    PRIVATE_SUBNETS = module.main-vpc.private_subnets 
}
