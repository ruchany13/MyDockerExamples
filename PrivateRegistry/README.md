# Secure Docker Private Registry with UI and Authentication

This project sets up a **Docker Private Registry** with:
- **TLS (SSL) encryption** 🔒
- **Authentication (username/password)** 🔑
- **User Interface** via [docker-registry-ui](https://github.com/Joxit/docker-registry-ui) 📦

Everything is bundled with **Docker Compose** and **Nginx** as a reverse proxy.

---

## Quick Overview

- 📦 **Registry**: Store your Docker images privately and securely.
- 🖥️ **UI**: Browse, manage, and delete images with a clean web interface.
- 🛡️ **TLS**: Encrypt traffic between clients and registry.
- 🔐 **Auth**: Protect access with username/password.

> All containers are properly isolated and HTTPS-enabled.

---

## Documentation and Setup Guide

A full, step-by-step guide is available on my blog:  
👉 [How to Build a Secure Docker Registry with TLS, Authentication and UI](https://www.ruchan.dev/blog/barman/BarmanSetupLocal/)

The guide includes:
- Certificate setup (trusted & self-signed options)
- Authentication setup
- Handling UI proxy and edge cases
- Docker login, push, pull examples
- Advanced considerations for production deployments 🚀

---

## Project Structure

```bash
├── docker-compose.yml
├── auth/
│   └── registry.passwd
├── nginx/
│   ├── nginx.conf
│   └── ssl/
└── registry_data/
