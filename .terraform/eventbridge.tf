resource "aws_cloudwatch_event_rule" "go_lambda_every_minute" {
  name                = var.event_rule_name
  description         = var.event_description
  schedule_expression = var.event_schedule_expression
}

resource "aws_cloudwatch_event_target" "trigger_lambda_on_schedule" {
  rule      = aws_cloudwatch_event_rule.go_lambda_every_minute.name
  target_id = "lambda"
  arn       = aws_lambda_function.go_lambda_function.arn
}
