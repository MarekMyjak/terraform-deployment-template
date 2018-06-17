variable "region" {
  default = "eu-west-1"
}
variable "object_source" {}
variable "application_name" {}
variable "application_version_name" {}
variable "solution_stack_name" {
  default = "64bit Amazon Linux 2018.03 v4.5.0 running Node.js"
}

module "aws_s3_bucket_object" {
  source = "../aws s3 bucket object"

  region = "${var.region}"
  bucket_name = "${module.random_name.random_name}"
  object_key = "${module.random_name.random_name}"
  object_source = "${var.object_source}"
}

module "aws_elastic_beanstalk_application_version" {
  source = "../aws elastic beanstalk application version"

  region = "${var.region}"
  application_name = "${var.application_name}"
  application_version_name = "${var.application_version_name}"
  aws_s3_bucket_id = "${module.aws_s3_bucket_object.aws_s3_bucket_id}"
  aws_s3_bucket_object_id = "${module.aws_s3_bucket_object.aws_s3_bucket_object_id}"
}

module "aws_elastic_beanstalk_environment" {
  source = "../aws elastic beanstalk environment"

  region = "${var.region}"
  aws_elastic_beanstalk_application_name = "${module.aws_elastic_beanstalk_application_version.aws_elastic_beanstalk_application_name}"
  aws_elastic_beanstalk_application_version_name = "${module.aws_elastic_beanstalk_application_version.aws_elastic_beanstalk_application_version_name}"
  aws_elastic_beanstalk_environment_name = "${module.random_name.random_name}"
  solution_stack_name = "${var.solution_stack_name}"
}

module "random_name" {
  source = "../../../modules/random name"
}

output "url" {
  value = "${module.aws_elastic_beanstalk_environment.aws_elastic_beanstalk_environment_url}"
}

output "environment_name" {
  value = "${module.random_name.random_name}"
}