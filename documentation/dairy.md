# Daily Notes
## Day1 - Sunday
* Discover the micro-services git hub account, to know how many micro-service we have, clone them in single repository. 

* Start with front-end Dockerfile, to check if the Dockerfile need any changes before move to sandbox and automate the image using Tekton tool. Building and running Dockerfile successfully.

* Build and run edge-router, and catalogue Dockerfiles locally.

![cataloguecurl](https://user-images.githubusercontent.com/66031162/96351234-ce8d5200-10c2-11eb-8c5c-c8247bfd33db.png)

### Obsticales
* The edge-router respond with bad gateway. Since not all micro-service are work.  

*  Faced some obstacles to connect the catalogue-db with catalogue micro-service, it was easy when creating a network to connect all micro-service and run the website later. 

## Day2 - Monday
* Build and run e2e-tests, load-test, carts and user successfully.

* Edit the carts multi-stage Dockerfile, since there is some errors in the latest one. 

![cartscurl](https://user-images.githubusercontent.com/66031162/96352514-765b4d80-10cc-11eb-8fe8-681cf9f65f8c.png)

![usercurl](https://user-images.githubusercontent.com/66031162/96352534-870bc380-10cc-11eb-95eb-b0c80653dc56.png)

### Obsticales
* The e2e-test container exit always, so I keep this image to fix it later since it’s for testing all micro-service.

* The load-test image was in old version, search for suitable one and fix the errors. 

* The carts image doesn’t work, so fix that with checkout to 0.4.8 version and build, run complete successfully.

## Day3 - Tusday

* Edit the orders, payment, shipping and queue-master multi-stag images, build and run complete successfully.

![orderscurl](https://user-images.githubusercontent.com/66031162/96353318-6f840900-10d3-11eb-9da9-6f26a7e8493a.png)
![paymentcurl](https://user-images.githubusercontent.com/66031162/96353322-7c086180-10d3-11eb-8bfe-30ced7030580.png)
![queuecurl](https://user-images.githubusercontent.com/66031162/96353325-862a6000-10d3-11eb-9066-243ab9a6f226.png)
![shippingcurl](https://user-images.githubusercontent.com/66031162/96353332-904c5e80-10d3-11eb-86bb-74a967479f6a.png)

### Obsticales
* Error in payment image in set capabilities in file app, so solve this problem by adding app/main.

* Face problem in queue-master image, solve it by remove the dependencies in pom.xml file.

## Day4 - Wednesday
* Run Sandbox, create cluster, install Tekton to automate the images, push all images to docker hub after creating the following files: secret, Taske, TaskRun, PipelineResource and ServiceAccount. 

* Successed to push half of images to docker hub.

### Obsticales
* Get errors that the resources cant access, solve this issue by making the github repo public. 

* run the secret file in default namespace, and other files in test namespace.

## Day5 - Thursday
* Complete push remaining images to docker hub.


## Day6 - Friday
* To make sure that all images are work, I create “sock-shop” network in sandbox, to run all images in the same network. Run the public database images which are: mongo:3.4 for user and orders. Rabbitmq fot queue-master.

![docker-ps](https://user-images.githubusercontent.com/66031162/96353774-dacfda00-10d7-11eb-8ae9-fdad3e7213cf.png)
![web](https://user-images.githubusercontent.com/66031162/96353858-9bee5400-10d8-11eb-9495-d4b100b56a4f.png)




