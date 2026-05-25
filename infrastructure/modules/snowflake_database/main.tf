resource "snowflake_database" "lonestar-database" {
  name    = var.name
  comment = var.comment
}
