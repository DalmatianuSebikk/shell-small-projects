#!/bin/bash

filesArray=( $( ls ) )
pwdString=$( pwd )
for file in ${filesArray[@]}; do
    dotIndex=$( expr index "$file" "." ) #finding the dot so I can get the termination of a file
    fileTermination=${file:dotIndex}
    
    if [ $dotIndex -eq 0 ]; then
        echo "This file doesn't have a termination. Checking if this is a folder.."

        if [ -d $file ]; then
            echo "$file is a folder. Skipping.."
        else
            if [ -d "no-term" ]; then
                # finalDirectoryString="${pwdString}/no-term/"
                mv $file './no-term/'
            else
                echo "Directory doesn't exist.. Creating.."
                mkdir no-term
                mv $file './no-term/'
            fi
        fi

    else

        if [ -d "${fileTermination}" ]; then 
            echo "Moving $file to $fileTermination folder.."
            mv $file "./$fileTermination/"
        else
            echo "Creating folder ${fileTermination}.."
            mkdir $fileTermination
            mv $file "./$fileTermination/"
        fi
    fi
done
