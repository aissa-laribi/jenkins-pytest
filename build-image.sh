#!bin/bash
sudo docker run -dit --name jenkins-pytest --privileged ubuntu
sudo docker exec -it jenkins-pytest sh -c "apt update \
 && apt-get install python3 git pip \
 && pip install pytest \
 && exit"
sudo docker commit <container-id> jenkins-pytest:latest
sudo docker tag <tag-source-image> aissalaribi/jenkins-pytest:latest
sudo docker push aissalaribi/jenkins-pytest



