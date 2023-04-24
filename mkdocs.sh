#!/bin/bash


# Add files you want to exclude here, separated by a space
exclude_files=".DS_Store, "

for file in $exclude_files; do
    if [ -e "$file" ]; then
        echo "Excluding $file"
        git rm --cached "$file"
        git commit -m "Excluded $file"
    fi
done


mkdocs gh-deploy --config-file ../packetpath/mkdocs.yml --remote-branch main
