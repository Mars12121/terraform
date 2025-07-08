resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  #name        = var.vm_web_name
  name        = local.name-web
  platform_id = var.vm_web_platform_id
  resources   { 
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
   }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = var.vm_metadata
  #{
   # serial-port-enable = 1
   # ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  #}

}

resource "yandex_vpc_subnet" "db" {
  name           = var.db_web_vpc_name
  zone           = var.db_web_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.db_web_cidr
}

resource "yandex_compute_instance" "db" {
  #name        = var.db_web_name
  name        = local.name-db
  platform_id = var.db_web_platform_id
  zone        = var.db_web_zone
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = true
  }

  metadata = var.vm_metadata
  #{
   # serial-port-enable = 1
    #ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  #}

}