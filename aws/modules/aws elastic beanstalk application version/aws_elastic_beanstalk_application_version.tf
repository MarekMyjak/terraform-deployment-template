variable "region" {}
variable "application_name" {}
variable "application_version_name" {}
variable "aws_s3_bucket_id" {}
variable "aws_s3_bucket_object_id" {}

provider "aws" {
  //AWS Provider docs: https://www.terraform.io/docs/providers/aws/index.html
  //You can provide your credentials via the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, environment variables, representing your AWS Access Key and AWS Secret Key, respectively. Note that setting your AWS credentials using either these (or legacy) environment variables will override the use of AWS_SHARED_CREDENTIALS_FILE and AWS_PROFILE. The AWS_DEFAULT_REGION and AWS_SESSION_TOKEN environment variables are also used, if applicable:
  region = "${var.region}"
}

resource "aws_elastic_beanstalk_application" "default" {
  name = "${var.application_name}"
}

resource "aws_elastic_beanstalk_application_version" "default" {
  application = "${aws_elastic_beanstalk_application.default.name}"
  bucket = "${var.aws_s3_bucket_id}"
  key = "${var.aws_s3_bucket_object_id}"
  name = "${var.application_version_name}"
}

output "aws_elastic_beanstalk_application_name" {
  value = "${aws_elastic_beanstalk_application.default.name}"
}

output "aws_elastic_beanstalk_application_version_name" {
  value = "${aws_elastic_beanstalk_application_version.default.name}"
}