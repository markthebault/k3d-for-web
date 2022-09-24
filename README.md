# k3d-for-web

This repo will help you to create a lightweit kubernetes cluster on a single VM to expose services with kubernetes.

## Getting Started
Make sure you own a domain or subdomain, you need to have `k3d.${DOMAIN}` pointing to your server. If you don't want that, edit the file `k3d-config.yaml` and remove the line.


Run the following commands

```bash
export DOMAIN=mydomain.com
export EMAIL=myemail@whatever.con

#Create the cluster
make cluster.create #wait 30s that the cluster starts

#Add cert manager to handle certificates
make certmanger.create

#Now add letsencrypt as issuer
make certmanger.create-issuer


#OPTIONAL:
make test.deploy
```