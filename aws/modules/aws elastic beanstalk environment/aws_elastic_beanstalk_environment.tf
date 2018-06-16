variable "terraform_environment_name" {}
variable "aws_elastic_beanstalk_application_name" {}
variable "aws_elastic_beanstalk_application_version_name" {}
variable "solution_stack_name" {
  default = "64bit Amazon Linux 2018.03 v4.5.0 running Node.js"
}

resource "aws_elastic_beanstalk_environment" "default" {
  name = "${var.terraform_environment_name}"
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

output "aws_elastic_beanstalk_environment_url" {
  value = "${aws_elastic_beanstalk_environment.default.cname}"
}