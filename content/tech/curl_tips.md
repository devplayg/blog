---
title: Tips for Docker Compose
type: posts
date: 2022-01-29T00:28:15+09:00
series:
- Docker
categories:
- tips
- docker
- docker-composed
---

Builds, (re)creates, starts, and attaches to containers for a service.

    docker-compose  up -d


Stops containers and removes containers, networks, volumes, and images created by up.

    sudo docker-compose   down


Remove containers for services not defined in the Compose file

    sudo docker-compose   down --remove-orphans

