provider "ibm" {
  //IBM Cloud Provider docs: https://ibm-cloud.github.io/tf-ibm-docs/index.html
  //You can provide your credentials by exporting the BM_API_KEY, SL_USERNAME, and SL_API_KEY environment variables, representing your IBM Cloud API key, SoftLayer user name, and SoftLayer API key, respectively.
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
  host = "terraform-host"
}

resource "ibm_app" "app" {
  name = "my-app"
  space_guid = "${data.ibm_space.space.id}"
  app_path = "../apps/get-started-node.zip"
  buildpack = "sdk-for-nodejs"
  memory = "128"
  disk_quota = "128"
  route_guid = [
    "${ibm_app_route.route.id}"]

  instances = 1
  app_version = "1"
}