# EC2
/* resource "aws_instance" "week13-bastion-vm" {
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.week13-sub-b.id

  vpc_security_group_ids = [
    aws_security_group.week13-ssh-sg-v2.id
  ]

  key_name = "ECE592"

  tags = {
    Name = "week13-bastion-vm"
  }
}*/

## IAM profile ref
#resource "aws_iam_instance_profile" "week13-profile-ref" {
#  name = "week13-profile-ref"
#  role = aws_iam_role.week13-role.name
#  tags = {
#    Name = "week13-profile-ref"
#  }
#}

