variable "region" {
  default = "eu-west-1"
}

provider "aws" {
  //AWS Provider docs: https://www.terraform.io/docs/providers/aws/index.html
  //You can provide your credentials via the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, environment variables, representing your AWS Access Key and AWS Secret Key, respectively. Note that setting your AWS credentials using either these (or legacy) environment variables will override the use of AWS_SHARED_CREDENTIALS_FILE and AWS_PROFILE. The AWS_DEFAULT_REGION and AWS_SESSION_TOKEN environment variables are also used, if applicable:
  region = "${var.region}"
}

module "aws_s3_bucket_object" {
  source = "modules/aws s3 bucket object"

  bucket_name = "unique-bucket-name-15ed4f4b-50a5-45fb-99d4-2f71885c29b4"
  object_key = "app"
  object_source = "../apps/get-started-node.zip"
}

module "aws_elastic_beanstalk_application_version" {
  source = "modules/aws elastic beanstalk application version"

  application_name = "terraform_application"
  application_version_name = "terraform_application_version"
  aws_s3_bucket_id = "${module.aws_s3_bucket_object.aws_s3_bucket_id}"
  aws_s3_bucket_object_id = "${module.aws_s3_bucket_object.aws_s3_bucket_object_id}"
}

module "aws_elastic_beanstalk_environment" {
  source = "modules/aws elastic beanstalk environment"

  aws_elastic_beanstalk_application_name = "${module.aws_elastic_beanstalk_application_version.aws_elastic_beanstalk_application_name}"
  aws_elastic_beanstalk_application_version_name = "${module.aws_elastic_beanstalk_application_version.aws_elastic_beanstalk_application_version_name}"
  terraform_environment_name = "env-name"
}

output "url" {
  value = "${module.aws_elastic_beanstalk_environment.aws_elastic_beanstalk_environment_url}"
}