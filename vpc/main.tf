resource "aws_vpc" "local_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    
    tags = {
      
      name = "local_vpc"
    }
  
}

resource "aws_subnet" "public_sub" {
    vpc_id = aws_vpc.local_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1"

    tags = {
        name = "local_pbsub"
    }
}

resource "aws_security_group" "sec_local" {
    vpc_id = aws_vpc.local_vpc.id
    name = "sec_local"
    description = "Security group for my test vpc "

    ingress {
        protocol ="tcp"
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
resource "aws_internet_gateway" "loc_gt_pb"{
    vpc_id = aws_vpc.local_vpc.id

}

resource "aws_route_table" "public_rt_table"{
    vpc_id = aws_vpc.local_vpc.id
}

resource "aws_route" "interent_gt"{
     route_table_id = aws_route_table.public_rt_table.id
     gateway_id = aws_internet_gateway.loc_gt_pb.id
     destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "pb_sb_assoc"{
    subnet_id = aws_subnet.public_sub.id
    route_table_id = aws_route_table.public_rt_table.id
}
