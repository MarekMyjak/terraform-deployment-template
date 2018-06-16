variable "application_name" {}
variable "application_version_name" {}
variable "aws_s3_bucket_id" {}
variable "aws_s3_bucket_object_id" {}

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