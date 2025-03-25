provider "vault" {
    address = "http://127.0.0.1:8200"
}

data "vault_generic_secret" "demo" {
    path = "secret/db-creds"   # path to secret in the Vault
}

output "vault_secret" {
    value = data.vault_generic_secret.demo.data_json
    sensitive = true
}