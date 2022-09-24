cluster.create:
	@echo "Make sure nothing runs on port 80 and 443: check with: sudo lsof -i -P -n"
	@echo "run first 'export DOMAIN=mydomain.com'"
	@cat k3d-config.yaml | envsubst | k3d cluster create --config - 

cluster.delete:
	@cat k3d-config.yaml | envsubst | k3d cluster delete --config - 

certmanger.create:
	@kubectl --kubeconfig $(shell k3d kubeconfig write default) apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.yaml

certmanger.delete:
	@kubectl --kubeconfig $(shell k3d kubeconfig write default) delete -f https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.yaml

certmanger.create-issuer:
	@echo "run first 'export EMAIL=email@mydomain.com'"
	@cat cert-manager-cluster-issuer.yaml | envsubst | kubectl apply -f -

certmanger.delete-issuer:
	@echo "run first 'export EMAIL=email@mydomain.com'"
	@cat cert-manager-cluster-issuer.yaml | envsubst | kubectl delete -f -

test.deploy:
	@echo "run first 'export DOMAIN=mydomain.com'"
	@cat test-app.yaml | envsubst | kubectl apply -f -

test.delete:
	@echo "run first 'export DOMAIN=mydomain.com'"
	@cat test-app.yaml | envsubst | kubectl delete -f -