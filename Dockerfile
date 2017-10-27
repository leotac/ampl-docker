FROM ubuntu:16.04

RUN apt-get update \
	&& apt-get install -y \
		ca-certificates \
		curl \
		wget \
                vim \
                less \
                bzip2

#Install miniconda
RUN cd /tmp && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && chmod +x Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm Miniconda3-latest-Linux-x86_64.sh

#Install ampl and other solvers
ARG LOCAL_AMPL=ampl
COPY ${LOCAL_AMPL} /opt/ampl

#Add everything to path
ENV PATH /opt/miniconda3/bin:/opt/ampl:$PATH

#Install useful python modules 
RUN conda install ipython matplotlib pandas -y \
    && conda clean -a
    
RUN pip install ampl

WORKDIR /root

CMD ["bash"]
