
# Load Balancer & Reverse Proxy with Nginx

This project demonstrates a simple implementation of a **Reverse Proxy** and **Load Balancer** using Docker and Nginx. The setup includes three backend applications (`app1`, `app2`, `app3`) and one Nginx reverse proxy application.

## Overview

The reverse proxy (Nginx) handles incoming traffic and routes it to one of the backend applications (`app1`, `app2`, or `app3`). Each backend application has its own simple HTML page that identifies the server (e.g., `app1 server respond`). All containers are connected through an internal Docker network called `internal-network`.

### Key Features
1. **Reverse Proxy**:
   - The Nginx proxy routes traffic to backend applications using their hostnames (`app1`, `app2`, `app3`).
   - Simplifies the interaction between clients and multiple backend services.

2. **Load Balancing**:
   - Traffic is distributed across the three backend servers to improve reliability and performance.

3. **HTML Pages**:
   - Each backend application serves a unique HTML page indicating the responding server (`app1`, `app2`, or `app3`).

4. **Network Isolation**:
   - All applications communicate internally using `internal-network`.

## How It Works
1. **Docker Network**:
   - A custom Docker network (`internal-network`) is created to allow communication between the reverse proxy and backend applications.

2. **Nginx Reverse Proxy**:
   - The proxy uses Nginx configuration to forward incoming requests to the appropriate backend application based on their hostname.

3. **Backend Applications**:
   - Three simple Nginx applications (`app1`, `app2`, `app3`) each serve a unique HTML page.

4. **External Ports**:
   - Each application, including the proxy, is accessible via a unique port from the host machine.

## File Structure
```
MyDockerExamples/
│
└── LoadBalancer&ReverseProxy-Nginx/
    ├── app1/
    │   └── index.html
    ├── app2/
    │   └── index.html
    ├── app3/
    │   └── index.html
    ├── proxy/
    │   └── nginx.conf
    └── docker-compose.yml
```

## Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ruchany13/MyDockerExamples.git
   cd MyDockerExamples/LoadBalancer&ReverseProxy-Nginx
   ```

2. **Start the Containers**:
   Use Docker Compose to build and run all containers:
   ```bash
   docker compose up
   ```

3. **Access the Applications**:
   - **Proxy (Nginx)**: [http://localhost:8080](http://localhost:8080) (routes requests to backend apps)
   - **App1**: [http://localhost:8081](http://localhost:8081)
   - **App2**: [http://localhost:8082](http://localhost:8082)
   - **App3**: [http://localhost:8083](http://localhost:8083)

## Nginx Proxy Configuration
The `nginx.conf` file in the `proxy` directory defines how the proxy forwards traffic to the backend applications. Each backend application is accessed by its hostname (`app1`, `app2`, `app3`) on the `internal-network`.

Example snippet from `nginx.conf`:
```nginx
upstream backend {
    server app1:80;
    server app2:80;
    server app3:80;
}

server {
    listen 80;

    location / {
        proxy_pass http://backend;
    }
}
```

## Application Behavior
- When you access the proxy (`http://localhost:8080`), it routes your request to one of the backend applications.
- The backend application responds with its unique HTML page, showing which server handled your request (e.g., "app1 server respond").

## Diagram
```
                   +-------------------+
                   |                   |
       Client ---> |    Nginx Proxy    |
                   |                   |
                   +---+---+---+---+---+
                       |    |     |
                    +--+    |     +--+
                    |       |        |
              +-----+   +------+   +------+
              | app1 |  | app2 |   | app3 |
              +------+  +-------+  +------+   
```

## Conclusion
This project provides a hands-on example of how to use Docker and Nginx to set up a reverse proxy and load balancer for multiple backend services. It’s a simple yet powerful way to improve the scalability and reliability of your applications.

## Production Notes
- Don't use `latest` tag for images.
- Don't open `app` contanier  ports to outside, just use `proxy` container ports.
- Use `ssl/tls` and 443 port on the proxy for encryption data.


