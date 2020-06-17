variable "location" {
    description = "The location for resource deployment"
    type        = string

    default     = "uksouth"
}

variable "tags" {
  description   = "A map of tags to assign to the resource."
  type          = map

  default = {
    application = "terraform-example"
    environment = "development"
    owner       = "lufussel"
    buildagent  = "local"
  }
}

variable "env" {
  description   = "Environment prefix for resource naming."
  type          = string

  default       = "dev"
}

variable "app_name" {
  description   = "Short name of app for resource naming."
  type          = string

  default       = "examplelz"
}

variable "name" {
  description   = "Virtual machine name."
  type          = string

  default       = "my-vm"
}

variable "subnet_id" {
  description   = "Id of the subnet for the VM."
}

variable "private_ip_address_allocation" {
  description   = "Allocation method for private IP addresses."
  type          = string

  default       = "Dynamic"
}

variable "private_ip_address" {
  description   = "Private IP address if allocation method is Static."
  type          = string

  default       = null
}

variable "size" {
  description   = "Size of the VM."
  type          = string

  default       = "Standard_D2_v3"
}

variable "admin_username" {
  description   = "Admin username for the VM."
  type          = string
}

variable "admin_password" {
  description   = "Admin username for the VM."
  type          = string
}