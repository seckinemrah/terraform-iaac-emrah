resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.task-state-class.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = "${var.tags}"
}

# Route Table Association

resource "aws_route_table_association" "b1" {
  subnet_id      = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "b2" {
  subnet_id      = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "b3" {
  subnet_id      = "${aws_subnet.public3.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.task-state-class.id}"
  tags   = "${var.tags}"
}

resource "aws_eip" "nat" {
  vpc  = true
  tags = "${var.tags}"
}
