# variables.tf

variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
  default     = "gonzaloseriche.rocks"
}

variable "environment" {
  description = "Environment for the infrastructure"
  type        = string
  default     = "production"
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for CloudFront distribution"
  type        = string
}