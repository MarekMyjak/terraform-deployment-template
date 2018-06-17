variable "region" {}
variable "aws_elastic_beanstalk_environment_name" {}
variable "aws_elastic_beanstalk_application_name" {}
variable "aws_elastic_beanstalk_application_version_name" {}
variable "solution_stack_name" {}

provider "aws" {
  //AWS Provider docs: https://www.terraform.io/docs/providers/aws/index.html
  //You can provide your credentials via the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, environment variables, representing your AWS Access Key and AWS Secret Key, respectively. Note that setting your AWS credentials using either these (or legacy) environment variables will override the use of AWS_SHARED_CREDENTIALS_FILE and AWS_PROFILE. The AWS_DEFAULT_REGION and AWS_SESSION_TOKEN environment variables are also used, if applicable:
  region = "${var.region}"
}

resource "aws_elastic_beanstalk_environment" "default" {
  name = "${var.aws_elastic_beanstalk_environment_name}"
  application = "${var.aws_elastic_beanstalk_application_name}"
  version_label = "${var.aws_elastic_beanstalk_application_version_name}"
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

output "aws_elastic_beanstalk_environment_id" {
  value = "${aws_elastic_beanstalk_environment.default.id}"
}

output "aws_elastic_beanstalk_environment_name" {
  value = "${aws_elastic_beanstalk_environment.default.name}"
}

output "aws_elastic_beanstalk_environment_url" {
  value = "${aws_elastic_beanstalk_environment.default.cname}"
}

