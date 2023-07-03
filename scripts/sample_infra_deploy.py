import argparse
import subprocess

def run_terraform_init(terraform_dir):
    """Run `terraform init` command in the specified directory."""
    try:
        subprocess.run(["terraform", "init"], check=True, cwd=terraform_dir)
    except subprocess.CalledProcessError as e:
        print("Terraform init failed.")
        print(e)
        exit(1)

def run_terraform_plan(terraform_dir):
    """Run `terraform plan` command in the specified directory."""
    try:
        subprocess.run(["terraform", "plan"], check=True, cwd=terraform_dir)
    except subprocess.CalledProcessError as e:
        print("Terraform plan failed.")
        print(e)
        exit(1)

def run_terraform_apply(terraform_dir):
    """Run `terraform apply` command in the specified directory."""
    try:
        subprocess.run(["terraform", "apply", "--auto-approve"], check=True, cwd=terraform_dir)
    except subprocess.CalledProcessError as e:
        print("Terraform apply failed.")
        print(e)
        exit(1)

def run_terraform_destroy(terraform_dir):
    """Run `terraform destroy` command in the specified directory."""
    try:
        subprocess.run(["terraform", "destroy", "--auto-approve"], check=True, cwd=terraform_dir)
    except subprocess.CalledProcessError as e:
        print("Terraform destroy failed.")
        print(e)
        exit(1)

# Create the argument parser
parser = argparse.ArgumentParser(description="Terraform operations script")
parser.add_argument("operation", choices=["apply", "destroy"], help="Operation to perform: apply or destroy")
args = parser.parse_args()

# Set the directory path for the Terraform project
terraform_dir = "./samples"

# Perform Terraform operations
if args.operation == "apply":
    # Apply changes
    run_terraform_init(terraform_dir)
    run_terraform_plan(terraform_dir)
    run_terraform_apply(terraform_dir)
elif args.operation == "destroy":
    # Destroy resources
    run_terraform_init(terraform_dir)
    run_terraform_plan(terraform_dir)
    run_terraform_destroy(terraform_dir)
