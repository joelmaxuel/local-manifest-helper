## Local Manifest Helper

A git repository to place in the .repo/ directory for your ROM.

This simplifies projects needed (and their cherry picks if needed) for maintained devices across build machines, or for a Jenkins install.

To set up, clone the respective branch (make a branch for each ROM and version you intend to work on - use the files in `sample-branch` as a starting point) into .repo - then in the future instead of a repo sync, you will run the master update script (`.repo/local-manifest-helper/reposync`) instead.

Finally, basic scripts (or samples of) to compile are also found in the master branch.  Clone to a temporary area once to copy the files to your path.


Joel Maxuel
2018, 2019
