# Playing around with docker
Initially used this page as a tutorial:
https://learn.hashicorp.com/tutorials/terraform/install-cli

Trying to add health checks using this article:
https://medium.com/better-programming/docker-healthchecks-eb744bfe3f3b

Using tfenv to manage terraform version
Use terraform version 0.13.1

## To Run
`terraform apply`

### Notes
This will run my docker container with nginx running on it.
Run `docker exec -it <CONTAINER_ID> /bin/bash` to access that nginx container on the command line

Initially, container didn't have `ps`
Ran `apt-get update && apt-get install procps` to get ps. Need to add to docker container

Trying to run `docker exec <CONTAINER_ID> sh -c \
'echo OK > /usr/share/nginx/html/system-status.txt'` worked! I just needed to install wget on the nginx container before it could work. `wget -q --method=HEAD localhost/system-status.txt`
