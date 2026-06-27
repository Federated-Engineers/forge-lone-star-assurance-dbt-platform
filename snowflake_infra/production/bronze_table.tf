resource "snowflake_table" "bronze_raw_daily_load" {
  database = snowflake_database.lonestar_prod_db.name
  schema   = snowflake_schema.bronze.name
  name     = "LONESTAR_DAILY_LOAD"
  comment  = "Raw nightly JSON dump from S3 with ingestion audit columns"

  column {
    name    = "LONESTAR_DATA"
    type    = "VARIANT"
    comment = "Raw JSON record as landed from S3"
  }

  column {
    name    = "SOURCE_FILE_NAME"
    type    = "VARCHAR"
    comment = "Staged file path, loaded from METADATA$FILENAME"
  }

  column {
    name    = "FILE_ROW_NUMBER"
    type    = "NUMBER(38,0)"
    comment = "Row number within the staged file, loaded from METADATA$FILE_ROW_NUMBER"
  }

  column {
    name    = "FILE_LAST_MODIFIED"
    type    = "TIMESTAMP_NTZ"
    comment = "Staged file last-modified time, loaded from METADATA$FILE_LAST_MODIFIED"
  }

  column {
    name    = "LOAD_TIMESTAMP"
    type    = "TIMESTAMP_NTZ"
    comment = "When the row was ingested into Snowflake"

    default {
      expression = "CURRENT_TIMESTAMP()"
    }
  }
}
