# Terraform AWS EC2 Blueprint

Reusable Terraform blueprint for a small, security-conscious EC2 deployment in AWS.

This repo is intentionally compact, but it demonstrates the patterns expected in production infrastructure modules:

- Typed variables with validation
- Configurable AWS profile and region
- Default tagging strategy
- Dedicated security group
- Parameterized SSH and HTTP ingress
- Encrypted root EBS volume
- IMDSv2 required on the instance metadata endpoint
- Useful outputs for downstream automation

## Architecture

```text
AWS provider
  -> security group
      -> SSH ingress from var.ssh_cidr_blocks
      -> HTTP ingress from var.http_cidr_blocks
      -> unrestricted egress
  -> EC2 instance
      -> encrypted gp3 root volume
      -> IMDSv2 required
      -> default project/environment tags
```

## Usage

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan \
  -var='instance_name=platform-demo-web' \
  -var='ssh_cidr_blocks=["203.0.113.10/32"]'
```

## Example Variables

```hcl
aws_region       = "us-west-2"
aws_profile      = "default"
environment      = "dev"
instance_name    = "platform-demo-web"
instance_type    = "t3.micro"
ssh_cidr_blocks  = ["203.0.113.10/32"]
http_cidr_blocks = ["0.0.0.0/0"]
```

## Outputs

- `instance_id`
- `instance_public_ip`
- `security_group_id`

## Notes

This is a blueprint, not a managed service module. It keeps networking simple so the repository is easy to review, while still showing the operational controls that matter: validated inputs, explicit ingress, encrypted storage, tagging, and secure metadata defaults.
