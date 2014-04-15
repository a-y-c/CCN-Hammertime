#! /usr/bin/env bash

# FILENAME: setup.sh 
#********************************************************************
# DESCRIPTION:
#
# Sets up CCN-Hammertime Tools by creating a CCN-Config File Folder in
#   the User's Home Directory. Also Configures bash_profile to include the
#   path of CCN bin folder to make it executable.
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
#        CCN-Hammertime Folder
#   
#
#*******************************************************************


################
# SETUP 
echo "Beginning Setup of CCN-Hammertime Tools"

# Create CCN-Config Folder in HOME Directory
mkdir -p ~/.CCN-Config

# Find All Project Folders
folders=`find ../ -mindepth 1 -maxdepth 1 -type d`

# Loop Through each Folders
for project in $folders 
do
    # If Folder is Bin Folder (Do Nothing)
    if [ "$projects" == "bin" ]; then
        continue #Skip this iteration
    fi

    # Run Setup Script of Each Project (If exist)
    if [ -e "$projects/setup.sh" ]; then
        sh $projects/setup.sh
    fi
done


# Varibles for Path
cwd=`pwd`
msg="# Adding CCN-HammerTime Tools to Path"
epath="export PATH=$cwd:\$PATH"

# Check if Path already in Bash_Profile
if ! grep -q $epath "~/.bash_profile"; then

    # Add Path to Bash Profile
    echo $msg
    echo $msg >> ~/.bash_profile
    echo $epath

    # End Message
    echo "Please re-log in to see changes"
fi

################
# END 
echo "All Done."
