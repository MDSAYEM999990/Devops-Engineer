resource "aws_subnet" "public-subnet" {
  #count             = 3 #012
  count             = length(var.public_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_cidr_block[count.index]
  map_public_ip_on_launch = true
  private_dns_hostname_type_on_launch = "ip-name"
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-public-subnet-${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}