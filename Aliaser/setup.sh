#! /usr/bin/env bash

# FILENAME: setup.sh 
#********************************************************************
# DESCRIPTION:
#
# Sets up Aliaser Config File
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

apath="~/.CCN-Config/Aliaser_Config"
msg="Adding Aliaser Config File"

# Add Config File is Missing
if [ ! -e $apth ]; then
    echo $msg
    cp Aliaser_Config $apth
fi


################
# END 
