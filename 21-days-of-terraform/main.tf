provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source        = "./vpc"
  vpc_cidr      = "${var.vpc_cidr}"
  public_cidrs  = "${var.public_cidrs}"
  private_cidrs = "${var.private_cidrs}"
  zones         = "${var.zones}"
}

module "instances" {
  source         = "./instances"
  my_public_key  = "${var.my_public_key}"
  instance_type  = "t2.micro"
  security_group = module.vpc.security_group
  subnets        = module.vpc.public_subnets
  zones          = "${var.zones}"
}

module "load_balancers" {
  source       = "./load_balancers"
  vpc_id       = module.vpc.vpc_id
  instance1_id = module.instances.instance1_id
  instance2_id = module.instances.instance2_id
  subnet1      = module.vpc.subnet1
  subnet2      = module.vpc.subnet2
}

module "auto_scaling" {
  source           = "./autoscaling"
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.public_subnets
  target_group_arn = module.load_balancers.alb_target_group_arn
  zones            = "${var.zones}"
}

module "sns_topic" {
  source       = "./sns"
  alarms_email = "tamjbart@gmail.com"
}
