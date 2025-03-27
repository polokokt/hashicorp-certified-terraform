data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

data "aws_iam_users" "users" {}

output "users_number" {
  value = length(data.aws_iam_users.users.names)
}
output "users_list" {
  value = data.aws_iam_users.users.names
}

resource "aws_iam_user" "lb" {
  name = "admin-user-${data.aws_caller_identity.current.account_id}"
}