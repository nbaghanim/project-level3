.PHONY: roles tasks taskrun pipeline pipelineRun namespace testEnv up
up: testEnv roles tasks pipeline pipelineRun logs

testEnv:
	kubectl config set-context --current --namespace=tekton-pipelines
roles:
	kubectl apply -f ./roles/ 

tasks:
	kubectl create -f ./tasks/

taskrun: 
	kubectl create -f ./taskrun/

pipeline:
	kubectl create -f ./pipelines/

pipelineRun:
	kubectl create -f ./pipelinerun/

<<<<<<< HEAD
=======
role:
	kubectl apply -f ./role/	
	
task-front-end:
	kubectl apply -f ./front-end/

>>>>>>> e5067acc4a201d34f0352cfdf333530d8f146950
namespace:
	kubectl create namespace test
	kubectl create namespace production

down: delete-namespaces

delete-namespaces:	
	kubectl config set-context --current --namespace=default
	kubectl delete namespace test
	kubectl	delete namespace production

logs:
	tkn pr logs --last

install-ingress:
	echo "Ingress: install" | tee -a output.log
	kubectl apply -n ingress-nginx -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml | tee -a output.log
	kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s

delete-ingress:
	echo "Ingress: delete" | tee -a output.log
	kubectl delete -n ingress -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml | tee -a output.log 2>/dev/null | true

test:
	kubectl apply -f tests/roles -n test
	kubectl create -f tests/task-run-test.yaml -n test
	kubectl create -f tests/task-build-push.yaml -n test
	kubectl create -f tests/pipeline-run-test.yaml -n test
	kubectl create -f tests/pipeline-run-test-without-yaml.yaml -n test

test-run:
	kubectl create -f tests/pipeline-run-test-without-yaml.yaml -n test
