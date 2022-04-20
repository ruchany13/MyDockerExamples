# Introduction
Hello! This is a terraform file. The goal of this repo is to use Terraform to make a droplet.

# How Can I Create My Own Droplet ?
There are exapmle files in repo. You can use create your Terraform automation or change what do you want.
1. Create a token in Digital Ocean
2. In your terminal, create an environment variable with your new personal access token. Replace the example value below with the token pasted from your clipboard:
```bash
export DIGITALOCEAN_ACCESS_TOKEN="your_access_token"
```
3. Now you create *main.tf* file.
```bash
touch main.tf
```
This file include Terraform details, provider details and Droplet details. 
