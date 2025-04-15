resource "aws_subnet" "private-subnet" {
  #   count             = 3 #012
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_cidr_block[count.index]
  private_dns_hostname_type_on_launch = "ip-name"
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-private-subnet-${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}