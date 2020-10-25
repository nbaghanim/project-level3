init:
	git clone https://github.com/nbaghanim/k8s-sandbox.git
	cd k8s-sandbox && make up && make install-cicd && make install-ingress


secret-dockerhub:
	docker login
	kubectl create secret generic nbaghanim-secret \
	 --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson -n test

push: 
	Secret-dockerhub front-end-image
	
push-images: 
		
	kubectl create -f ./tekton/role.yaml -n test
	kubectl create -f ./tekton/role-binding.yaml -n test
	kubectl create -f ./tekton/sa-front-end.yaml -n test
	kubectl create -f ./tekton/front-end/PipelineResource-front-end.yaml -n test
	kubectl create -f ./tekton/front-end/task-front-end.yaml -n test
	kubectl create -f ./tekton/front-end/task-front-end-dep.yaml -n test
	kubectl create -f ./tekton/front-end/pipeline-front-end.yaml -n test
	kubectl create -f ./tekton/front-end/PipelineRun-front-end.yaml -n test
	kubectl create -f ./tekton/catalogue/PipelineResource-catalogue.yaml -n test
	kubectl create -f ./tekton/catalogue/task-catalogue-db.yaml -n test
	kubectl create -f ./tekton/catalogue/task-catalogue-db-dep.yaml -n test
	kubectl create -f ./tekton/catalogue/task-catalogue.yaml -n test
	kubectl create -f ./tekton/catalogue/task-catalogue-dep.yaml -n test
	kubectl create -f ./tekton/catalogue/pipeline-catalogue.yaml -n test
	kubectl create -f ./tekton/catalogue/PipelineRun-catalogue.yaml -n test
	kubectl create -f ./tekton/load-test/PipelineResource-load-test.yaml -n test
	kubectl create -f ./tekton/load-test/task-load-test.yaml -n test
	kubectl create -f ./tekton/load-test/task-load-test-dep.yaml -n test
	kubectl create -f ./tekton/load-test/pipeline-load-test.yaml -n test
	kubectl create -f ./tekton/load-test/PipelineRun-load-test.yaml -n test
	kubectl create -f ./tekton/queue-master/PipelineResource-queue-master.yaml -n test
	kubectl create -f ./tekton/queue-master/task-queue-master.yaml -n test
	kubectl create -f ./tekton/queue-master/task-queue-master-dep.yaml -n test
	kubectl create -f ./tekton/queue-master/pipeline-queue-master.yaml -n test
	kubectl create -f ./tekton/queue-master/PipelineRun-queue-master.yaml -n test
	kubectl create -f ./tekton/rabbitmq/task-rabbitmq-dep.yaml -n test
	kubectl create -f ./tekton/rabbitmq/pipeline-rabbitmq.yaml -n test
	kubectl create -f ./tekton/rabbitmq/PipelineRun-rabbitmq.yaml -n test
	kubectl create -f ./tekton/orders/PipelineResource-orders.yaml -n test
	kubectl create -f ./tekton/orders/task-orders-db-dep.yaml -n test
	kubectl create -f ./tekton/orders/task-orders.yaml -n test
	kubectl create -f ./tekton/orders/task-orders-dep.yaml -n test
	kubectl create -f ./tekton/orders/pipeline-orders.yaml -n test
	kubectl create -f ./tekton/orders/PipelineRun-orders.yaml -n test
	kubectl create -f ./tekton/shipping/PipelineResource-shipping.yaml -n test
	kubectl create -f ./tekton/shipping/task-shipping.yaml -n test
	kubectl create -f ./tekton/shipping/task-shipping-dep.yaml -n test
	kubectl create -f ./tekton/shipping/pipeline-shipping.yaml -n test
	kubectl create -f ./tekton/shipping/PipelineRun-shipping.yaml -n test
	kubectl create -f ./tekton/user/PipelineResource-user.yaml -n test
	kubectl create -f ./tekton/user/task-user-db.yaml -n test
	kubectl create -f ./tekton/user/task-user-db-dep.yaml -n test
	kubectl create -f ./tekton/user/task-user.yaml -n test
	kubectl create -f ./tekton/user/task-user-dep.yaml -n test
	kubectl create -f ./tekton/user/pipeline-user.yaml -n test
	kubectl create -f ./tekton/user/PipelineRun-user.yaml -n test
	kubectl create -f ./tekton/payment/PipelineResource-payment.yaml -n test
	kubectl create -f ./tekton/payment/task-payment.yaml -n test
	kubectl create -f ./tekton/payment/task-payment-dep.yaml -n test
	kubectl create -f ./tekton/payment/pipeline-payment.yaml -n test
	kubectl create -f ./tekton/payment/PipelineRun-payment.yaml -n test
	#kubectl create -f ./tekton/e2e-tests/PipelineResource-e2e-tests.yaml -n test
	#kubectl create -f ./tekton/e2e-tests/task-e2e-tests.yaml -n test
	#kubectl create -f ./tekton/e2e-tests/TaskRun-e2e-tests.yaml -n test
	kubectl create -f ./tekton/carts/PipelineResource-carts.yaml -n test
	kubectl create -f ./tekton/carts/task-carts-db-dep.yaml -n test
	kubectl create -f ./tekton/carts/task-carts.yaml -n test
	kubectl create -f ./tekton/carts/task-carts-dep.yaml -n test
	kubectl create -f ./tekton/carts/pipeline-carts.yaml -n test
	kubectl create -f ./tekton/carts/PipelineRun-carts.yaml -n test
	kubectl create -f ./tekton/e2e-js-test/PipelineResource-e2e-js-test.yaml -n  test
	kubectl create -f ./tekton/e2e-js-test/task-e2e-js-test.yaml -n  test
	kubectl create -f ./tekton/e2e-js-test/task-e2e-js-test-dep.yaml -n  test
	kubectl create -f ./tekton/e2e-js-test/pipeline-e2e-js-test.yaml -n  test
	kubectl create -f ./tekton/e2e-js-test/PipelineRun-e2e-js-test.yaml -n  test



