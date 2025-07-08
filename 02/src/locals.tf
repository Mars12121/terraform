locals {
    name-web = "netology-${var.default_zone}-${var.vpc_name}-${var.vpc_name}-web"
    name-db = "netology-${var.db_web_zone}-${var.vpc_name}-${var.db_web_vpc_name}-db"
}