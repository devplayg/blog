---
title: JSON Tips
date: 2020-11-28 00:00:00+09:00
categories:
    - minifier
    - prettify
    - docker
tags:
    - json
    - tips
    - docker
type: posts
---

### Minifier

https://hub.docker.com/r/governmentpaas/json-minify

DockerFile

    FROM ruby:2.7-alpine3.11
    RUN gem install json-minify -v 0.0.2 --no-document


Build

    docker build -t json-minify .

Minify

    docker run --rm -v "%CD%":/app json-minify ruby -rjson -e "puts JSON.parse(ARGF.read).to_json" /app/YOUR_FILE.json
    docker run --rm -v "$PWD":/app json-minify ruby -rjson -e "puts JSON.parse(ARGF.read).to_json" /app/YOUR_FILE.json

### Beautifier

    docker run -it --rm  -v "%CD%":/app python:3.7 python -mjson.tool /app/a.json
    docker run -it --rm  -v "$PWD":/app python:3.7 python -mjson.tool /app/YOUR_FILE.json
