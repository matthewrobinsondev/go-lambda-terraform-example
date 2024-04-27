variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "function_name" {
  description = "Name of our lambda function"
  type        = string
  default     = "getting-started-with-lambda"
}

variable "lambda_role_name" {
  description = "IAM role name for our Lambda function"
  type        = string
  default     = "go-lambda-role"
}

variable "lambda_memory_size" {
  description = "Memory allocated for the Lambda function"
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "Timeout in seconds for the Lambda function"
  type        = number
  default     = 3
}

variable "event_rule_name" {
  description = "Name for the EventBridge rule"
  type        = string
  default     = "go-lambda-every-minute"
}

variable "event_description" {
  description = "Description of what the EventBridge rule does"
  type        = string
  default     = "Fires every minute"
}

variable "event_schedule_expression" {
  description = "Schedule expression for the EventBridge rule"
  type        = string
  default     = "rate(1 minutes)"
}
