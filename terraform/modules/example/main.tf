variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, prod)."
}

resource "random_pet" "id" {
  prefix = var.environment
  length = 2
}

resource "local_file" "metadata" {
  filename = "${path.root}/example-metadata-${var.environment}.txt"
  content  = "example_id=${random_pet.id.id}\n"
}

output "id" {
  value       = random_pet.id.id
  description = "Example identifier."
}
