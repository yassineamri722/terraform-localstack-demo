# Copilot Instructions for terraform-localstack-demo

## Project Overview
- **Purpose:** Demonstrates AWS infrastructure provisioning (S3, VPC, EC2) using Terraform, with LocalStack for local AWS emulation.
- **Structure:**
  - `main.tf`, `variables.tf`, `outputs.tf`: Root configuration, variables, and outputs.
  - `modules/`: Contains reusable Terraform modules for `s3`, `vpc`, and `ec2`.
  - `environments/`: Environment-specific variable files (`dev.tfvars`, `stage.tfvars`, `prod.tfvars`).
  - `docker-compose.yml`: Runs LocalStack for local AWS API endpoints.

## Key Workflows
- **Local Development:**
  1. Start LocalStack: `docker-compose up -d`
  2. Initialize Terraform: `terraform init`
  3. Plan/apply with environment: `terraform plan -var-file="environments/dev.tfvars"`, `terraform apply -var-file="environments/dev.tfvars"`
- **State Management:**
  - Local state files are used (`terraform.tfstate`, `terraform.tfstate.d/`).
  - `.tfvars` files are git-ignored for security.

## Module Patterns
- **S3 Module:**
  - Input: `bucket_name`
  - Outputs: `bucket_name`, `bucket_arn`
- **VPC Module:**
  - Inputs: `vpc_cidr`, `subnet_cidr`
  - Outputs: `vpc_id`, `subnet_id`, `igw_id`
- **EC2 Module:**
  - Inputs: `ami_id`, `instance_type`, `subnet_id`
  - Outputs: `instance_id`, `private_ip`, `security_group_id`

## Conventions & Patterns
- **Module Usage:**
  - All resources are provisioned via modules, not directly in root.
  - Module outputs are referenced in root `outputs.tf`.
- **Environment Handling:**
  - Bucket names are suffixed with workspace: `${var.bucket_name}-${terraform.workspace}`
  - Use `terraform.workspace` for environment-specific resources.
- **Provider Configuration:**
  - AWS provider is configured for LocalStack endpoints and dummy credentials.
  - Path-style S3 access is enabled for LocalStack compatibility.

## Integration Points
- **LocalStack:**
  - All AWS API calls are redirected to LocalStack via custom endpoints in `main.tf` provider block.
- **Docker Compose:**
  - `docker-compose.yml` defines the LocalStack service and required ports.

## Examples
- To add a new environment, create a new `.tfvars` file in `environments/` and use it with `terraform plan/apply -var-file`.
- To add a new resource, create a new module or extend an existing one, then reference it in `main.tf`.

## References
- See `main.tf` for module wiring and provider setup.
- See each module's `variables.tf` and `outputs.tf` for input/output contracts.
- See `docker-compose.yml` for LocalStack configuration.

---

If you are unsure about a workflow or pattern, check the referenced files or ask for clarification in a pull request.
