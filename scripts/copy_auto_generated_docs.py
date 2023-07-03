import os
import shutil

def copy_and_rename_auto_generated_files(parent_folder):
    """
    Recursively identifies "AUTO-GENERATED.md" files in subdirectories within the parent folder,
    copies them to another location, and renames the copied files with the immediate parent directory name.
    The destination folder path is prefixed with 'docs/' and follows the same path structure as the original file within the 'modules' directory.

    Args:
        parent_folder (str): Path to the parent folder containing subdirectories.
    """
    for root, dirs, files in os.walk(parent_folder):
        for file in files:
            if file == "AUTO-GENERATED.md":
                # Get the source file path
                source_file = os.path.join(root, file)

                # Get the immediate parent directory name
                parent_dir = os.path.basename(os.path.dirname(source_file))

                # Construct the destination file path
                destination_file = os.path.join("docs", os.path.dirname(root), parent_dir + ".md")   

                # Create necessary directories in the destination path if they don't exist
                os.makedirs(os.path.dirname(destination_file), exist_ok=True)

                # Copy the file to the destination folder with the new name
                shutil.copy2(source_file, destination_file)

                # Print the source and destination file paths
                print(f"Copied {source_file} to {destination_file}")

# Example usage
parent_folder = "./modules"
copy_and_rename_auto_generated_files(parent_folder)
