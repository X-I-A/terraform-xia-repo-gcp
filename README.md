# X-I-A initialize GCP Repository Project
Terraform XIA Initialization for Google Cloud Platform Repository Usage

## Introduction

Prepare a project for the usage of XIA Repository

## Quick Start

### Prerequisite
An empty Google Cloud Project

If the project is not empty, you might meet some `resource already exists` errors.
You could import them into terraform states 
or simply removing the related modules in `modules` subdirectory

### Variables 

* project_id (Mandatory): Project id to initialize
* deploy_user (Default="xia-deployer"): The technical user which will be used to deploy application

### Let's go !
Open the Google Cloud Shell from Google Cloud Console and launching the following command and it is done
```bash
git clone https://github.com/X-I-A/terraform-xia-repo-gcp
cd terraform-xia-repo-gcp
terraform -chdir=environments/prod workspace new <project_id>
terraform -chdir=environments/prod init
terraform -chdir=environments/prod validate
terraform -chdir=environments/prod plan -var="project_id=<project_id>"
terraform -chdir=environments/prod apply -var="project_id=<project_id>" -auto-approve
```

