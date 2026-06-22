resource "snowflake_database" "lonestar_prod_db" {
  name    = "LONESTAR_PROD_DB"
  comment = "Lone Star Assurance production data platform"
}
