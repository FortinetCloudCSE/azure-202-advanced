variable "enable_module_output" {
  description = "enable_module_output"
  type        = bool
  default     = true
}

variable "resource_group_names" {
  description = "The names of the resource groups in which to create the resources."
  type        = list(string)
  default     = []
}

variable "admin_username" {
  description = "The administrator username for the virtual machines."
  type        = string
  default     = ""
}

variable "admin_password" {
  description = "The administrator password for the virtual machines."
  type        = string
  default     = ""
}