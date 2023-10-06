## Linux assignments
This repository contains Assignment for the Linux deep dive session at Freshminds

### What to do:
* Install Docker Desktop 
* * Windows: https://docs.docker.com/desktop/install/windows-install/
* * MacOS: `brew install --cask docker`
* * Linux: No need, you already have Linux ;)

* Checkout this repository on your local file system and step into this directory in your terminal
* Run `docker build -t debian-devel -f DockerfileFull .`
* Run `docker run -it --name debian-devel debian-devel`


### Help
If you logged out of your container and it is still running, stop and rm the image by running
`docker stop $(docker ps -a | awk '{ print $1 }' | sed -n '2p') && docker rm $(docker ps -a | awk '{ print 
$1 }' | sed -n '2p')`

And then the `docker run` command mention above
