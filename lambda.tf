resource "aws_lambda_function" "delete_ebs_volume" {
  filename      = "lambda_function.zip"
  function_name = "delete_ebs_volume"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  timeout       = 30 # Increase the timeout to 30 seconds

  source_code_hash = filebase64sha256("lambda_function.zip")

  #   environment {
  #     variables = {
  #       REGION = "us-east-1"
  #     }
  #   }
  tags = local.tags
}

resource "aws_lambda_invocation" "invoke_delete_ebs_volumes" {
  function_name = aws_lambda_function.delete_ebs_volume.function_name
  count         = length(var.volume_ids) # Assuming volume_ids is a list variable containing your volume IDs

  input = jsonencode({
    volume_id = element(var.volume_ids, count.index) # Pass each volume ID sequentially
  })

}

