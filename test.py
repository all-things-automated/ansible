import subprocess

def run_robot_tests():
    # Define the path to your .robot file
    robot_file = 'rpi_resources.robot'
    
    # Run the Robot Framework test suite
    result = subprocess.run(['robot', robot_file], capture_output=True, text=True)
    
    # Check if the execution was successful
    if result.returncode == 0:
        print("Tests executed successfully.")
    else:
        print("Tests failed.")
    
    # Print the output of the Robot Framework execution
    print("Output:\n", result.stdout)
    print("Errors:\n", result.stderr)

if __name__ == "__main__":
    run_robot_tests()
