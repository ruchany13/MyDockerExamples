# Introduction
There are an exapmle for Ansible. 

# How Can I Create ?

- Connect SSH
- Create inventory file:
```bash
touch inventory.yml
```
- Create playbook file. It is include jobs for remote server:
```bash
touch nginx.yml
````
- Now, we can run our playbook file:
```bash
ansible-playbook -i inventory.yml nginx.yml
```

It is basically:)

***Note:*** This file is still being worked on. It will include more information about the files.