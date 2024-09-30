locals {
  user_names = ["pavan", "divya", "keerthi", "paparao", "a"]
}

# Create multiple IAM users using count
resource "aws_iam_user" "example_users" {
  count = length(local.user_names)  # Use the length of the user_names list
  name  = local.user_names[count.index]  # Correctly reference user names
}

# Attach the S3 full access policy to each user
resource "aws_iam_policy_attachment" "s3_full_access" {
  count      = length(aws_iam_user.example_users)
  name       = "attach_s3_full_access_to_user_${aws_iam_user.example_users[count.index].name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  users      = [aws_iam_user.example_users[count.index].name]  # Reference the specific user instance
}

output "user_arns" {
  value = [for user in aws_iam_user.example_users : user.arn]  # Output ARNs of created users
}
