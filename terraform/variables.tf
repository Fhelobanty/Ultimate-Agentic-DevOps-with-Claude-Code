variable "region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name of the project for resource naming and tagging"
  type        = string
  default     = "portfolio-site"
}

variable "environment" {
  description = "Environment name (e.g., production, staging, development)"
  type        = string
  default     = "production"
}

variable "domain_name" {
  description = "Custom domain name for the website (optional)"
  type        = string
  default     = ""
}
