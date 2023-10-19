## Linux assignments
This repository contains Assignment for the Linux deep dive session at Freshminds

### What to do:
* Install Docker Desktop 
    * Windows: https://docs.docker.com/desktop/install/windows-install/
    * MacOS: `brew install --cask docker`
    * Linux: No need, you already have Linux ;)

* Checkout this repository on your local file system and step into this directory in your terminal
* Run `docker build --no-cache -t fedora -f Dockerfile .`
* Run `docker run -it --rm --name fedora fedora`
Note: On Windows, you should NOT run Docker in your WSL but in Powershell or CMD.