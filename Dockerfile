FROM ubuntu:16.04
LABEL maintainer="leonardo.taccari@gmail.com"

# Install utils
RUN apt-get update \
	&& apt-get install -y \
		ca-certificates \
		curl \
		wget \
                vim \
                less \
                bzip2 \
                git \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# AMPL location (default: freely available demo version)
ARG AMPL=http://ampl.com/demo/ampl.linux64.tgz

# If $AMPL is a local compressed file, it will be automatically
# uncompressed into /opt by the ADD command.
# The script find_ampl.sh tries to ensure that /opt/ampl
# will point to a directory containing the ampl binaries.
ADD ${AMPL} /opt
ADD scripts /opt/scripts
RUN /opt/scripts/find_ampl.sh 

# Install miniconda, iampl and other useful python modules
RUN cd /tmp && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && chmod +x Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm Miniconda3-latest-Linux-x86_64.sh \
    && /opt/miniconda3/bin/conda install jupyter ipython matplotlib pandas -y \
    && /opt/miniconda3/bin/conda clean --all -y \
    && /opt/miniconda3/bin/pip install git+https://github.com/vitaut/iampl 

# Add ampl and conda/python to the path
ENV PATH /opt/miniconda3/bin:/opt/ampl:$PATH

WORKDIR /root
CMD ["bash"]
