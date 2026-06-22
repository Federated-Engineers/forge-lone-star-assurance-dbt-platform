data "aws_ssm_parameter" "lonestar_snowflake_password" {
  name = "/production/forge/snowflake/lone-star-assurance/snowflake_password"
}
