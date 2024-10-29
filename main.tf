resource "aws_cloudwatch_log_metric_filter" "sg_metric_filter" {
  count          = length(var.sg_ids)
  log_group_name = var.cw_log_group_name
  name           = "${var.sg_ids[count.index]}-metric-filter"
  pattern        = "{ ($.eventSource = ec2.amazonaws.com) && ($.requestParameters.groupId = \"${var.sg_ids[count.index]}\") && ($.eventName = \"${join("\" || $.eventName = \"", var.sg_event_names)}\") }"

  metric_transformation {
    name      = "${var.sg_ids[count.index]}-metric-filter"
    namespace = var.cw_metric_filter_namespace
    value     = var.cw_metric_filter_value
  }
}

resource "aws_cloudwatch_metric_alarm" "elb_metric_filter_alarm" {
  count               = length(var.sg_ids)
  alarm_name          = "${var.sg_ids[count.index]}-metric-filter-alarm"
  comparison_operator = var.cw_metric_filter_alarm_comparison_operator
  evaluation_periods  = var.cw_metric_filter_alarm_evaluation_periods
  metric_name         = "${var.sg_ids[count.index]}-metric-filter"
  namespace           = var.cw_metric_filter_namespace
  period              = var.cw_metric_filter_alarm_period
  statistic           = var.cw_metric_filter_alarm_statistic
  threshold           = var.cw_metric_filter_alarm_threshold
  alarm_description   = "Alarm when Security Group ${var.sg_ids[count.index]} exceeds the specified threshold."
  alarm_actions       = var.cw_metric_filter_alarm_actions
}
