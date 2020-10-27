
testEnv:
	kubectl config set-context --current --namespace=tekton-pipelines

pipeline:
	kubectl create -f ./pipelines/

pipelineRun:
	kubectl create -f ./pipelinerun/

role:
	kubectl apply -f ./roles/	

namespace:
	kubectl create namespace test
	kubectl create namespace production

logs: 
	tkn pr logs --last

install-ingress:
	echo "Ingress: install" | tee -a output.log
	kubectl apply -n ingress-nginx -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml | tee -a output.log
	kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s

delete-ingress:
	 echo "Ingress: delete" | tee -a output.log
	 kubectl delete -n ingress -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml | tee -a output.log 2>/dev/null | true

