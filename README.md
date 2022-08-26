# terraform_alb

Terraform module to create AWS loadbalancer

##  Dependencies

- S3 - <https://github.com/virsas/terraform_s3>
- VPC Subnet - <https://github.com/virsas/terraform_vpc_subnet>
- VPC Security groups - <https://github.com/virsas/terraform_vpc_sg>

## Files

- None

## Terraform example

``` terraform
##############
# Variable
##############
variable "alb_main" {
  default = {
    name = "main"
    # if the LB is internet only.
    internal = false
    # If http2 is allowed
    http2 = true
  }
}

##############
# Module
##############
module "alb_main" {
  source = "git::https://github.com/virsas/terraform_alb_application.git?ref=v1.0.0"
  instance = var.alb_main
  security_groups = [ module.vpc_sg_admin.id, module.vpc_sg_lb.id ]
  subnets = [ module.vpc_subnet_lb_a.id, module.vpc_subnet_lb_b.id ]
  logsbucket = module.s3_logs.name
}
```

## Outputs

- arn