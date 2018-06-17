variable "region" {}
variable "bucket_name" {}
variable "object_key" {}
variable "object_source" {}

provider "aws" {
  //AWS Provider docs: https://www.terraform.io/docs/providers/aws/index.html
  //You can provide your credentials via the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, environment variables, representing your AWS Access Key and AWS Secret Key, respectively. Note that setting your AWS credentials using either these (or legacy) environment variables will override the use of AWS_SHARED_CREDENTIALS_FILE and AWS_PROFILE. The AWS_DEFAULT_REGION and AWS_SESSION_TOKEN environment variables are also used, if applicable:
  region = "${var.region}"
}

resource "aws_s3_bucket" "default" {
  bucket = "${var.bucket_name}"
}

resource "aws_s3_bucket_object" "default" {
  bucket = "${aws_s3_bucket.default.bucket}"
  key = "${var.object_key}"
  source = "${var.object_source}"
}

output "aws_s3_bucket_id" {
  value = "${aws_s3_bucket.default.id}"
}

output "aws_s3_bucket_object_id" {
  value = "${aws_s3_bucket_object.default.id}"
}