#!/bin/bash

# Signs packages with Stefanini Dev certificate
# How to use: Place pkg within the '/Users/YOUR HOME FOLDER/Packages' folder, run the script; sh /THIS/SCRIPT/LOCATION, signed packages will appear in /Users/YOUR NAME/Packages/Signed Packages
# Author: Zachary 'Woz'nicki
date="4/19/24"
version=1.0

# Variables
currentUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
certName="Developer ID Installer: Stefanini, Inc. (K682865NGQ)"
inputPath="/Users/$currentUser/Packages"
outputPath="/Users/$currentUser/Packages/Signed Packages"

# Functions
createDirectory(){
    echo "START-UP: Creating Directories..."
    mkdir /Users/"$currentUser"/Packages > /dev/null 2>&1
    mkdir "/Users/$currentUser/Packages/Signed Packages" > /dev/null 2>&1
}

signPackages(){
    array=( $( ls "$inputPath"/*.pkg | sed -r 's/^.+\///') )
    #echo "Array: ${array[@]}"
    if [[ -z "${array[@]}" ]]; then
        echo "No pkgs exist! Exiting..."
        exit 1
    fi

    for i in "${array[@]}"; do
        echo "Signing package: $i..."
        /usr/bin/productsign --sign "$certName" "$inputPath/$i" "$outputPath/$i" > /dev/null 2>&1
            if [ $? -eq 1 ]; then
                echo "ERROR signing package!"
            else
                echo "$i SIGNED!"
            fi
    done
}

# Main
echo "Script version: $version ($date)"

createDirectory
signPackages
exit 0
