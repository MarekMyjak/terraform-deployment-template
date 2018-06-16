variable "bucket_name" {}
variable "object_key" {}
variable "object_source" {}

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