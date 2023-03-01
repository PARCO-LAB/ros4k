#!/bin/bash

python3 script/plots.py -f results/jetson/docker_single/
mv *.jpg plot_results/jetson/docker_single

python3 script/plots.py -f results/jetson/docker_multi/
mv *.jpg plot_results/jetson/docker_multi

python3 script/plots.py -f results/jetson/single_machine/
mv *.jpg plot_results/jetson/single_machine

python3 script/plots.py -f results/server/docker_single/
mv *.jpg plot_results/server/docker_single

python3 script/plots.py -f results/server/docker_multi/
mv *.jpg plot_results/server/docker_multi

python3 script/plots.py -f results/server/single_machine/
mv *.jpg plot_results/server/single_machine