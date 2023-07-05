import subprocess
import json

def get_terraform_outputs():
    # Run terraform output command
    output = subprocess.run(['terraform', 'output', '-json'], capture_output=True, text=True)
    
    if output.returncode != 0:
        print('Error executing terraform output command:')
        print(output.stderr)
        return None
    
    try:
        # Parse JSON output as a dictionary
        outputs = json.loads(output.stdout)
        return outputs
    except json.JSONDecodeError as e:
        print('Error parsing terraform output as JSON:')
        print(e)
        return None

# Usage example
terraform_outputs = get_terraform_outputs()

if terraform_outputs:
    # Print all output values
    for output_name, output_value in terraform_outputs.items():
        print(f"{output_name}: {output_value['value']}")
