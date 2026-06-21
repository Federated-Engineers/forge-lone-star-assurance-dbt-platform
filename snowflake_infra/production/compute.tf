module "etl_wh" {
  source = "../modules/warehouse"

  name                 = "ETL_WH"
  initially_suspended  = true
  credit_quota         = 100
  comment              = "Shared warehouse for the dbt and airflow service accounts"
}

module "data_eng_wh" {
  source = "../modules/warehouse"

  name                 = "DATA_ENG_WH"
  initially_suspended  = true
  credit_quota         = 100
  comment              = "Warehouse used by the data engineer role"
}
