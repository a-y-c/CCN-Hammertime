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
#      Aliaser_Config has to be in the same folder 
#
#*******************************************************************


################
# SETUP 
mkdir -p ~/.CCN-Config

apath="$HOME/.CCN-Config/Aliaser_Config"
msg="Adding Aliaser Config File"

script_folder=`dirname ${BASH_SOURCE[0]}`

# Add Config File is Missing
if [ ! -e $apath ]; then
    echo $msg
    cp $script_folder/Aliaser_Config $apath
fi

if [  -e $apath ]; then
    # Varibles for Path
    msg="# Adding Alias Path to ./bash_profile"
    epath=". $apath"
    
    # Check if Path already in Bash_Profile
    if ! grep -q $apath  ~/.bash_profile; then
    
        # Add Path to Bash Profile
        echo $msg
        echo $msg >> ~/.bash_profile
        echo $epath
        echo $epath >> ~/.bash_profile
    
        # End Message
        echo "Please re-log in to see changes"
    fi
fi



################
# END 
