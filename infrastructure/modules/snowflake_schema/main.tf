resource "snowflake_schema" "lonestar-schema" {
  name     = var.name
  database = var.database
  comment  = var.comment
}
