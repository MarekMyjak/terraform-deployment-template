# terraform-deployment-template
This repository contains set of deployment templates using terraform.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html)

## How to run aws deployment
0. Configure your aws profile using AWS CLI. The AWS CLI will prompt you for four pieces of information. AWS Access Key ID and AWS Secret Access Key are your account credentials.
```
aws configure

```
1. Move to aws directory
```
cd aws
```
2. Initialize terraform, this step will download require plugins
```
terraform init
```
3. Apply changes
```
cd terraform apply -auto-approve
```

## How to run ibm deployment
0. Set environment variables BM_API_KEY. To use additional functionality set SL_USERNAME, and SL_API_KEY environment variables. 
1. Download ibm provider from [here](https://github.com/IBM-Cloud/terraform-provider-ibm/releases) and put it in specific folder based on operation system.
* On Windows, in the sub-path terraform.d/plugins beneath your user's "Application Data" directory.
* On all other systems, in the sub-path .terraform.d/plugins in your user's home directory.
2. Move to ibm directory
```
cd ibm
```
3. Initialize terraform, it require ibm provider plugin(Third-party provider)
```
terraform init
```
4. Apply changes
```
cd terraform apply -auto-approve
```