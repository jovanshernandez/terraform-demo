variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "baxter-demo"
}

variable "key_name" {
	description = "Value of the Key Pair for your EC2 instance"
	type = string
	default = "baxter-devops"
}

variable "ami_type" {
	description = "Value of the AMI ID for the EC2 instance"
	type = string
	default = "ami-08d70e59c07c61a3a"
}

variable "instance_type" {
	description = "Value of the EC2 instance type"
	type = string
	default = "t2.micro"
}