# consul-vault-lab-env

Lab environment for Consul + Vault 


```consul.service```  - systemd service unit for fast install and run Consul server (without ACL system), it listen only on loopback interface.


Export Consul environment variables:

```export CONSUL_HTTP_ADDR=https://127.0.0.1:8501```

```export CONSUL_HTTP_TOKEN=......```



Init vault server:

1. ```vault  operator  init -address=http://localhost:8200 -key-threshold=1 -key-shares=1 -format=json``` - init  ( you have to save init keys )

2. ```vault  operator  unseal -address=http://localhost:8200``` - unseal 



Export ENV variables:

```export VAULT_ADDR="http://localhost:8200"```

```export VAULT_TLS_SERVER_NAME=vault.foo.com``` - sertificate hostname 

```export VAULT_TOKEN="<YOUR VAULT TOKEN HERE""```


Don't foget enable KV secret engine:

```vault secrets enable -path=secret/ kv```

Try put some  demo KV data:

```vault kv put  secret/kv/foo-dev-env pubKey="ssh-ed25519 AAAAC3NzaC1lZ...."   rootPass=BigSecret```

And check result:

```vault kv get  secret/kv/dev-env/```


Should look something like this: 

```
====== Metadata ======
Key              Value
---              -----
created_time     2019-02-31T06
deletion_time    n/a
destroyed        false
version          2

====== Data ======
Key         Value
---         -----
pubKey      ssh-ed25519 AAAAC3NzaC1lZ....
rootPass    BigSecret
```



