provider "aws" {
  region = "eu-west-1"
}

resource "aws_iam_user" "lb1" {
  name = "loadbalancer"
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "test"
  user   = aws_iam_user.lb1.name
  policy = file ("./s3_full_policy.json")
}