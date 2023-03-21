module "init_project" {
  source = "../../modules/init-project"
  project_id = var.project_id
}

module "init_terraform_user" {
  source = "../../modules/init-deploy-user"
  project_id = var.project_id
  deploy_user = var.deploy_user
}
