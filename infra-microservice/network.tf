// Subnet privé 1
resource "aws_subnet" "priv1" {
    vpc_id = data.aws_vpc.vpc.id
    cidr_block = "10.0.50.0/24"
    availability_zone = "${var.az_a}"
    tags = {
      Name = "${var.user}-${var.app}-priv1"
    }
}

resource "aws_route_table" "priv1-rt" {
    vpc_id = data.aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_nat_gateway.ngw.id
    }

    tags = {
      Name = "${var.user}-${var.app}-priv1-rt"
    }
}

resource "aws_route_table_association" "priv1-ass" {
    subnet_id = aws_subnet.priv1.id
    route_table_id = aws_route_table.priv1-rt.id
}

// Subnet privé 2
resource "aws_subnet" "priv2" {
    vpc_id = data.aws_vpc.vpc.id
    cidr_block = "10.0.51.0/24"
    availability_zone = "${var.az_b}"
    tags = {
      Name = "${var.user}-${var.app}-priv2"
    }
}

resource "aws_route_table" "priv2-rt" {
    vpc_id = data.aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_nat_gateway.ngw.id
    }

    tags = {
      Name = "${var.user}-${var.app}-priv2-rt"
    }
}

resource "aws_route_table_association" "priv2-ass" {
    subnet_id = aws_subnet.priv2.id
    route_table_id = aws_route_table.priv2-rt.id
}

// Subnet privé 3
resource "aws_subnet" "priv3" {
    vpc_id = data.aws_vpc.vpc.id
    cidr_block = "10.0.52.0/24"
    availability_zone = "${var.az_a}"
    tags = {
      Name = "${var.user}-${var.app}-priv3"
    }
}

resource "aws_route_table" "priv3-rt" {
    vpc_id = data.aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_nat_gateway.ngw.id
    }

    tags = {
      Name = "${var.user}-${var.app}-priv3-rt"
    }
}

resource "aws_route_table_association" "priv3-ass" {
    subnet_id = aws_subnet.priv3.id
    route_table_id = aws_route_table.priv3-rt.id
}


// Subnet privé 4
resource "aws_subnet" "priv4" {
    vpc_id = data.aws_vpc.vpc.id
    cidr_block = "10.0.53.0/24"
    availability_zone = "${var.az_b}"
    tags = {
      Name = "${var.user}-${var.app}-priv4"
    }
}

resource "aws_route_table" "priv4-rt" {
    vpc_id = data.aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_nat_gateway.ngw.id
    }

    tags = {
      Name = "${var.user}-${var.app}-priv4-rt"
    }
}

resource "aws_route_table_association" "priv4-ass" {
    subnet_id = aws_subnet.priv4.id
    route_table_id = aws_route_table.priv4-rt.id
}

#########################################################################################################################

// Subnet public 1
resource "aws_subnet" "pub1" {
    vpc_id = data.aws_vpc.vpc.id
    cidr_block = "10.0.47.0/24"
    availability_zone = "${var.az_a}"
    tags = {
      Name = "${var.user}-${var.app}-pub1"
    }
}

resource "aws_route_table" "pub1-rt" {
    vpc_id = data.aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_internet_gateway.igw.id
    }

    tags = {
      Name = "${var.user}-${var.app}-pub1-rt"
    }
}

resource "aws_route_table_association" "pub1-ass" {
    subnet_id = aws_subnet.pub1.id
    route_table_id = aws_route_table.pub1-rt.id
}

// Subnet public 2
resource "aws_subnet" "pub2" {
    vpc_id = data.aws_vpc.vpc.id
    cidr_block = "10.0.48.0/24"
    availability_zone = "${var.az_b}"
    tags = {
      Name = "${var.user}-${var.app}-pub2"
    }
}

resource "aws_route_table" "pub2-rt" {
    vpc_id = data.aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_internet_gateway.igw.id
    }

    tags = {
      Name = "${var.user}-${var.app}-pub2-rt"
    }
}

resource "aws_route_table_association" "pub2-ass" {
    subnet_id = aws_subnet.pub2.id
    route_table_id = aws_route_table.pub2-rt.id
}