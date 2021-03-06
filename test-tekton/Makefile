
testEnv:
	kubectl config set-context --current --namespace=tekton-pipelines
	
secret-docker-hub:
	kubectl create secret generic nbaghanim-docker-hub \
 	--from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson

pipeline:
	kubectl create -f ./pipelines/

pipelineRun:
	kubectl create -f ./pipelinerun/

resource:
	kubectl create -f ./PipelineResource/ -n test

role:
	kubectl apply -f ./role/
	
tasks:
	kubectl apply -f ./carts/ -n test
	kubectl apply -f ./catalogue/ -n test
	kubectl apply -f ./e2e-js-test/ -n test
	kubectl apply -f ./e2e-tests/ -n test
	kubectl apply -f ./edge-router/ -n test
	kubectl apply -f ./front-end/ -n test
	kubectl apply -f ./load-test/ -n test
	kubectl apply -f ./orders/ -n test
	kubectl apply -f ./payment/ -n test
	kubectl apply -f ./shipping/ -n test

delete-tasks:
	
	kubectl delete -f ./carts/ -n test
	kubectl delete -f ./catalogue/ -n test
	kubectl delete -f ./e2e-js-test/ -n test
	kubectl delete -f ./e2e-test/ -n test
	kubectl delete -f ./edge-router/ -n test
	kubectl delete -f ./front-end/ -n test
	kubectl delete -f ./load-test/ -n test
	kubectl delete -f ./orders/ -n test
	kubectl delete -f ./payment/ -n test
	kubectl delete -f ./shipping/ -n test
	

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


test:
	kubectl create secret generic nbaghanim-docker-hub \
        --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
        --type=kubernetes.io/dockerconfigjson -n test
	kubectl apply -f tests/roles -n test
	kubectl create -f tests/task-run-test.yaml -n test
	kubectl create -f tests/task-build-push.yaml -n test
	kubectl create -f tests/pipeline-run-test.yaml -n test
	kubectl create -f tests/pipeline-run-test-without-yaml.yaml -n test
	
test-run:
	kubectl create -f tests/pipeline-run-test-without-yaml.yaml -n test
