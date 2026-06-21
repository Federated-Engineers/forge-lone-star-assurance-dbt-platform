variable "name" {
  type        = string
  description = "Warehouse name"
}

variable "size" {
  type        = string
  description = "Warehouse size: XSMALL, SMALL, MEDIUM, LARGE, etc."
  default     = "XSMALL"
}

variable "initially_suspended" {
  type        = bool
  description = "Whether to create the warehouse in a suspended state"
  default     = true
}

variable "monthly_credit_quota" {
  type        = number
  description = "Monthly credit limit for the resource monitor"
}

variable "comment" {
  type        = string
  description = "Warehouse description"
  default     = "Managed by Terraform"
}

variable "notify_users" {
  type        = set(string)
  description = "Users to notify when the resource monitor reaches its thresholds"
  default     = []
}
