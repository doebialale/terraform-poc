# resource "aws_vpc" "testers" {
#     cidr_block = "10.1.0.0/16"
#     tags = {
#         Name = "testers"
#     }
# }

# resource "aws_subnet"     "AZ1PUB1" {
#     cidr_block = var.PubSN1Cidr
#     vpc_id = aws_vpc.S2S.id
#     availability_zone = "${var.AZ1}"
#     map_public_ip_on_launch = "true"
#     tags = {Name = "AZ1 Pub SN 1"
#     }
# }
# resource "aws_subnet" "AZ2PUB1" {
#     cidr_block = var.PubSN2Cidr
#     vpc_id = aws_vpc.S2S.id
#     availability_zone = "${var.AZ2}"
#     map_public_ip_on_launch = "true"
#     tags = {Name = "AZ2 Pub SN 1"
#     }
# }
# resource "aws_subnet" "AZ1PRI1" {
#     cidr_block = var.PrvtSN1Cidr
#     vpc_id = aws_vpc.S2S.id
#     availability_zone = "${var.AZ1}"
#     tags = {Name = "AZ1 PRI SN 1"
#     }
# }
# resource "aws_subnet" "AZ2PRI1" {
#     cidr_block = var.PrvtSN2Cidr
#     vpc_id = aws_vpc.S2S.id
#     availability_zone = "${var.AZ2}"
#     tags = {Name = "AZ2 PRI SN 1"
#     }
# }
# resource "aws_subnet" "AZ1PRI2" {
#     cidr_block = var.PrvtSN3Cidr
#     vpc_id = aws_vpc.S2S.id
#     availability_zone = "${var.AZ1}"
#     tags = {Name = "AZ1 PRI SN 2"
#     }
# }
# resource "aws_subnet" "AZ2PRI2" {
#     cidr_block  = var.PrvtSN4Cidr
#     vpc_id      = aws_vpc.S2S.id
#     availability_zone = var.AZ2
#     tags = {
#         Name = "AZ2 PRI SN 2"
#     }
# }

# resource "aws_internet_gateway" "S2S_IGW" {
#   vpc_id = aws_vpc.S2S.id
#   tags = {
#     Name = "S2S IGW"
#   }
# }

# resource "aws_route_table" "S2S_RT1" {
#   vpc_id      = aws_vpc.S2S.id
#   tags = {
#     Name = "S2S RT1"
#   }
# }

# resource "aws_route" "S2SRoute" {
#   route_table_id            = aws_route_table.S2S_RT1.id
#   destination_cidr_block    = "0.0.0.0/0"
#   gateway_id = aws_internet_gateway.S2S_IGW.id
#   depends_on                = [aws_internet_gateway.S2S_IGW]
# }



# resource "aws_route_table_association" "AZ1_PUB_RT_Assoc" {
#   subnet_id      = aws_subnet.AZ1PUB1.id
#   route_table_id = aws_route_table.S2S_RT1.id
# }

# resource "aws_route_table_association" "AZ2_PUB_RT_Assoc" {
#   subnet_id      = aws_subnet.AZ2PUB1.id
#   route_table_id = aws_route_table.S2S_RT1.id
# }

# # resource "aws_eip" "S2S_EIP" {
# #  vpc      = true
# # }

# # resource "aws_nat_gateway" "S2S_NAT_GW" {
# #   allocation_id = aws_eip.S2S_EIP.id
# #   subnet_id     = aws_subnet.AZ1PUB1.id

# #   tags = {
# #     Name = "S2S NAT GW"
# #   }
# #   depends_on = [aws_eip.S2S_EIP]
# # }

# # resource "aws_route_table" "S2S_RT2" {
# #   vpc_id      = aws_vpc.S2S.id
# #     route {
# #         cidr_block = "0.0.0.0/0"
# #         gateway_id = aws_nat_gateway.S2S_NAT_GW.id
# #     }
# #   tags = {
# #     Name = "S2S RT1"
# #   }
# # }

# # resource "aws_route_table_association" "AZ1_APP_RT_Assoc" {
# #   subnet_id      = aws_subnet.AZ1PRI1.id
# #   route_table_id = aws_route_table.S2S_RT2.id
# # }

# # resource "aws_route_table_association" "AZ2_APP_RT_Assoc" {
# #   subnet_id      = aws_subnet.AZ2PRI1.id
# #   route_table_id = aws_route_table.S2S_RT2.id
# #}

# resource "aws_security_group" "pub_SG_Allow_80_443_22" {
#     name        = "for_web_tier"
#     description = "Allow 80 and 443 inbound traffic"
#     vpc_id = aws_vpc.S2S.id

#     ingress {
#         description      = "Allow port 443"
#         from_port        = 443
#         to_port          = 443
#         protocol         = "tcp"
#         cidr_blocks      = ["0.0.0.0/0"]
#     }

#     ingress {
#         description      = "Allow port 80"
#         from_port        = 80
#         to_port          = 80
#         protocol         = "tcp"
#         cidr_blocks      = ["0.0.0.0/0"]
#     }
#         ingress {
#         description      = "Allow port 22"
#         from_port        = 22
#         to_port          = 22
#         protocol         = "tcp"
#         cidr_blocks      = [var.MyIP]
#     }
    
#     tags = {
#         Name = "allow_web_tier"
#     }
# }

# resource "aws_security_group" "PRI_SG_Allow_SSH" {
#     name        = "for_app_tier"
#     description = "Allow port 22"
#     vpc_id = aws_vpc.S2S.id

#     ingress {
#         description      = "Allow SSH to my IP"
#         from_port        = 22
#         to_port          = 22
#         protocol         = "tcp"
#         cidr_blocks      = [var.MyIP]
#     }

#     tags = {
#         Name = "allow_app_tier"
#     }
# }

# # resource "aws_network_acl" "App_Tier" {
# #   vpc_id = aws_vpc.S2S.id
# #   subnet_ids = [aws_subnet.AZ1PRI1.id, aws_subnet.AZ1PRI2.id, aws_subnet.AZ2PRI1.id, aws_subnet.AZ2PRI2.id,]

# #   egress {
# #     protocol   = "tcp"
# #     rule_no    = 200
# #     action     = "allow"
# #     cidr_block = "10.0.0.0/24"
# #     from_port  = 443
# #     to_port    = 443
# #   }

# #   ingress {
# #     protocol   = "tcp"
# #     rule_no    = 100
# #     action     = "allow"
# #     cidr_block = "10.0.0.0/24"
# #     from_port  = 80
# #     to_port    = 80
# #   }
# #   egress {
# #     protocol   = "tcp"
# #     rule_no    = 210
# #     action     = "allow"
# #     cidr_block = "10.0.1.0/24" 
# #     from_port  = 443
# #     to_port    = 443
# #   }

# #   ingress {
# #     protocol   = "tcp"
# #     rule_no    = 110
# #     action     = "allow"
# #     cidr_block = "10.0.1.0/24" 
# #     from_port  = 80
# #     to_port    = 80
# #   }
# #   tags = {
# #     Name = "S2S App tier"
# #   }
# # }