#! /usr/bin/env python

# FILENAME: test.py 
#********************************************************************
# DESCRIPTION:
#
#   Creates an Index to be sorted by continous feed of input    
#       Probably a pretty crappy way of doing it but...
#   FIRST ENTRY = LOCATION TO SAVE!
#
#********************************************************************
#
# AUTHOR: Andrew Cho  
# EMAIL: andrew.cho@engineering.ucla.edu
# DATE: 2012-04-09
#
#********************************************************************
#
# Dependencies:
#       Tracker    
#
# Dependent By:
#       
#
#*******************************************************************


################
# Import Sugar Canes
import  pickle
import  sys
import  os


################
# CNode for Dictionary Tree
class CNode:
    data =  0
    name = ""
    index = {}

    def __init__(self, value, name):
    # initializes the data members
	self.index = {}
	self.data = value 
        self.name = name

   
################
# Parse String Structure
class Parse_String:

    #Root Element
    root = None
    
    # Initialize Tree
    def __init__(self):
    	self.root = CNode(0, "ROOT") 
    
    # Parses Path to Dictionary
    def addline(self, line, data):
        # Tracker
    	current = None

        # Parse Line Path into separated Modules
    	while ( line != "" ):
            # Separate Root Folder and Rest
    	    linePart = line.strip().partition("/")
            # If Root Folder
    	    if current == None:
    	    	current = self.insertLine(self.root, linePart[0], data)
            # Parse through the rest of the folders
    	    else:
    		current = self.insertLine(current, linePart[0], data)
            # Rest of the Line(Folders) to be parse
    	    line = linePart[2]
    
    # Inserts Data into Dictionary 
    def insertLine(self, current, word, data):
        # simple sanity check
    	if current == None:
    	    #Return ERROR
    	    raise NameError('No Root Current')
        # inserts a new data
    	else:
    	    # If Word in Index
    	    if current.index.has_key(word) :
    	    	current.data = current.data + data
    	    	return current.index[word]
    	    # If Not, Create new Node
    	    else:
    		current.data = current.data + data
    		current.index[word] = CNode(data, word)
    		return current.index[word] 
    
    
    # Save the Data in a Pickle File to be open later
    def savepickles(self, current, savefile):
        if not savefile:
            location = os.getcwd() + "/Tracker-Pickle.p"
        else:
            location = os.path.join(savefile, "Tracker-Pickle.p")
        # Save at the Location
        print location
        pickle.dump(current, open(location, "wb") )

    
    
    
    
##############
# MAIN

# Main Root Index
root_index = {}

# FUNCTION
def addword(word): 
	if (root_index.has_key(word)):
		root_index[word] =  root_index[word] + 1
	else:
		root_index[word] = 1 


# LOOP, Eliminate Redudancy
count = 0
savefile = ""
for line in sys.stdin:
    if count == 0:
        # Save Line as a save File
        savefile = line.strip()
        count = 1
    else:
        #ADD line
        addword(line)
    
# Run the Parsing Function
DaParser = Parse_String()
for item, num in root_index.items():
    #print item, num
    DaParser.addline(item, num)

# Save the Data
DaParser.savepickles(DaParser.root, savefile)
