provider "aws" {
    region = "eu-central-1"
}

resource "aws_iam_user" "lb" {              # Creating 3 users
    name = "iamuser.${count.index}"
    count = 3
    path = "/system/"
}

output "arns" {                             # Separated output wirh list of arns for users
    value = aws_iam_user.lb[*].arn
}

output "name" {                             # Separated output wirh list of arns for users
    value = aws_iam_user.lb[*].name
}

output zipmap {                             # Used zipmap function, to output complet list of names with arns for each new user. 
    value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}