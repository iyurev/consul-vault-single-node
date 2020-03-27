listener "tcp"   {
  address = "127.0.0.1:8200",
  tls_disable = true,
}

storage "consul"  {
  address = "127.0.0.1:8500"
  path =  "vault"
}
disable_clustering = true
cluster_name = "vault-lab"
log_format =  "json"
ui = true
default_lease_ttl="8760h"
max_lease_ttl="8760h"



