resource "snowflake_database" "prod_db" {
  name    = "PROD_DB"
  comment = "Lone Star Assurance production data platform"
}
