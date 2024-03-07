#---vpc-main.tf

resource "aws_vpc" "3_tier_vpc" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name = "3_tier_vpc"
    }
}
