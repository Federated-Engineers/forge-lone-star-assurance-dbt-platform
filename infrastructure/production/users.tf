resource "snowflake_service_user" "dbt_svc" {
  name              = "DBT_SVC"
  default_role      = "SYSADMIN"
  default_warehouse = module.dbt_wh.name
  rsa_public_key    = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlZGkKJ/3FKXLILxDkFAsDQygSGtS77f6SAWvCzZ9N8417kffiaNB4eH8IceSVhN25LLT+yRwOqs0aB6Azq+cDzJ2QqgPOGNyxEDLiqDC4lf2qs1TWEUJZsfWxjWg2G/5dfAUhg+azWMz480Al5BlxtvPzMx+QLV7DxVTYNF0VMC0XafBKkLnR3Zw7vag8BV2Fsg4KUv6qeTi6QniMQ1vyNvMnfa7jKo7L11qzoyq7OFULtRkPDbLNNOn5q3h88vEcUR61MoR9vfrcmHja8r0FopNcGixH4uL49Gjww8CNcggmsW56l1P/D/3yLduxa4QbrJDRpUlhhtQZnq6G82jBwIDAQAB"
  comment           = "Service account for dbt staging runs"
}

resource "snowflake_service_user" "airflow_svc" {
  name              = "AIRFLOW_SVC"
  default_role      = "SYSADMIN"
  default_warehouse = module.airflow_wh.name
  rsa_public_key    = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAomEiRHCAl/amtTOY31m726Wo6E+l6Kv7OLsWxeBMORst5vIxmPPR8XgIAADjUKMRmeQBbBEfE8gICIIi1tNnsf4JbPiA3/X3jjejqA5oHKgBGn1yz1AB0HxFI3srPVj2S7v9WF7pJ/AimJb+8Vs8af0kAJQ94jX+BFaWOxTI16d2apn2DyrDnNrsddT16S6Or0DWtG9+jYmXUT32HUvNfDm/QQHcBEgkHwHS+M+nLR+XEGzQu1uw87v7qHi4pXBUg00GkN53YezIHyDmhI1/7AEXQQJQqxVIOO7oCheGUoQrM6zDu4yZH7ZKQPbc3YYpnzlzH1jWaf+5gwLqo5EGtwIDAQAB"
  comment           = "Service account for Airflow loader jobs"
}
