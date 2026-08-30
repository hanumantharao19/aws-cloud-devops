variable "environments" {
  default = [
    "dev",
    "qa",
    "prod",
    "qa"
  ]
}

variable "dev_servers" {
  default = [
    "web-01",
    "web-02"
  ]
}

variable "prod_servers" {
  default = [
    "web-03",
    "web-04"
  ]
}

variable "subnets" {
  default = [
    ["10.0.1.0/24", "10.0.2.0/24"],
    ["10.0.3.0/24", "10.0.4.0/24"]
  ]
}

# 1. length()
output "environment_count" {
  value = length(var.environments)
}

# 2. contains()
output "production_exists" {
  value = contains(var.environments, "prod")
}

# 3. distinct()
output "unique_environments" {
  value = distinct(var.environments)
}

# 4. concat()
output "all_servers" {
  value = concat(var.dev_servers, var.prod_servers)
}

# 5. flatten()
output "all_subnets" {
  value = flatten(var.subnets)
}

# 6. sort()
output "sorted_environments" {
  value = sort(var.environments)
}
