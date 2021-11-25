# Week 12
resource "aws_sns_topic" "week13-sns" {
  name              = "week13-sns"
  kms_master_key_id = "ECE592"
}

resource "aws_sns_topic_subscription" "week13-sns-mail" {
  topic_arn = aws_sns_topic.week13-sns.id
  protocol  = "email"
  endpoint  = "fong.m.brandon97@gmail.com"
}

