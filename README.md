# build_deploy_script

## Overview
`build_deploy.sh` is a Bash script that automates the full lifecycle of deploying a backend service. It compiles C/C++ code, builds a Docker container, runs unit tests, and deploys the service to a target environment. The script also integrates Git versioning by committing changes and tagging deployments.

## Features
- Compiles code using `make` and `gcc`.
- Builds and runs Docker containers for consistent environments.
- Runs Python unit tests inside the container.
- Automates service deployment (stop, remove, run new container).
- Commits and tags Git repository for deployment tracking.

## Usage
1. Make the script executable:
   ```bash
   chmod +x build_deploy.sh
   ```
2. Run the script from the project root:: `./build_deploy.sh`

## Requirements

- Linux or UNIX-based system
- Bash shell
- Docker installed and running
- Git installed and configured
- Python 3 for running unit tests
- make and gcc for compilation

## Notes

- Ensure Docker daemon is running before executing the script.
- Adjust Docker image names, ports, and Git repository settings as needed for your environment.
- The script uses set -e to exit immediately on any error for safety.


