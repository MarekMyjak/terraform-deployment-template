module "aws_eleastic_beanstalk" {
  source = "modules/aws elastic beanstalk(bucket + app + env)"

  application_name = "app-name"
  application_version_name = "v1"
  object_source = "../apps/get-started-node.zip"
  solution_stack_name = "64bit Amazon Linux 2018.03 v4.5.0 running Node.js"
}

output "environment_name" {
  value = "${module.aws_eleastic_beanstalk.environment_name}"
}
output "url" {
  value = "${module.aws_eleastic_beanstalk.url}"
}