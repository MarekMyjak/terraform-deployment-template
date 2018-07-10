variable "region" {
  default = "eu-gb"
}
variable "org" {}
variable "space" {}
variable "app_domain_shared" {}
variable host {}
variable object_source {}
variable buildpack {}
variable application_version_name {}
variable application_name {}
variable memory {
  default = "128"
}
variable disk_quota {
  default = "128"
}
variable instances {
  default = 1
}

provider "ibm" {
  //IBM Cloud Provider docs: https://ibm-cloud.github.io/tf-ibm-docs/index.html
  //You can provide your credentials by exporting the BM_API_KEY, SL_USERNAME, and SL_API_KEY environment variables, representing your IBM Cloud API key, SoftLayer user name, and SoftLayer API key, respectively.
  region = "${var.region}"
}

data "ibm_org" "orgData" {
  org = "${var.org}"
}

data "ibm_space" "space" {
  space = "${var.space}"
  org = "${data.ibm_org.orgData.org}"
}

data "ibm_app_domain_shared" "domain" {
  name = "${var.app_domain_shared}"
}

resource "ibm_app_route" "route" {
  domain_guid = "${data.ibm_app_domain_shared.domain.id}"
  space_guid = "${data.ibm_space.space.id}"
  host = "${var.host}"
}

resource "ibm_app" "app" {
  name = "${var.application_name}"
  space_guid = "${data.ibm_space.space.id}"
  app_path = "${var.object_source}"
  buildpack = "${var.buildpack}"
  memory = "${var.memory}"
  disk_quota = "${var.disk_quota}"
  route_guid = [
    "${ibm_app_route.route.id}"]

  instances = "${var.instances}"
  app_version = "${var.application_version_name}"
}

output "url" {
  value = "${ibm_app_route.route.host}.${data.ibm_app_domain_shared.domain.name}"
}

output "id" {
  value = "${ibm_app.app.id}"
}