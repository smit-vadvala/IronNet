



output "currentaccount_id" {
  value = "${module.SQl.account_id}"
}

output "VPC-ID" {
  value = "${module.VPC.vpc_id}"
}
output "subnet1_id" {
  description = "The ID of the Private subnet1"
  value = "${module.VPC.pr1subnet_id}"
}
output "subnet2_id" {
  description = "The ID of the Private Subnet2"
  value = "${module.VPC.pr2subnet_id}"
}

output "SecGroup_id" {
  description = "The ID of the SecurityGroup"
  value = "${module.VPC.SG_id}"
}

output "RDS-end-point" {
  value = "${module.SQl.rds-end-point}"
}

output "RDS-identifier" {
  value = "${module.SQl.rds-identifier}"
}