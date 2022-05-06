provider "aws" {
  region = var.region
}

resource "aws_lb" "alb" {
  name               = var.instance.name
  internal           = var.instance.internal
  
  load_balancer_type = "application"

  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = true

  enable_http2       = var.instance.http2

  access_logs {
    bucket  = var.logsbucket
    prefix  = "alb_${var.instance.name}"
    enabled = true
  }
  
  drop_invalid_header_fields = true
}