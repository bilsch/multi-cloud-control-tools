#!/bin/bash

cd bin
for file in *
do
    test -h ~/bin/$file
    if [[ $? -ne 0 ]];
    then
        ln -s $(pwd)/$file ~/bin
    fi
done