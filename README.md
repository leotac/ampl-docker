# AMPL + Jupyter Notebook docker image

[![docker pulls](https://img.shields.io/docker/pulls/leotac/ampl-notebook.svg)](https://hub.docker.com/r/leotac/ampl-notebook/) [![docker stars](https://img.shields.io/docker/stars/leotac/ampl-notebook.svg)](https://hub.docker.com/r/leotac/ampl-notebook/) [![docker size](https://img.shields.io/imagelayers/image-size/leotac/ampl-notebook/latest.svg)](https://hub.docker.com/r/leotac/ampl-notebook/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A simple, Ubuntu-based docker image, with [AMPL](http://ampl.com/) and a bunch of useful python modules to run AMPL inside a Jupyter notebook.

It includes [iampl](https://github.com/vitaut/iampl), an AMPL kernel for [Jupyter](http://jupyter.org/), so that you can run AMPL code 
inside a Jupyter notebook, and seamlessly switch between AMPL and Python code to process and visualize the data from your optimization problem.

You can get the image either from docker hub:
    
    docker pull leotac/ampl-notebook

or build it locally from the Dockerfile:

    git clone git@github.com:sbebo/ampl-docker.git
    cd ampl-docker
    docker build -t ampl-notebook .

**Note**: AMPL is a commercial product, and `docker build` will automatically download a (limited) demo version from http://ampl.com/.
If you want to use your own fully licensed copy of AMPL, you must provide the location of an archive containing the AMPL binary for linux as follows:
    
    docker build --build-args AMPL=ampl.tgz -t ampl-notebook .

The archive must be within the Docker context, that is, in the subtree rooted in the directory where you run the `docker build` command.

## Run a container

The default entrypoint is the script `start_notebook.sh`, that starts a Jupyter notebook. The container can be run, for example, as follows:

    docker run --rm -it -v $(pwd):/root/mycode -p 8888:8888 ampl-notebook

where the current directory is mounted in the container in `/root/mycode`, and we published the port 8888 so that it can be reached from the host. The server will be available from the host at `0.0.0.0:8888`.
