FROM centos:7
MAINTAINER Maksimov Konstantin <kmaksimovv@gmail.com>
RUN yum -y update
RUN yum -y install vim tar
RUN yum -y install gcc gcc-c++ make wget subversion \ 
            libxml2-devel ncurses-devel openssl-devel \ 
            sqlite-devel libuuid-devel vim-enhanced \ 
            jansson-devel unixODBC unixODBC-devel libtool-ltdl \ 
            libtool-ltdl-devel subversion speex-devel mysql-devel
WORKDIR /usr/src
RUN wget https://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-13.29.2.tar.gz
RUN tar -zxvf asterisk-13.29.2.tar.gz
WORKDIR /usr/src/asterisk-13.29.2/
RUN ./configure
RUN make
RUN make install
RUN make samples
RUN make config
WORKDIR /root
CMD ["/usr/sbin/asterisk", "-f"]
