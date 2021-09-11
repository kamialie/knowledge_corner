# Read the configuration secret example
path "secret/config" {
  capabilities = ["read"]
}

# Read the host information example
path "sys/host-info" {
  capabilities = ["read"]
}

# List secrets engines
path "sys/mounts" {
  capabilities = ["read"]
}

# Enable Transit secrets engine
path "sys/mounts/transit" {
  capabilities = ["create", "update"]
}

# Manage Transit secrets engine keys
path "transit/keys" {
  capabilities = ["list"]
}

path "transit/keys/*" {
  capabilities = ["create", "list", "read", "update"]
}

path "transit/keys/+/config" {
  capabilities = ["create", "update"]
}

# Encrypt with any Transit secrets engine key
path "transit/encrypt/*" {
  capabilities = ["create", "update"]
}

# Decrypt with any Transit secrets engine key
path "transit/decrypt/*" {
  capabilities = ["create", "update"]
}
