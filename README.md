# DEPI-EUI-DevOps Project

[![Python Test](https://github.com/omarbarakota/DevOps_EUI/actions/workflows/actions.yaml/badge.svg)](https://github.com/omarbarakota/DevOps_EUI/actions/workflows/actions.yaml)

## Table Of Content

[1- Description](#1--description)

[2- Installation](#2--installation)

- [2.1- Dependencies install](#install-dependencies)

- [2.2- Run Application](#run-application)

[3- Testing](#3--testing)

[4- Docker](#4--docker)

[5- GitHub Actions](#5--github-actions)

[6- Terraform](#6--terraform)

[7- Ansible](#7--ansible)

[Best Practices Followed](#best-practices-followed)

[Folder Structure](#folder-structure)

[Future Notes](#future-notes-if-you-will-edit)

## 1- Description

This is a website made **By** [**Omar Barakat**](https://linkedin.com/in/omarbarakota/)
That has alot of functionalities to apply **DevOps** tools and technicques

### Features

- Text To QRcode Generator
- Password Generator
- Weather Provider
- Real Time Clock
- Maps Provider
- To-Do List
  
## 2- Installation

---

Finally  To Create Virtual Enviroment:

```bash
python3 -m venv venv
```

Now you created venv folder which is your virtual enviroment
To run terminal commands inside the virutal Enviroment use

On Linux

```bash
source venv/bin/activate
```

On Windows

```shell
venv\Scripts\activate
```

### Clone the repo and navigate to the project directory

Note that `~/Project_directory` is the location you've selected on your PC make sure you're in venv (Virtual Enviromnet)

```bash
git clone https://github.com/omarbarakota/DevOps_Project.git
cd venv
```

### Install dependencies

### 1- Install Python

   ```bash
    sudo apt update
    sudo apt install python3.11
   ```

### 2- Install required packages listed

```bash
pip install -r requirments.txt
```

### 3- Install Docker

   ```bash
    sudo apt-get update
    sudo apt install docker.io docker-compose docker-buildx
   ```

- test docker

    ```bash
    sudo groupadd docker
    docker run hello-world
    ```

### 4- Install Jenkins

   ```bash
    sudo apt update
    sudo apt upgrade
    sudo apt install openjdk-17-jre
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    
    # Test java installed

    java --version

    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install jenkins

    # test jenkins insalled

    jenkins --version
   ```

### 5- Install ansible

   ```bash
    sudo apt update
    sudo apt install ansible
    ansible-galaxy collection install community.docker
   ```

### 6- Install terraform

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

### Run application

the application will be available at `http://localhost:8000`

```bash
gunicorn wsgi
```

## 3- Testing

### Tests

   1. **Run All tests:**

      Use `python3 -m pytest` to execute the test suite for the application:
      That file has all scripts to be run

      ````bash
      python3 -m pytest
      ````

      This ensures all functionalities are working correctly.

   2. **Run Specific test:**

      Open the terminal in `/tests` file and make sure that the project is running
      Use `python3 tests_name.py` to execute the needed test case:

      ````bash
      python3 tests_name.py
      ````

      This ensures each functionality is working correctly.

## 4- Docker

### Why Docker ?

Docker can be used to:

- Create a consistent development environment.
- Automate the building and deployment of applications.
- Simplify the process of running tests in isolated environments.
- Package and distribute your application as a Docker image that can be easily shared and deployed anywhere.

### Login to DockerHub

   ```bash
   echo "Password" | docker login -u "username" --password-stdin
   ```

### To Build Docker image

```bash
docker build -t omarbarakota/dockerized_project:latest .
```

### To Push Docker image

```bash
docker push omarbarakota/dockerized_project:latest
```

## Pull this docker image

```bash
docker pull omarbarakota/dockerized_project:latest
```

## 5- Github Actions

GitHub Actions automates workflows directly within your GitHub repository. It is used to:

Automate tasks like testing, building, and deploying code.
Trigger CI/CD pipelines on events such as pushes, pull requests, or schedule-based triggers.
Integrate with other services and tools to streamline development and deployment processes.

To add any secrets you dont want to show in your file head to `Setting`->`Secrets and Variables`->`Actions` then add New Repository Secret

Note that you can check the action status using the `Badge`

## 6- Terraform

Terraform is an infrastructure as code (IaC) tool that allows you to define and provision cloud resources in a declarative manner. In your GitHub repo, Terraform is used to:

- Define, manage, and provision infrastructure resources like servers, databases, and networking components.
- Automate the creation and updating of infrastructure.
- Ensure that your infrastructure is version-controlled and reproducible.

- Before running add credentials from your AWS lab

```bash
nano ~/.aws/credentials # Update with your AWS lab credentials
```

### Create instance using terraform

```bash
cd Terraform

terraform init

terraform plan

terraform apply
```

### Connect to instance

```bash
cd ansible 

sudo chmod 400 ./mykey.pem

ssh -i ./mykey.pem ubuntu@ec2-3-88-11-121.compute-1.amazonaws.com
```

## 7- Ansible

Ansible is an automation tool used for configuration management, application deployment, and task automation. In your GitHub repo, Ansible can be used to:

- Automate the setup and management of infrastructure.
- Ensure consistent configurations across environments.
- Simplify complex processes like server provisioning, software installation, and application deployment.

### Run an ansible playbook (EC2 instance):

```bash
    ansible-playbook -i hosts.ini main.yaml
```

## Best Practices Followed

- **Virtual Environment**: Utilization of `venv` for package management, ensuring a clean environment isolated from system-wide Python packages.

- **Separation of Concerns**: HTML templates are stored in the `templates/` directory, maintaining separation between front-end and back-end logic.

- **Testing**: Integration of automated tests (`pytest`) to verify application functionality, ensuring reliability and consistency.

- **Docker**: Used Docker to create consistent development environments, automate the build and deployment of the application, and simplify testing in isolated environments. Docker images are built and pushed to DockerHub, facilitating easy sharing and deployment of the application.

- **CI/CD**: Leveraged GitHub Actions for continuous integration and continuous deployment. GitHub Actions workflows are defined to automate tasks such as testing, building, and deploying the application. This ensures that code changes are automatically tested and deployed, improving the development workflow.

- **Infrastructure as Code (IaC)**: Employed Terraform for defining and provisioning infrastructure resources in a declarative manner. Terraform configurations are used to automate the creation and management of cloud resources, ensuring infrastructure is reproducible and version-controlled.

- **Configuration Management**: Applied Ansible for configuration management and automation of infrastructure setup. Ansible playbooks are used to automate the configuration of servers and applications, ensuring consistent and repeatable setups across environments.

## Folder Structure

````bash
DevOps Project
      │
      └── main.py                   # Main Flask application file
      ├── templates/             # HTML templates (separation of concerns)
      │   └── index.html         # Main page template
      │   └── Generate.html      # Page that generates QR Code template
      │   └── Password.html      # Page that generates Password template
      │   └── Weather.html       # Page that Get the weather of a city
      ├── tests/
      │   └── test_qr.py         # Test QR generation feature for the application
      │   └── test_tasks.py      # Test Do do list features for the application
      │   └── test_time.py       # Test time display for the application
      │   └── test_weather.py    # Test weather display feature for the application
      │   └── test_password.py   # Test suite for the application
      └── requirements.txt       # List of dependencies
      ├── asnible/             # HTML templates (separation of concerns)
      │   └── ansible.cfg         # Ansible configuration file, specifying settings like inventory location, roles, and modules.
      │   └── hosts.ini      # Inventory file listing the hosts managed by Ansible.
      │   └── main.yaml      # Ansible playbook defining the automation tasks.
      ├── terraform/             # Directory containing Terraform configuration files for infrastructure as code.
          └── main.tf        # Terraform script that defines the infrastructure resources to be provisioned.
      ├── .github/workflows  
          └── actions.yaml  # defining a CI/CD workflow that automates processes like testing, building, and deploying your code.
````

## Future notes if you will edit

To make all libraries, verions and dependencies together to easy download them later (Don't not run this command)

- How to get all Dependencies

```bash
pip freeze > requirments.txt
```

- make all new test files in `/tests` folder

- Any new test files are created add it in `run_test.py`

- all new HTML files put it in `/templates` folder

- whenever you want to deactivate your virtual enviroment

```bash
source deactivate
```

- Build Docker image

   ```bash
   docker build -t `username`/`docker_repo_name`:`Tag` .
   ```

- Push Docker image

   ```bash
   docker push `username`/`docker_repo_name`:`Tag`
   ```

- Pull Docker image

   ```bash
   docker Pull `username`/`docker_repo_name`:`Tag`
   ```

Note that: `username`,`docker_repo_name`,`Tag`
are changables depending on your data ex for my case
