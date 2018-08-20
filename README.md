# avillachlab-jupyter-singleuser
Single-user Jupyter Notebook Development Environment

Post-docs and researchers in the Avillach Lab should use this repository to add/update/remove
packages and supporting software from the Single User Jupyter Notebook image used in the 
Avillach Lab managed JupyterHub environments.

This will eventually be the same mechanism we use to manage the Jupyter Lab environments.


First Time Instructions:

1) Create a docker-machine to do your jupyter single-user image development.

docker-machine create jupyter-dev

2) Configure your docker client to use that machine

eval $(docker-machine env jupyter-dev)

3) Start the Jupyter server

docker-compose up -d

4) Browse your docker-machine ip

open $(docker-machine ls | grep jupyter-dev | awk '{ print $5 }' | sed s/tcp/http/ | sed s/2376/80/)


Any Future Time Instructions:

1) Make sure your docker-machine is running

docker-machine ls | grep nhanes | awk '{ print $4 }'

2) If the output of the above command is not Running and is Stopped instead, run the following:

docker-machine start jupyter-dev
eval $(docker-machine env jupyter-dev)

3) If you get an error message about certificates being invalid or something, run this:

docker-machine regenerate-certs jupyter-dev
eval $(docker-machine env jupyter-dev)

4) Then make sure the services are running by running this:

docker-compose up -d

5) Browse your docker-machine ip

open $(docker-machine ls | grep jupyter-dev | awk '{ print $5 }' | sed s/tcp/http/ | sed s/2376/80/)


Once you have the services running and can access the Jupyter notebook in your browser, use
this environment to make sure the image has all your dependencies installed. You should be
able to install anything you require for R by using the notebook. If you need a newer version
of R or something big like that, you may be able to install it using a terminal session
in Jupyter to do your development of the notebook.

If you end up using the terminal to install anything, it is best if you create a text file
in the Jupyter application and run that text file in the terminal. For example if you wanted
to install r-base you would add the following to the update_os.sh script:



#!/bin/bash

apt-get install r-base



# save this as a text file installR.sh from Jupyter Notebook then test by running it in the Jupyter terminal:

bash update_os.sh



Once you have added all your commands to the dependencies.r scripts or added all your shell scripts and
you feel you have a working environment that you would like to see deployed to the JupyterHub environments
you should test it by running:


docker-compose down && docker-compose build && docker-compose up -d

open $(docker-machine ls | grep jupyter-dev | awk '{ print $5 }' | sed s/tcp/http/ | sed s/2376/80/)



If your dependencies and libraries are in your desired state, you then submit a Service Request ticket
in AVL Science and we will build a new base image using your scripts and update the image in the
JupyterHub environments. When this happens we will clear out the dependencies.r files and the update_os.sh
files as the new base image will already have these changes applied.


