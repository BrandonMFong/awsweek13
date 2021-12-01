resource "aws_apigatewayv2_api" "week13-apigw" {
  name                       = "week13-apigw"
  protocol_type              = "HTTP"
  target = "arn:aws:lambda:us-east-1:128928602505:function:week13-lambda"
}
