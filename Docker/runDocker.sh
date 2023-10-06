docker build -t my-ubuntu-image .
docker run -it --name my-ubuntu-container -v /Users/casperdijkstra/Documents/FreshMinds/Kennissessies/Linux/Assignments:/usr/local my-ubuntu-image
