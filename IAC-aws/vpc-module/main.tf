resource "aws_vpc" "vpc"{
    cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true
    tags={
        "Name" = "Vpc_micro_pj"
    }
}
resource "aws_subnet" "public_subnet"{
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet
    availability_zone = var.Availability_zones
    map_public_ip_on_launch = true  # Enable auto-assigning public IPv4 addresses
    tags = {
        "Name" = "Public_subnet"
    }
}

resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.vpc.id
    tags ={
        "Name" = "Igw_micro_pj"
    }   
}

resource "aws_route_table" "rtb"{
    vpc_id = aws_vpc.vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }   
    tags ={
        "Name" = "Rtb_micro_pj"
    }
}
resource "aws_route_table_association" "rtb_association"{
    subnet_id = aws_subnet.public_subnet.id
    
    route_table_id =  aws_route_table.rtb.id
}
