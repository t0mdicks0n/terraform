## About

A Terraform script for automating of: 
* Creation of an AWS EC2 instance
* Adding a Terraform security group that open up the port given as input by the  user
* Deploying a small busybox server to serve a Hello World HTML at the open port

## Next step

This serves as a good basic Terraform script to automate stuff like deploying a actual app with Docker or Kubernetes.

## Installation

To get started type the following in your terminal:
   ```
terraform plan
   ```

Followed by:
   ```
terraform apply
   ```

To see the status of your deployment you can do:
   ```
terraform show
   ```

And to finally take down your deployment you do:
   ```
terraform destroy
   ```
You will be asked for your AWS credentials again and after that your deployment will be destroyed.