# Docker image for mathematical optimization in Jupyter with AMPL

[![docker pulls](https://img.shields.io/docker/pulls/leotac/ampl-notebook.svg)](https://hub.docker.com/r/leotac/ampl-notebook/) [![docker stars](https://img.shields.io/docker/stars/leotac/ampl-notebook.svg)](https://hub.docker.com/r/leotac/ampl-notebook/) [![](https://images.microbadger.com/badges/image/leotac/ampl-notebook.svg)](https://microbadger.com/images/jupyter/base-notebook "jupyter/base-notebook image metadata") [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A simple, Ubuntu-based docker image, containing a bunch of utilities
to do mathematical optimization inside [Jupyter](http://jupyter.org/) notebooks
based on [AMPL](http://ampl.com/),
a powerful mathematical optimization modelling language.

It includes python modules for data processing and analysis (numpy, pandas,
matplotlib), and amplpy, a python interface for the AMPL language,
so that you can seamlessly switch between AMPL and Python code to process and visualize
the data from your optimization problems.

You can get the image either from docker hub:
    
    docker pull leotac/ampl-notebook

or build it locally from the Dockerfile:

    git clone git@github.com:sbebo/ampl-docker.git
    cd ampl-docker
    docker build -t ampl-notebook .

**Note**: AMPL is a commercial product, and `docker build` will automatically download a (limited) 
demo version from http://ampl.com/, containing several commercial optimization solvers, 
such as cplex, gurobi, xpress, baron, snopt.
If you want to use your own fully licensed copy of AMPL and solvers, you must provide the location of an archive containing the AMPL binary for linux and solvers, as follows:
    
    docker build --build-args AMPL=ampl.tgz -t ampl-notebook .

The archive must be within the Docker context, that is, in the subtree rooted in the directory where you run the `docker build` command.

## Run a container

The default entrypoint is the script `start_notebook.sh`, that starts a Jupyter notebook. The container can be run, for example, as follows:

    docker run --rm -it -v $(pwd):/root/mycode -p 8888:8888 ampl-notebook

where the current directory is mounted in the container in `/root/mycode`, and we published the port 8888 so that it can be reached from the host. The server will be available from the host at `0.0.0.0:8888`.
