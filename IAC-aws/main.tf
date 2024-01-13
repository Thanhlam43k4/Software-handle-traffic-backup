provider "aws"{
    region = "ap-northeast-1"
}

module "vpc"{
    source = "./vpc-module"
    vpc_cidr_block = "10.0.0.0/16"
    public_subnet = "10.0.1.0/24"
    Availability_zones = "ap-northeast-1a"
}
module "ec2"{
    source ="./ec2-module"
    vpc-id =  module.vpc.vpc_id
    public_subnet_id = module.vpc.public_subnet_id
    instance_type = "t2.micro"
    ami =  "ami-012261b9035f8f938"
    availability_zone = "ap-northeast-1a"
    user-data = "user-data.sh"
    key-id = "to-do-key"

}

output "public_ip_ec2"{
    value = module.ec2.public_ip
}
output "public_dns_ec2"{
    value = module.ec2.public_dns
}