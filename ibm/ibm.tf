module "ibm_app" {
  source = "modules/ibm app"

  org = "marekmyjak"
  space = "dev"
  app_domain_shared = "eu-gb.mybluemix.net"
  host = "terraform-host"
  application_name = "my-app"
  object_source = "../apps/get-started-node.zip"
  buildpack = "sdk-for-nodejs"
  application_version_name = "1"
}

output "url" {
  value = "${module.ibm_app.url}"
}

output "id" {
  value = "${module.ibm_app.id}"
}