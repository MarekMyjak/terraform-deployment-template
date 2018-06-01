provider "ibm" {
  bluemix_api_key = "..."
  region = "eu-gb"
}

data "ibm_org" "orgData" {
  org = "marekmyjak"
}

data "ibm_space" "space" {
  space = "dev"
  org = "${data.ibm_org.orgData.org}"
}

data "ibm_app_domain_shared" "domain" {
  name = "eu-gb.mybluemix.net"
}

resource "ibm_app_route" "route" {
  domain_guid = "${data.ibm_app_domain_shared.domain.id}"
  space_guid = "${data.ibm_space.space.id}"
  host = "marek-myjak-terraform-host"
}

resource "ibm_service_instance" "service" {
  name       = "my-service"
  space_guid = "${data.ibm_space.space.id}"
  service    = "cloudantNoSQLDB"
  plan       = "Lite"
  tags       = ["my-service"]
}

resource "ibm_service_key" "key" {
  name = "%s"
  service_instance_guid = "${ibm_service_instance.service.id}"
}

resource "ibm_app" "app" {
  depends_on = ["ibm_service_key.key"]
  name = "my-app"
  space_guid = "${data.ibm_space.space.id}"
  app_path = "./get-started-node-master.zip"
  buildpack = "sdk-for-nodejs"
  memory = "128"
  disk_quota = "128"
  route_guid = ["${ibm_app_route.route.id}"]

  wait_time_minutes = 100
  instances = 2
  service_instance_guid = ["${ibm_service_instance.service.id}"]
  environment_json = {
    "somejson" = "somevalue"
  }
  app_version = "1"
}