deploy-sockshop:
	kubectl apply -f ./deployment/front-end/front-end-dep.yaml -n test
	kubectl apply -f ./deployment/carts/carts-db-dep.yaml -n test
	kubectl apply -f ./deployment/carts/carts-db-svc.yaml -n test
	kubectl apply -f ./deployment/carts/carts-dep.yaml -n test
	kubectl apply -f ./deployment/carts/carts-svc.yml -n test
	kubectl apply -f ./deployment/catalogue/catalogue-db-dep.yaml -n test
	kubectl apply -f ./deployment/catalogue/catalogue-db-svc.yaml -n test
	kubectl apply -f ./deployment/catalogue/catalogue-dep.yaml -n test
	kubectl apply -f ./deployment/catalogue/catalogue-svc.yaml -n test
	kubectl apply -f ./deployment/orders/orders-db-dep.yaml -n test
	kubectl apply -f ./deployment/orders/orders-db-svc.yaml -n test
	kubectl apply -f ./deployment/orders/orders-dep.yaml -n test
	kubectl apply -f ./deployment/orders/orders-svc.yaml -n test
	kubectl apply -f ./deployment/payment/payment-dep.yaml -n test
	kubectl apply -f ./deployment/payment/payment-svc.yaml -n test
	kubectl apply -f ./deployment/shipping/shipping-dep.yaml -n test
	kubectl apply -f ./deployment/shipping/shipping-svc.yaml -n test
	kubectl apply -f ./deployment/user/user-db-dep.yaml -n test
	kubectl apply -f ./deployment/user/user-db-svc.yaml -n test
	kubectl apply -f ./deployment/user/user-dep.yaml -n test
	kubectl apply -f ./deployment/user/user-svc.yaml -n test
	kubectl apply -f ./deployment/load-test/loadtest-dep.yaml -n test	
	
 
e2e-try:
	docker login
	kubectl create secret generic rayanah-secret \
	 --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson -n test
	kubectl create -f e2e-tests/tektonDockerPush/serviceaccount.yaml -f e2e-tests/tektonDockerPush/pipelinerun.yaml\
        -f e2e-tests/tektonDockerPush/task.yaml -f e2e-tests/tektonDockerPush/run.yaml -n test
