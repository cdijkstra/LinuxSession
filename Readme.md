## Linux assignments
This repository contains Assignment for the Linux deep dive session at Freshminds

### What to do:
* Install Docker Desktop 
    * Windows: https://docs.docker.com/desktop/install/windows-install/
    * MacOS: `brew install --cask docker`
    * Linux: No need, you already have Linux ;)

* Checkout this repository on your local file system and step into this directory in your terminal
* Run `docker build -t debian-devel -f DockerfileFull .`
* Run `docker run -it --name debian-devel debian-devel`

After finishing assignments, make sure to stop the container

### Help
If you logged out of your container and it is still running, run `docker start -i debian-devel`,
It this does not work, consider stopping the containers (see below) followed by`docker run -it --name debian-devel debian-devel` to spin up a new container.

### Stop containers at the end
Run the following command
`§docker stop $(docker ps -a | awk '{ print $1 }' | sed -n '2p') && docker rm $(docker ps -a | awk '{ print  $1 }' | sed -n '2p')`