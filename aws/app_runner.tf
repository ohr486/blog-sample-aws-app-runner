resource "aws_apprunner_service" "blog_sample_app_runner" {
  service_name = "blog-sample-app-runner"

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.blog_sample_app_runner.arn
    }
    image_repository {
      image_configuration {
        port = "8080"
      }
      image_identifier      = "${aws_ecr_repository.blog_sample_app_runner.repository_url}:latest"
      image_repository_type = "ECR"
    }
  }

  tags = {
    Name = "blog-sample-app-runner"
  }
}

