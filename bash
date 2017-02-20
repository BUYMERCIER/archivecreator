#!/usr/bin/env bash

# Get out of Setup Directory
cd ..

# Clear the console
clear

echo "*************** TP Setup 1.0 ***************"

# Enter
echo "Type the name of the TP you whant to submit:"
read tp
cd $tp

# Check if directory exists
if [ -d "$tp" ]; then

    # Setting up AUTHORS
    echo "* antoine.dray" > AUTHORS

    # Setting up README
    echo "Dear users," > README
    nano README

    # Remove all useless folders
    for f in *; do
        if [ -d ${f} ]; then
    	     rm -r $f/$f/bin
           rm -r $f/$f/obj
           rm $f/*.userprefs
        fi
    done

    cd ..

    echo "Enter the name of the main folder:"
    read main
    cp -r $tp $main

    echo "Enter the name of the zip:"
    read zipname
    zip -r $zipname.zip $main

    rm -r $main

    mv $zipname.zip ~/Desktop

fi
