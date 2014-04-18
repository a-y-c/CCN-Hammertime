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
cmsg="Adding Templator Config File"
cpath="$HOME/.CCN-Config/Templator_Conf.cfg"
tmsg="Adding Templator Template File"
tpath="$HOME/.CCN-Config/Templator_Template.txt"

script_folder=`dirname ${BASH_SOURCE[0]}`

# Add Config File is Missing
if [ ! -e $cpath ]; then
    echo $cmsg
    cp $script_folder/Templator_Conf.cfg $cpath
fi

# Add Template File is Missing
if [ ! -e $tpath ]; then
    echo $tmsg
    cp $script_folder/Templator_Template.txt $tpath
fi

################
# END 
