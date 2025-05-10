resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name        = "${var.vpc_name}"
    Owner       = local.Owner
    costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    Terraform = "true"
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.vpc_name}-IGW"
    Environment = var.environment
  }
   lifecycle {
    create_before_destroy = true
  }
}