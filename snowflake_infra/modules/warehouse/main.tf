resource "snowflake_warehouse" "lonestar_warehouse" {
  name                = var.name
  warehouse_size      = var.size
  initially_suspended = var.initially_suspended
  resource_monitor    = snowflake_resource_monitor.ls_warehouse_monitor.name
  comment             = var.comment
}

resource "snowflake_resource_monitor" "ls_warehouse_monitor" {
  name            = "${var.name}_RM"
  credit_quota    = var.credit_quota
  frequency       = "MONTHLY"
  start_timestamp = "IMMEDIATELY"

  notify_users              = var.notify_users
  notify_triggers           = [75, 90]
  suspend_trigger           = 100
  suspend_immediate_trigger = 110
}
