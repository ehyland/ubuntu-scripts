#!/bin/bash

function remove_containers {
  docker kill $(docker ps -q)
  docker rm $(docker ps -aq)
}

function remove_data_volumes {
  docker volume rm $(docker volume ls -q)
}

while true; do
  read -p "Do you wish to remove docker containers?" yn
  case $yn in
      [Yy]* ) echo "Removing containers"; remove_containers; break;;
      [Nn]* ) echo "You said no"; break;;
      * ) echo "Please answer yes or no.";;
  esac
done

while true; do
  read -p "Do you wish to remove docker named volumes?" yn
  case $yn in
      [Yy]* ) echo "Removing volumes"; remove_data_volumes; break;;
      [Nn]* ) echo "you said no"; break;;
      * ) echo "Please answer yes or no.";;
  esac
done

echo "Done!"
