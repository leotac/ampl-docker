# AMPL + Jupyter Notebook docker image

A simple, Ubuntu-based docker image, with [AMPL](http://ampl.com/)
and a bunch of useful python modules to run AMPL inside a Jupyter notebook.

It includes [iampl](https://github.com/vitaut/iampl),
an AMPL kernel for [Jupyter](http://jupyter.org/), so that you can run AMPL code 
inside a Jupyter notebook, and seamlessly switch between AMPL
and Python code to process and visualize the data from your optimization problem.

You can get the image either from docker hub:
    
    docker pull leotac/ampl-nb

or build it locally from the Dockerfile:

    docker build -t ampl-nb .

**Note**: AMPL is a commercial product, and `docker build` will automatically
download a (limited) demo version from http://ampl.com/.
If you want to use your own fully licensed copy of AMPL, you must 
provide the location of an archive containing the AMPL binary for linux as follows:
    
    docker build --build-args AMPL=ampl.tgz -t ampl-nb .

The archive must be within the Docker context, that is, in the subtree rooted in 
the directory where you run the `docker build` command.

