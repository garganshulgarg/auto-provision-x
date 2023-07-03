import subprocess

def run_terraform_init(terraform_dir):
    try:
        subprocess.run(["terraform", "init"], check=True, cwd=terraform_dir)
    except subprocess.CalledProcessError as e:
        print("Terraform init failed.")
        print(e)
        exit(1)

def run_terraform_plan(terraform_dir):
    try:
        subprocess.run(["terraform", "plan"], check=True, cwd=terraform_dir)
    except subprocess.CalledProcessError as e:
        print("Terraform plan failed.")
        print(e)
        exit(1)

# Example usage
terraform_dir = "./samples"
run_terraform_init(terraform_dir)
run_terraform_plan(terraform_dir)
