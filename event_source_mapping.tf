resource "aws_lambda_event_source_mapping" "main" {
  event_source_arn  = aws_dynamodb_table.main
  function_name     = aws_lambda_function.main.arn
  starting_position = "LATEST"
  enabled           = true
}
