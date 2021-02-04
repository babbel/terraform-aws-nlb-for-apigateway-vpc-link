resource "aws_subnet" "this" {
  vpc_id = var.vpc.id

  availability_zone = var.availability_zone
  cidr_block        = var.cidr_block

  map_public_ip_on_launch = false

  tags = merge({
    Name = "private - ${var.name} - ${var.availability_zone}"
  }, var.tags)
}

resource "aws_route_table" "this" {
  vpc_id = var.vpc.id

  tags = merge({
    Name = "private - ${var.name} - ${var.availability_zone}"
  }, var.tags)
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}
