#!/bin/bash

# Define the paths to the MkDocs site directory and the second repository
MKDOCS_SITE_DIR=/packetpath/site
SECOND_REPO_DIR=./

# Switch to the gh-pages branch of the second repository
cd $SECOND_REPO_DIR
git checkout main

git ls-files | grep -v '.git' | grep -v '.gitignore' | grep -v 'README.md' | grep -v 'mkdocs.sh' | xargs git rm -rf

# Copy the contents of the MkDocs site directory to the gh-pages branch
cp -r $MKDOCS_SITE_DIR/* .

# Commit the changes and push them to the main branch
git add .
git commit -m "Update MkDocs site"
git push origin main

# Switch back to the codebase branch of the second repository
git checkout codebase

