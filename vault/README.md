# Demo Vault in K8s Installation

## Install Chart

```sh
kubectl create namespace vault

helm install vault hashicorp/vault --namespace vault --values values.yaml
```

## Init Vault and Raft Storage

```sh
kubectl -n vault exec -it vault-0 -- vault operator init
# --> securly store unseal keys and root token!

# repeat 3 times until unsealed
kubectl -n vault exec -it vault-0 -- vault operator unseal


kubectl -n vault exec -it vault-1 -- vault operator raft join http://vault-0.vault-internal:8200
# repeat 3 times until unsealed
kubectl -n vault exec -it vault-1 -- vault operator unseal

kubectl -n vault exec -it vault-2 -- vault operator raft join http://vault-0.vault-internal:8200
# repeat 3 times until unsealed
kubectl -n vault exec -it vault-2 -- vault operator unseal
```

```sh
kubectl -n vault exec -it vault-0 -- vault login
kubectl -n vault exec -it vault-0 -- vault operator raft list-peers
```

## Access Web UI

```sh
kubectl -n vault port-forward vault-0 8200:8200
```

Go to: http://localhost:8200/ui/vault

## Setup Secret Engine

Upload policy

```sh
kubectl -n vault exec -i vault-0 -- vault policy write admin - < admin-policy.hcl
```

```sh
kubectl -n vault exec -it vault-0 -- vault secrets enable transit
```

## Setup Vault Key

Create key

```sh
kubectl -n vault exec -it vault-0 -- vault write -f transit/keys/kasten
```

Create policy for Kasten token

```sh
kubectl -n vault exec -i vault-0 -- vault policy write kasten - < kasten-policy.hcl
```

Create token

```sh
kubectl -n vault exec -it vault-0 -- vault token create -policy=kasten
```
