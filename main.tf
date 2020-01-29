# Setting a provider
provider "aws" {
  region = "eu-west-1"
}

# Creating a VPC
resource "aws_vpc" "2_tier_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.tags
  }
}

# Internet Gateway
resource "aws_internet_gateway" "2_tier_gw" {
  vpc_id = aws_vpc.2_tier_vpc.id
  tags = {
    Name = var.tags
  }
}

# Creating a public subnet
resource = "aws_subnet" "2_tier_public_subnet" {
  vpc_id = aws_vpc.2_tier_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = var.tags
  }
}

# Route Table for public subnet
resource "aws_route_table" "vpc_route_public" {
  vpc_id = aws_vpc.2_tier_vpc.id
  tags = {
    Name = var.tags
  }
}

# Public route table associations
resource "aws_route_table_association" "vpc_assoc_public" {
  subnet_id = aws_subnet.2_tier_public_subnet.id
  route_table_id = aws_route_table.vpc_route_public.id
}

# Creating a private subnet
resource = "aws_subnet" "2_tier_private_subnet" {
  vpc_id = aws_vpc.2_tier_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = var.tags
  }
}


# Route Table for private subnet
resource "aws_route_table" "vpc_route_private" {
  vpc_id = aws_vpc.2_tier_vpc.id
  tags = {
    Name = var.tags
  }
}

# private route table associations
resource "aws_route_table_association" "vpc_assoc_private" {
  subnet_id = aws_subnet.2_tier_private_subnet.id
  route_table_id = aws_route_table.vpc_route_private.id
}
