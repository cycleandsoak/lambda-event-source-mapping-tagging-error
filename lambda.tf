data "archive_file" "main" {
  type        = "zip"
  output_path = "tmp/lambda_handler.js.zip"
  source {
    content  = <<EOF
      module.exports.handler = async (event, context, callback) => {
        console.log('Hello, World');
        callback(null, 'Hello, World');
      };
EOF
    filename = "main.js"
  }
}

resource "aws_lambda_function" "main" {
  function_name    = "LambdaEventSourceMappingTaggingErrorExample_SafeToDelete"
  filename         = data.archive_file.main.output_path
  handler          = "main.handler"
  source_code_hash = data.archive_file.main.output_base64sha256
  role             = aws_iam_role.lambda.arn
  runtime          = "nodejs20.x"
}

resource "aws_iam_role" "lambda" {
  name               = "LambdaEventSourceMappingTaggingErrorExample_SafeToDelete"
  assume_role_policy = data.aws_iam_policy_document.allow_lambda_to_assume_this_role.json
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.lambda.name
  policy_arn = data.aws_iam_policy.AWSLambdaBasicExecutionRole.arn
}

data "aws_iam_policy" "AWSLambdaBasicExecutionRole" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "aws_iam_policy_document" "allow_lambda_to_assume_this_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
