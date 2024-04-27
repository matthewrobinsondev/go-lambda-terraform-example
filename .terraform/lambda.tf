resource "aws_lambda_function" "go_lambda_function" {
  function_name = var.function_name
  role          = aws_iam_role.go_lambda_role.arn
  package_type  = "Zip"
  handler       = "bootstrap"
  runtime       = "provided.al2023"

  filename         = "../function.zip"
  source_code_hash = filebase64sha256("../function.zip")

  depends_on = [
    aws_iam_role.go_lambda_role
  ]

  tags = {
    Name = "Go Lambda Example"
  }
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_split_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.go_lambda_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.go_lambda_every_minute.arn
}
