output "name" {
  value       = snowflake_schema.lonestar-schema.name
  description = "Name of the created schema"
}

output "database" {
  value       = snowflake_schema.lonestar-schema.database
  description = "Database that owns this schema"
}

output "fully_qualified_name" {
  value       = snowflake_schema.lonestar-schema.fully_qualified_name
  description = "Fully qualified name (\"DB\".\"SCHEMA\") for use in grant resources"
}
