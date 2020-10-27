init:
	git clone https://github.com/nbaghanim/k8s-sandbox.git
	cd k8s-sandbox && make up && make install-cicd && make install-ingress

<<<<<<< HEAD
logging:
	cd k8s-sandbox && make install-logging && cd ..

monitoring:
	cd k8s-sandbox && make install-monitoring && cd ..
=======
create shipping: 
	cd shipping && kubectl create -f shipping-dep-ser.yaml -n test
	
push-shipping:
	secret-dockerhup shipping-image
>>>>>>> 0964a3d3347e901f95345e5f0e9f73e13c7708ff

secret-dockerhub:
	docker login
	kubectl create secret generic nbaghanim-secret \
	 --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson -n test	

<<<<<<< HEAD
push-images:
	kubectl create -f ./front-end/front-end-dep.yaml -n test
	kubectl create -f ./front-end/front-end-ingress.yaml -n test
	kubectl create -f ./front-end/front-end-svc.yaml -n test
	kubectl create -f ./carts/carts-db-dep.yaml -n test
	kubectl create -f ./carts/carts-db-svc.yaml -n test
	kubectl create -f ./carts/carts-dep.yaml -n test
	kubectl create -f ./carts/carts-svc.yaml -n test
	kubectl create -f ./catalogue/catalogue-db-dep.yaml -n test
	kubectl create -f ./catalogue/catalogue-db-svc.yaml -n test
	kubectl create -f ./catalogue/catalogue-dep.yaml -n test
	kubectl create -f ./catalogue/catalogue-svc.yaml -n test
	kubectl create -f ./order/order-db-dep.yaml -n test
	kubectl create -f ./order/order-db-svc.yaml -n test
	kubectl create -f ./order/order-dep.yaml -n test
	kubectl create -f ./order/order-svc.yaml -n test
	kubectl create -f ./payment/payment-dep.yaml -n test
	kubectl create -f ./payment/payment-svc.yaml -n test
	kubectl create -f ./rabbitmq/rabbitmq-dep.yaml -n test
	kubectl create -f ./rabbitmq/rabbitmq-svc.yaml -n test
	kubectl create -f ./shipping/shipping-dep.yaml -n test
	kubectl create -f ./shipping/shipping-svc.yaml -n test
	kubectl create -f ./user/user-db-dep.yaml -n test
	kubectl create -f ./user/user-db-svc.yaml -n test
	kubectl create -f ./user/order-dep.yaml -n test
	kubectl create -f ./user/user-svc.yaml -n test
=======
shipping-image:
	kubectl create -f shipping/tektonDockerPush/serviceaccount.yaml -f shipping/tektonDockerPush/pipelinerun.yaml\
	 -f shipping/tektonDockerPush/task.yaml -f shipping/tektonDockerPush/run.yaml -n test
shipping-all:
	kubectl create -f shipping/try1/pipelineResource.yaml -f shipping/try1/task.yaml -f shipping/try1/run.yaml -f shipping/try1/deployTask.yaml \
        -f shipping/try1/deployRunner.yaml -f shipping/try1/pipeline.yaml -f shipping/try1/pipelineRun.yaml -n test
	
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
>>>>>>> 0964a3d3347e901f95345e5f0e9f73e13c7708ff


deploy-images:
	kubectl apply -f ./front-end/front-end-dep.yaml -n test
	kubectl apply -f ./front-end/front-end-ingress.yaml -n test
	kubectl apply -f ./front-end/front-end-svc.yaml -n test
	kubectl apply -f ./carts/carts-db-dep.yaml -n test
	kubectl apply -f ./carts/carts-db-svc.yaml -n test
	kubectl apply -f ./carts/carts-dep.yaml -n test
	kubectl apply -f ./carts/carts-svc.yaml -n test
	kubectl apply -f ./catalogue/catalogue-db-dep.yaml -n test
	kubectl apply -f ./catalogue/catalogue-db-svc.yaml -n test
	kubectl apply -f ./catalogue/catalogue-dep.yaml -n test
	kubectl apply -f ./catalogue/catalogue-svc.yaml -n test
	kubectl apply -f ./order/order-db-dep.yaml -n test
	kubectl apply -f ./order/order-db-svc.yaml -n test
	kubectl apply -f ./order/order-dep.yaml -n test
	kubectl apply -f ./order/order-svc.yaml -n test
	kubectl apply -f ./payment/payment-dep.yaml -n test
	kubectl apply -f ./payment/payment-svc.yaml -n test
	kubectl apply -f ./rabbitmq/rabbitmq-dep.yaml -n test
	kubectl apply -f ./rabbitmq/rabbitmq-svc.yaml -n test
	kubectl apply -f ./shipping/shipping-dep.yaml -n test
	kubectl apply -f ./shipping/shipping-svc.yaml -n test
	kubectl apply -f ./user/user-db-dep.yaml -n test
	kubectl apply -f ./user/user-db-svc.yaml -n test
	kubectl apply -f ./user/order-dep.yaml -n test
	kubectl apply -f ./user/user-svc.yaml -n test


up: build run


build:
	docker build -t front-end ./front-end/
	docker build -t edge-router ./edge-router/
	docker build -t catalogue ./catalogue/
	docker build -t catalogue-db ./catalogue/docker/catalogue-db/
	docker build -t carts ./carts/
	docker build -t orders ./orders/
	docker build -t shipping ./shipping/
	docker build -t queue-master ./queue-master/
	docker build -t payment ./payment/
	docker build -t user ./user/
	docker build -t user-db ./user/docker/user-db/

run:
	docker network create project
	docker run -d --cap-drop=all --network project --name front-end front-end
	docker run -d --cap-drop=all --cap-add=net_bind_service --cap-add=chown --cap-add=setuid --cap-add=setgid --cap-add=dac_override --network project --name edge-router -p 80:80 -p 8080:8080 edge-router
	docker run -d --cap-drop=all --cap-add=net_bind_service --network project --name catalogue catalogue
	docker run -d --network project --name catalogue-db catalogue-db
	docker run -d --cap-drop=all --cap-add=net_bind_service --network project --name carts carts
	docker run -d --cap-drop=all --cap-add=chown --cap-add=setuid --cap-add=setgid --network project --name carts-db mongo:3.4
	docker run -d --cap-drop=all --cap-add=net_bind_service --network project --name orders orders
	docker run -d --cap-drop=all --cap-add=chown --cap-add=setuid --cap-add=setgid --network project --name orders-db mongo:3.4
	docker run -d --cap-drop=all --cap-add=net_bind_service --network project --name shipping shipping
	docker run -d --cap-drop=all --cap-add=net_bind_service -v /var/run/docker.sock:/var/run/docker.sock --network project --name queue-master queue-master
	docker run -d --cap-drop=all --cap-add=chown --cap-add=setuid --cap-add=setgid --cap-add=dac_override --network project --name rabbitmq rabbitmq
	docker run -d --cap-drop=all --cap-add=net_bind_service --network project --name payment payment
	docker run -d --cap-drop=all --cap-add=chown --cap-add=setuid --cap-add=setgid  --network project --name user-db user-db
	docker run -d --cap-drop=all --cap-add=net_bind_service --network project --name user user

