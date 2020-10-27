init:
	git clone https://github.com/nbaghanim/k8s-sandbox.git
	cd k8s-sandbox && make up && make install-cicd && make install-ingress

logging:
	cd k8s-sandbox && make install-logging && cd ..

monitoring:
	cd k8s-sandbox && make install-monitoring && cd ..


secret-dockerhub:
	docker login
	kubectl create secret generic nbaghanim-docker-hub \
	 --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson -n test	


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
	kubectl create -f ./orders/orders-db-dep.yaml -n test
	kubectl create -f ./orders/orders-db-svc.yaml -n test
	kubectl create -f ./orders/orders-dep.yaml -n test
	kubectl create -f ./orders/orders-svc.yaml -n test
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
	kubectl apply -f ./orders/orders-db-dep.yaml -n test
	kubectl apply -f ./orders/orders-db-svc.yaml -n test
	kubectl apply -f ./orders/orders-dep.yaml -n test
	kubectl apply -f ./orders/orders-svc.yaml -n test
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

