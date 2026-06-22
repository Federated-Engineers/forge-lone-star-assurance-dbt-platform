module "etl_wh" {
  source = "../modules/warehouse"

  name                = "ETL_WH"
  initially_suspended = true
  comment             = "Shared warehouse for the dbt and airflow service accounts"
}

module "data_eng_wh" {
  source = "../modules/warehouse"

  name                = "DATA_ENG_WH"
  initially_suspended = true
  comment             = "Warehouse used by the data engineer role"
}
