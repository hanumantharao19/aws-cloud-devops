## Install docker in centos or Redhat
------
step 1)create ec2 instance with redhat or centos operating system
step 2) install docker with following steps 
```
sudo yum update
sudo yum install yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo      https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sduo systemctl status docker
sudo docker –version
```


## install Docker in ubuntu server
- Update and Upgrade System Packages
```
sudo apt update
sudo apt upgrade -y
```
- Install Required Prerequisite Packages
```
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
- Add Docker’s Official GPG Key
```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
- Add Docker’s Stable Repository
```
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
- Update Package Index Again
```
sudo apt update
```
- Install Docker Engine and CLI
```
sudo apt install -y docker-ce docker-ce-cli containerd.io
```
- Start and Enable Docker Service
```
sudo systemctl start docker
sudo systemctl enable docker
```
- Run Docker Without Sudo
```
sudo usermod -aG docker $USER
newgrp docker
```
------------------------------------------------------------------------------
## docker commands
1. how to search a docker image in hub.docker.com
```sh
docker search httpd
```
2. Download a docker image from hub.docker.com
```sh
docker image pull <image_name>:<image_version/tag>
```

3. List out docker images from your local system
```sh
docker image ls
```

4. Create/run/start a docker container from image
```sh
docker run -d --name <container_Name> <image_name>:<image_version/tag>

d - run your container in back ground (detached)
```

5. Expose your application to host server
```sh
docker run -d  -p <host_port>:<container_port> --name <container_Name> <image_name>:<Image_version/tag>

docker run -d --name httpd_server -p 8080:80 httpd:2.2
```

6. List out running containers
```sh
docker ps
```

7. List out all docker container (running, stpooed, terminated, etc...)
```sh
docker ps -a
```

8. run a OS based container which interactive mode (nothing but login to container after it is up and running)

```sh
docker run -i -t --name centos_server centos:latest
i - interactive
t - Terminal
```

9. Stop a container 
```sh
docker stop <container_id>
```

10. Start a container which is in stopped or exit state

```sh
docker start <container_id>
```
11. Remove a container

```sh
docker rm <container_id>
```

12. login to a docker container
```sh
docker exec -it <container_Name> /bin/bash
```
- docker search httpd --->search httpd image in docker hub
- docker pull httpd    --> pull the docker httpd image from docker hub
- docker images  --> list images
- docker run -d httpd  --> run the docker httpd  image as container in back ground
- docker ps ---> list the only running containers
- docker ps -a --->list the running and exit containers as well
- docker stop <containerid>  --> to stop the container
- docker start containerid   ---> to start the contaier
- docker rm containerid  --> to remove container which is in stop state
- docker rm -f contianer  --->  we can remove running contaienr as well
- docker rmi imagename  --> toremove the iamge
- docker run --name <contianername> -d httpd  --> create container with name which we want
- docker exec -it contianerid /bin/bash
- docker run -d -p 80:80 httpd  --> to access application through browser with Host Ip with 80 port
- docker run -d -p 90:80 httpd  --> to access application through browser with Host Ip with 90 port


# Build the image and push to the docker repo
- docker build -t hanu_httpd .
- docker tag hanu_httpd  hanumantharao1986/hanu_httpd
or 
- docker build -t hanumantharao1986/hanu_httpd
- docker login  # to login the docker hub while login it as your user name and password of docker hub
- docker push hanumantharao1986/hanu_httpd

## Doker file for  buils the httpd image
```
FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd","-D", "FOREGROUND"]
```

```
FROM ubuntu:latest

# Set the working directory in the image
WORKDIR /app

# Copy the files from the host file system to the image file system
COPY . /app

# Install the necessary packages
RUN apt-get update && apt-get install -y python3 python3-pip

# Set environment variables
ENV NAME World

# Run a command to start the application
CMD ["python3", "app.py"]

```
app.py
```
print( this is hanumanthrao)
```

###
- docker network ls
- docker network inspect < containerid>
- default address for birdge network is : 172.17.0.0/16
- docker network connect <custom-network> <container name>
- docker network rm < networkname>

Docekr volumes
- docker volume ls
- docker volume create <volume name>
- docker volume inspect <volume name>
- docker volume rm <volume name>
- docker volume prune
- docker run -d --name app1 --mount  source=hanu target=/data httpd
- docker run -d --name app1 --volumes-form app1 --name app2 httpd
- docker run -d --name app1  -v httpd_back:/var/log/http httpd
- /var/lib/docker/volmunes --> volume are located in this place

Bind mounts
- mkdir /opt/httpd_data
- docker run -d --name app1  -v /opt/httpd_data:/var/log/http httpd
- data is storage in the host file




- /var/lib/docker/volmunes --> volume are located in this place








