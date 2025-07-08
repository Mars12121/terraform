variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
}

variable "vm_web_cores" {
  type        = string
  default     = "2"
}

variable "vm_web_memory" {
  type        = string
  default     = "1"
}

variable "vm_web_core_fraction" {
  type        = string
  default     = "5"
}

variable "db_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "db_web_name" {
  type        = string
  default     = "netology-develop-platform-db"
}

variable "db_web_platform_id" {
  type        = string
  default     = "standard-v1"
}

variable "db_web_cores" {
  type        = string
  default     = "2"
}

variable "db_web_memory" {
  type        = string
  default     = "2"
}

variable "db_web_core_fraction" {
  type        = string
  default     = "20"
}

variable "db_web_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Zone where the VM will be created"
}

variable "db_web_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "db_web_vpc_name" {
  type = string
  default = "db"
  description = "netology-develop-platform-db"
}

variable "vms_resources" {
  default = {
    web = {
      cores=2
      memory=1
      core_fraction=5
    }
    db = {
       cores=2
       memory=2
       core_fraction=20
     }
  }  
}

variable "vm_metadata" {
  type = map(any)
  default = {
    serial-port-enable = 1
     ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFhtZEIXS76S7TWHHp2ht9DVK0Bu9EA67tzrolNNxMM9 admin@MacBook-Pro-admin.local"
   }
}