# cloud-lab-scripts
scripts used to setup test apps for azure and aws labs

webserver_docker_pokedex.sh
---
-add a username/password/node name at the top, run as root. 
-updates ubuntu, installs docker, adds user to sudo and docker groups.
-creates nginx container, pulls and starts pokedex site with node name at the top in big ugly text via http

now there is a site to actually test and set up in 2 seconds.
