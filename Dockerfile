################################################################################
#                                                                              #
#                                 {o,o}                                        #
#                                 |)__)                                        #
#                                 -"-"-                                        #
#                                                                              #
################################################################################
#
#
#
#################################---FROM---#####################################

FROM ubuntu:22.04

################################################################################

#################################---INFO---#####################################

MAINTAINER Lovrenc Avsenek <a.lovrenc@gmail.com>

################################################################################

#################################---ENV---######################################

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

################################################################################

################################---BUILD---#####################################

RUN apt-get update; \
    echo "tzdata tzdata/Areas select Europe \
tzdata tzdata/Zones/Europe select Ljubljana" > /opt/tzdefault; \
    debconf-set-selections /opt/tzdefault; \
    apt upgrade --yes; \
    apt install --yes \
        curl \
        gcc \
        g++ \
        make \
        apt-utils \
        git; \
    apt-get clean
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt update; \
    apt install --yes nodejs;
RUN npm install --global \
        gulpjs/gulp-cli \
        webpack \
        webpack-cli;

################################################################################
