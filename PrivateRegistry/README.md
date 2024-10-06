# Docker Private Registry with Portainer and registry-ui

This repository contains the setup of a Docker Private Registry with Portainer and [registry-ui](https://github.com/Joxit/docker-registry-ui). An nginx container is used to access these 3 applications. All 3 applications are secured with SSL, so you will need a domain and certificate matching your server. If you have a domain address but no certificate, you can follow the parameters in the certificate creation section below.

- **Portainer**: Portainer is a universal container management platform. Used for manage Docker containers. Used community edition.
- **Registry-ui**: Ui for Docker Private Registry. Used because Portainer Community Edition doesn't have ui for registry

## Setup
Clone this repository and change directory.
```bash
cd MyDockerExamples/PrivateRegistry
```
Create credentials for registry with `httpasswd`. Change `username` with registry user which you want. After run command, give the password.
```bash
mkdir auth/
cd auth
htpasswd -Bc registry.password username
```

## Certificate Creation
If you have certificate, create ssl file and copy in the file. If you don't have run this commands:
