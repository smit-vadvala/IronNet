provider "aws" {
  region                  = "${var.rgn}"
  shared_credentials_file = "/Users/ruchi/Desktop/Smit Vadvala/Smit Vadvala/Creds"
  profile                 = "${var.profile}"
  alias = "Admin-Account"
  assume_role{
    role_arn = "arn:aws:iam::751466979087:role/Admin_Role"
    session_name = "SESSION_NAME"
    external_id = "EXTERNAL_ID"
  }

}


module "VPC" {
  source = "/Users/ruchi/Desktop/Smit Vadvala/Smit Vadvala/VPC"
  providers = {
    aws = "aws.Admin-Account"
  }
  region = "${var.rgn}"
  vpc_cidr = "10.0.0.0/23"
  public_subnet_cidr1 = "10.0.0.0/25"
  public_subnet_cidr2 = "10.0.0.128/25"
  private_subnet_cidr1 = "10.0.1.0/25"
  private_subnet_cidr2 = "10.0.1.128/25"
  AccountName = "Admin-Account"

}

module "SQl"{
  source = "/Users/ruchi/Desktop/Smit Vadvala/Smit Vadvala/SQL"
  providers = {
    aws = "aws.Admin-Account"
  }
  subnet1 = "${module.VPC.pr1subnet_id}"
  subnet2 = "${module.VPC.pr2subnet_id}"
  sg = "${module.VPC.SG_id}"
}


module "ECS"{
  source = "/Users/ruchi/Desktop/Smit Vadvala/Smit Vadvala/ECS"
  providers = {
    aws = "aws.Admin-Account"
  }
  test_public_01 = "${module.VPC.pub1subnet_id}"
  test_public_02 = "${module.VPC.pub2subnet_id}"
  test_public_sg = "${module.VPC.SG_id}"
  test_vpc = "${module.VPC.vpc_id}"
  ecs_key_pair_name = "${var.ekey}"

}
