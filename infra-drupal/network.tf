// Subnet public 3
resource "aws_subnet" "pub3" {
    vpc_id = data.aws_vpc.vpc.id
    cidr_block = "10.0.42.0/24"
    availability_zone = "${var.az_a}"
    tags = {
      Name = "${var.user}-${var.app}-pub3"
    }
}

resource "aws_route_table" "pub3-rt" {
    vpc_id = data.aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_internet_gateway.igw.id
    }

    tags = {
      Name = "${var.user}-${var.app}-pub3-rt"
    }
}

resource "aws_route_table_association" "pub3-ass" {
    subnet_id = aws_subnet.pub3.id
    route_table_id = aws_route_table.pub3-rt.id
}
#######################################################################################################################
// Subnet privé 5
resource "aws_subnet" "priv5" {
    vpc_id = data.aws_vpc.vpc.id
    cidr_block = "10.0.54.0/24"
    availability_zone = "${var.az_a}"
    tags = {
      Name = "${var.user}-${var.app}-priv5"
    }
}

resource "aws_route_table" "priv5-rt" {
    vpc_id = data.aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_nat_gateway.ngw.id
    }

    tags = {
      Name = "${var.user}-${var.app}-priv5-rt"
    }
}

resource "aws_route_table_association" "priv5-ass" {
    subnet_id = aws_subnet.priv5.id
    route_table_id = aws_route_table.priv5-rt.id
}


// Subnet privé 6
resource "aws_subnet" "priv6" {
    vpc_id = data.aws_vpc.vpc.id
    cidr_block = "10.0.55.0/24"
    availability_zone = "${var.az_b}"
    tags = {
      Name = "${var.user}-${var.app}-priv6"
    }
}

resource "aws_route_table" "priv6-rt" {
    vpc_id = data.aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_nat_gateway.ngw.id
    }

    tags = {
      Name = "${var.user}-${var.app}-priv6-rt"
    }
}

resource "aws_route_table_association" "priv6-ass" {
    subnet_id = aws_subnet.priv6.id
    route_table_id = aws_route_table.priv6-rt.id
}