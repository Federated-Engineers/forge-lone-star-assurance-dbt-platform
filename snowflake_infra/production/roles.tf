resource "snowflake_account_role" "platform_eng" {
  name    = "PLATFORM_ENG_ROLE"
  comment = "Platform engineering role; owns the medallion schemas"
}

resource "snowflake_account_role" "data_eng" {
  name    = "DATA_ENG_ROLE"
  comment = "Builds the BRONZE, SILVER and GOLD layers"
}

resource "snowflake_account_role" "dbt_role" {
  name    = "DBT_ROLE"
  comment = "Functional role for the dbt service user"
}

resource "snowflake_account_role" "airflow_role" {
  name    = "AIRFLOW_ROLE"
  comment = "Functional role for the airflow service user"
}
