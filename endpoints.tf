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
    cidr_blocks = []

    # Suggested by professor
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
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

output "week13-rds-endpoint" {
  value = aws_rds_cluster.week13-rds.endpoint
}

