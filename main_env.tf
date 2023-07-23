provider "aws" {
    region = "ap-south-1"
}

module "ELB" {
    source = "../../Module"


elb_az = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
elb_listener_port = 80
elb_name = "My_terraform_LB"
inst_type = "t2.micro"
inst_ami_id = "ami-0763cf792771fe1bd"
inst_name = "terraform_ec2"
inst_count = 2
inst_subnet = "subnet-0038a146f5b76a30c"
inst_sg = "sg-0b047bdc140b68096"

}


