resource "aws_rds_cluster" "blog_sample_db" {
  cluster_identifier      = "blog-sample-db"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.07.1"
  availability_zones      = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  database_name           = "blog_sample"
  master_username         = "admin"
  master_password         = "password"
  backup_retention_period = 1
  preferred_backup_window = "07:00-09:00"
  port                    = 3306
  skip_final_snapshot     = true
  db_subnet_group_name    = "ohr486base-public"      # SET YOUR DB SUBNET NAME
  vpc_security_group_ids  = ["sg-0b8cb29c69dc394e6"] # SET YOUR VPC SECURITY GROUP IDS

  tags = {
    Name = "blog-sample"
  }
}

resource "aws_rds_cluster_instance" "blog_sample_db1" {
  identifier               = "blog-sample-db-1"
  instance_class           = "db.t3.small"
  cluster_identifier       = aws_rds_cluster.blog_sample_db.id
  engine                   = aws_rds_cluster.blog_sample_db.engine
  engine_version           = aws_rds_cluster.blog_sample_db.engine_version
  db_subnet_group_name     = aws_rds_cluster.blog_sample_db.db_subnet_group_name

  tags = {
    Name = "blog-sample-db-1"
  }
}
