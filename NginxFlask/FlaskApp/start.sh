#!/bin/bash

docker build -t rchyln/basic_flask:latest .

docker run -d -p 8080:5000 rchyln/basic_flask

docker ps
