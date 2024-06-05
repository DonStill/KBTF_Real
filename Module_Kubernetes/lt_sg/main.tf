// SG
resource "aws_security_group" "kbsg" {
  name        = "kbsg"
  description = "SG for EKS and KB"
  vpc_id      = var.vpcid

  ingress {
    description = "ALL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "ALL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "launchtemp" {
  name                   = "launchtemp"
  vpc_security_group_ids = [aws_security_group.kbsg.id]

  depends_on = [aws_security_group.kbsg]
}