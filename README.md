# AMPL + Jupyter docker image

A simple, Ubuntu-based docker image, with [AMPL](http://ampl.com/)
and a bunch of useful python modules.

It also includes [iampl](https://github.com/vitaut/iampl),
an AMPL kernel for jupyter, so that you can run AMPL code 
inside a jupyter notebook, and seamlessly switch between AMPL
and Python code to process and visualize the data from your optimization problem.

You can get the image either from docker hub:
    
    docker pull leotac/ampl-docker

or build it locally from the Dockerfile:

    docker build -t ampl-docker .

**Note**: AMPL is a commercial product, and `docker build` will automatically
download a (limited) demo version from http://ampl.com/.
If you want to use your own fully licensed copy of AMPL, you must 
provide the location of an archive containing the AMPL binary for linux as follows:
    
    docker build --build-args AMPL=ampl.tgz -t ampl-docker .

The archive must be within the Docker context, that is, in the subtree rooted in 
directory where you run the `docker build` command.
