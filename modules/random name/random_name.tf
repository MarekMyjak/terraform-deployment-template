resource "random_id" "default" {
  byte_length = 6
}

resource "random_pet" "default" {
  length = 2
}

output "random_name" {
  value = "${random_pet.default.id}-${random_id.default.hex}"
}