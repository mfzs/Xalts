# Xalts
This include assignment given by the salts

## Table of Contents
- [Task 1](#Task1)
- [Task 2](#Task2)
- [Task 3](#Task3)

## Task1 - Run Flask App
### Pre-requisite
- Install python3 and flask
  ```
  sudo apt update -y
  sudo apt install python3 -y
  sudo pip3 install flask 
  ```

 - Clone the repo
   ```
   git clone https://github.com/mfzs/Xalts.git
   ```
 - Change the Directory
  ```
  cd Xalts/task1
  ```
 - Run the flask app
  ```
  python3 flask-health-api.py
  ```
- Endpoint(s)
[Health API](http://localhost:8080/health) or
[Health API](http://127.0.0.1:8080/health)



## Task2 - Dockerrise the application
### Pre-requisite
- [Install Docker](https://docs.docker.com/engine/install/ubuntu/)

- Running the Application

  - Change the Directory
    ```
    cd Xalts/task2
    ```
  - Build the dockerfile
    ```
    sudo docker build -t mfzs/flaskapp:0.0.1 -f Dockerfile . --no-cache
    ```
  - run the container
    ```
    sudo docker run -dit -p 8080:8080 --name flaskapp  mfzs/flaskapp:0.0.1
    ```
  - Endpoint(s)
[Health API](http://localhost:8080/health) or
[Health API](http://127.0.0.1:8080/health)



## Task3
### Pre-requisite
- [Install terraform](https://developer.hashicorp.com/terraform/install#linux)
- Create a creds json file for your service account [GCP_Link](https://cloud.google.com/iam/docs/keys-create-delete)
    - Put this file at /etc/creds.json in your system or change the path in terraform.tf file

- Running the Application
    - Change the Directory
    ```
    cd Xalts/task3
    ```
    - Init your repo
      ```
      sudo terraform init
      ```
    - Plan terraform and check if anything need to update
      ```
      sudo terraform plan
      ```
    - Apply if everything looks fine to you
      ```
      sudo terraform apply --auto-approve
      ```
- Endpoint(s)
  Once your terraform script got completed you will get a link to endpoint
  http://{Public IP of the machine}:8080/health

  ### Disclaimer ###
  We have to wait for the health endpoint to work, as it might take 3-5 Minutes for service to start functioning as it has to install few services.
