FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu16.04

# common 
RUN apt-get update && \
    apt-get install -y apt-utils \
    	    	       git

# japanese
RUN apt-get update && \
    apt-get install -y language-pack-ja-base \
    	    	       language-pack-ja
ENV LANG ja_JP.UTF-8

# emacs
RUN apt-get update && \
    apt-get install -y emacs24-nox \
		       emacs24-el \
		       emacs-mozc \
		       emacs-mozc-bin
# anaconda
RUN apt-get update && \
    apt-get install -y wget \
    	    	       bzip2 \
		       libglib2.0-0 \
		       libxext6 \
		       libsm6 \
		       libxrender1 \
       		       libgl1-mesa-dev && \
    wget http://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh && \
    bash Anaconda3-5.0.1-Linux-x86_64.sh -b -p /usr/local/bin/anaconda3 && \
    rm Anaconda3-5.0.1-Linux-x86_64.sh

ENV PATH $PATH:/usr/local/bin/anaconda3/bin

# pyopengl and opencv
RUN apt-get update && \
    apt-get install -y freeglut3-dev \
 		       gcc && \
    /usr/local/bin/anaconda3/bin/pip install PyOpenGL \
    				     	     PyOpenGL_accelerate \
					     opencv-python
ENV QT_X11_NO_MITSHM 1

# pycharm
RUN wget https://download.jetbrains.com/python/pycharm-community-2017.3.3.tar.gz && \
    tar xvfz pycharm-community-2017.3.3.tar.gz --directory /opt && \
    rm pycharm-community-2017.3.3.tar.gz && \
    apt-get update && \
    apt-get install -y libxtst6 fonts-takao

# x window
ARG uid=1000
ARG gid=1000
ARG user=murakami
ARG group=murakami
RUN apt-get update && \
    apt-get install -y sudo && \
    groupadd -g ${gid} ${group} && \
#    useradd -u ${uid} -g ${gid} -r ${user}
    useradd -u ${uid} -g ${gid} -r ${user} -G sudo && \
    echo 'murakami:murakami' | chpasswd
    
CMD /bin/bash
#CMD /opt/pycharm-community-2017.3.3/bin/pycharm.sh