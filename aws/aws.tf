variable "region" {
  default = "eu-west-1"
}
variable "bucket_name" {
  default = "marekmyjak-my-bucket2"
}
variable "object_key" {
  default = "docker.zip"
}
variable source {
  default = "./docker.zip"
}
variable application_name {
  default = "terraform_application"
}
variable terraform_environment_name {
  default = "terraform-environment"
}

variable application_version_name {
  type = "string"
  default = "terraform_application_version"
}

variable solution_stack_name {
  type = "string"
  default = "64bit Amazon Linux 2017.09 v2.8.2 running Docker 17.06.2-ce"
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "default" {
  bucket = "${var.bucket_name}"
}

resource "aws_s3_bucket_object" "default" {
  bucket = "${aws_s3_bucket.default.bucket}"
  key = "${var.object_key}"
  source = "${var.source}"
}

resource "aws_elastic_beanstalk_application" "default" {
  name = "${var.application_name}"
}

resource "aws_elastic_beanstalk_application_version" "default" {
  application = "${aws_elastic_beanstalk_application.default.name}"
  bucket = "${aws_s3_bucket.default.id}"
  key = "${aws_s3_bucket_object.default.id}"
  name = "${var.application_version_name}"
}

resource "aws_elastic_beanstalk_environment" "default" {
  name = "${var.terraform_environment_name}"
  application = "${aws_elastic_beanstalk_application.default.name}"
  version_label = "${aws_elastic_beanstalk_application_version.default.name}"
  solution_stack_name = "${var.solution_stack_name}"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "EnvironmentType"
    value = "SingleInstance"
  }
}