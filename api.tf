resource "aws_apigatewayv2_api" "week13-apigw" {
  name                       = "week13-apigw"
  protocol_type              = "HTTP"
  target = "arn:aws:lambda:us-east-1:128928602505:function:week13-lambda"
}

resource "aws_apigatewayv2_integration" "week13-integration" {
  api_id           = aws_apigatewayv2_api.week13-apigw.id
  integration_type = "AWS_PROXY"
  integration_uri = "arn:aws:lambda:us-east-1:128928602505:function:week13-lambda"
  payload_format_version = "2.0"
}

