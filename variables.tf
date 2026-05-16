variable "aws_region" {
  description = "AWS region for the deployment."
  type        = string
  default     = "us-west-2"
}

variable "aws_profile" {
  description = "AWS CLI profile used for local runs."
  type        = string
  default     = "default"
}

variable "project" {
  description = "Project tag applied to resources."
  type        = string
  default     = "terraform-demo"
}

variable "environment" {
  description = "Environment tag applied to resources."
  type        = string
  default     = "dev"
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance."
  type        = string
  default     = "platform-demo-web"
}

variable "key_name" {
  description = "Value of the key pair for the EC2 instance."
  type        = string
  default     = "baxter-devops"
}

variable "ami_type" {
  description = "AMI ID for the EC2 instance."
  type        = string
  default     = "ami-08d70e59c07c61a3a"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro", "t3.small"], var.instance_type)
    error_message = "Use a small demo-safe instance type: t2.micro, t3.micro, or t3.small."
  }
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB."
  type        = number
  default     = 20

  validation {
    condition     = var.root_volume_size >= 8 && var.root_volume_size <= 100
    error_message = "root_volume_size must be between 8 and 100 GiB."
  }
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed to reach SSH."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "http_cidr_blocks" {
  description = "CIDR blocks allowed to reach HTTP."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Additional tags applied to resources."
  type        = map(string)
  default     = {}
}
