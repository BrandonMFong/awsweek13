# Security Group
resource "aws_security_group" "week13-https-sg" {
  name        = "week13-https-sg"
  description = "Week10 endpoints tf"
  vpc_id      = aws_vpc.week13-vpc.id

  ingress = [{
    description = "SSH from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.week13-vpc.cidr_block]

    # Suggested by professor
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = [aws_security_group.week13-ssh-sg-v2.id]
    self             = false
  }]

  egress = [{
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    # Suggested
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]

  tags = {
    Name = "week13-ssh-pri-sg"
  }
}

# EC2
resource "aws_vpc_endpoint" "week13-sm-ep" {
  vpc_id            = aws_vpc.week13-vpc.id
  service_name      = "com.amazonaws.us-east-1.secretsmanager"
  vpc_endpoint_type = "Interface"
  subnet_ids = [aws_subnet.week13-pri-a.id, aws_subnet.week13-pri-b.id]

  security_group_ids = [
    aws_security_group.week13-https-sg.id,
  ]

  private_dns_enabled = true

  tags = {
    Environment = "EC2 Endpoint"
  }
}

