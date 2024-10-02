import os
from datetime import datetime, timedelta
import shutil

main_dir = os.getcwd()
sub_dir = "input_files"
working_path = os.path.join(main_dir, sub_dir)


def delete_old_folders():
    # Get current time
    current_time = datetime.now()
    
    try:
        # Iterate over all folders in the specified path
        for folder_name in os.listdir(working_path):
            full_path = os.path.join(working_path, folder_name)
            # Check if it's a directory
            if os.path.isdir(full_path):
                # Get the modification time of the folder
                modified_time = datetime.fromtimestamp(os.path.getmtime(full_path))
                # Calculate the time difference
                time_difference = current_time - modified_time
                # If the folder is more than one hour old, delete it
                if time_difference > timedelta(hours=1):
                    print(f"Deleting folder: {folder_name}")
                    # Uncomment the line below to actually delete the folder
                    shutil.rmtree(full_path)
    except FileNotFoundError:
        print(f"Folder '{folder_path}' not found.")


delete_old_folders()