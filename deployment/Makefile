up: build run


build:
	docker build -t front-end ./front-end/
	docker build -t	edge-router ./edge-router/
	docker build -t	catalogue ./catalogue/
	docker build -t	catalogue-db ./catalogue/docker/catalogue-db/
	docker build -t	carts ./carts/
	docker build -t	orders ./orders/
	docker build -t shipping ./shipping/
	docker build -t queue-master ./queue-master/	
	docker build -t	payment ./payment/
	docker build -t	user ./user/
	docker build -t	user-db ./user/docker/user-db/

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

down:
	docker rm -f front-end
	docker rm -f edge-router
	docker rm -f catalogue
	docker rm -f catalogue-db
	docker rm -f carts
	docker rm -f carts-db
	docker rm -f orders
	docker rm -f orders-db
	docker rm -f shipping
	docker rm -f queue-master
	docker rm -f rabbitmq
	docker rm -f payment
	docker rm -f user-db
	docker rm -f user
	docker network rm project
test:
	docker build -t user-simulator ./load-test/
	docker run -it --network project user-simulator -H edge-router -r 0.5 -t 30s -u 20
