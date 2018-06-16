resource "random_id" "default" {
  byte_length = 16
}

resource "random_pet" "default" {}

output "random_name" {
  value = "${random_pet.default.id}-${random_id.default.hex}"
}