resource "aws_dynamodb_table" "main" {
  name             = "LambdaEventSourceMappingTaggingErrorExample_SafeToDelete"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "Hash"
  range_key        = "Range"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "Hash"
    type = "S"
  }

  attribute {
    name = "Range"
    type = "S"
  }
}
