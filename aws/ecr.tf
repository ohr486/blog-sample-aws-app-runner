resource "aws_ecr_repository" "blog_sample_app_runner" {
  name                 = "blog-sample-app-runner"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
