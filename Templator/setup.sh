#! /usr/bin/env bash

# FILENAME: setup.sh 
#********************************************************************
# DESCRIPTION:
#
# Sets up Templator Config File
#   
#
#
#********************************************************************
#
# AUTHOR: Andrew Cho  
# EMAIL: andrew.cho@engineering.ucla.edu
# DATE: 2014-04-14
#
#********************************************************************
#
# Dependencies:
#       
#
# Dependent By:
#       
#
#*******************************************************************


################
# SETUP 
mkdir -p ~/.CCN-Config

# Varibles
cpath="~/.CCN-Config/Templator_conf.cfg"
tpath="~/.CCN-Config/Templator_template.txt"
cmsg="Adding Templator Config File"
pmsg="Adding Templator Template File"

# Add Config File is Missing
if [ ! -e $cpth ]; then
    echo $cmsg
    cp Templator_conf.cfg $cpth
fi

# Add Template File is Missing
if [ ! -e $tpth ]; then
    echo $tmsg
    cp Templator_template.txt $cpth
fi

################
# END 
