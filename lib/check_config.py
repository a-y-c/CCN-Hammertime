#! /usr/bin/env python

# FILENAME: check_config.py 
#********************************************************************
# DESCRIPTION:
#
# Provides Check Config Functions (locations)
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
#       CCN-HammerTime
#   
#
#*******************************************************************

##############
# Import Oranges
import os
import sys


##############
# def Set File Name 
def return_config_location(filename, realpath):

    # Current Working Directory
    cwd_path = os.getcwd()
    cwd_config = os.path.join(cwd_path, filename)

    # Home Config Location
    home_path = os.getenv("HOME")
    home_config = os.path.join(home_path,'.CCN-Config', filename)

    # Current Config Location
    folder_config = os.path.join(realpath, filename)

    # Check if Config is Valid
    if (os.path.isfile(cwd_config)):
        print 'Config = CWD'
        # If Config is in Current Workgin Directory
        ConfigPath = cwd_config
    elif (os.path.isfile(home_config)):
        print 'Config = Home'
        # If Config is in Home Config Directory
        ConfigPath = home_config
    elif (os.path.isfile(folder_config)):
        print 'Config = Executable'
        # If Standard Config is in Executable Directory
        ConfigPath = folder_config
    else:
        # Missing Config File
        print 'Missing Config File!'
        sys.exit(1)

    return ConfigPath    


##############
# def Set File Name 
def check_config_location():

    # Home Config Location
    home_config = '~/.CCN-Config' + filename

    # Check if Config is Valid
    if (os.path.isfile(home_config)):
        # If Config is in Home Config Directory
        print "Config Folder found in ~/.CCN-Config"
    else:
        print "Config Folder NOT found in ~/.CCN-Config"
    
    return
   

################
# MAIN 
def main():
    print "Configuration File Location"

    # run checker
    check_config_location()

################
# END 
if __name__ == "__main__":
    main()
