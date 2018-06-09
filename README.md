# terraform-deployment-template
This repository contains set of deployment templates using terraform.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html)

## How to run aws deployment
1. Configure your aws profile using AWS CLI. The AWS CLI will prompt you for four pieces of information. AWS Access Key ID and AWS Secret Access Key are your account credentials.
```
aws configure

```
2. Move to aws directory
```
cd aws
```
3. Initialize terraform, this step will download require plugins
```
terraform init
```
4. Apply changes
```
cd terraform apply -auto-approve
```

## How to run ibm deployment
> At the moment ibm provider isn't in the official Hashicorp repository
1. Set environment variables BM_API_KEY. To use additional functionality set SL_USERNAME, and SL_API_KEY environment variables. 
2. Download ibm provider from [here](https://github.com/IBM-Cloud/terraform-provider-ibm/releases) and put it in specific folder based on operation system.
* On Windows, in the sub-path terraform.d/plugins beneath your user's "Application Data" directory.
* On all other systems, in the sub-path .terraform.d/plugins in your user's home directory.
3. Move to ibm directory
```
cd ibm
```
4. Initialize terraform, it require ibm provider plugin(Third-party provider)
```
terraform init
```
4. Apply changes
```
cd terraform apply -auto-approve
```

## How to run heroku
> Heroku deploy have to be run on operation system with bash, e.g Linux
1. Set HEROKU_API_KEY environment variables.
2. Move to heroku directory
```
cd ibm
```
3. Initialize terraform, this step will download require plugins
```
terraform init
```
4. Apply changes
```
cd terraform apply -auto-approve
```