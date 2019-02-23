#!/bin/bash

if [ "$ANDROID_BUILD_TOP" != "$(pwd)" -a -d $(pwd)/.repo/local_manifests ] ; then 
	export ANDROID_BUILD_TOP=$(pwd)
fi

if [ -z $ANDROID_BUILD_TOP ] ; then
	echo Appears to not be in the Android Build root directory.  Exiting...
	exit
fi

set -e

# Sample script to cherry pick patches for a device.
# Intent is to require no interaction.  Options include:

repopick 1234

cd $ANDROID_BUILD_TOP/frameworks/base
git revert --no-edit 65711b2891f0a6f3630a5a8e640496a658c8aab5

cd $ANDROID_BUILD_TOP/system/core
git apply $ANDROID_BUILD_TOP/.repo/local-manifest-helper/patches/core-disable_selinux.patch
git add .
git commit -m "Temp"

cd $ANDROID_BUILD_TOP/device/lge/hammerhead
git fetch https://github.com/LineageOS/android_kernel_lge_hammerhead refs/changes/27/226327/1 && git cherry-pick FETCH_HEAD

# End of cherry-picking examples.

cd $ANDROID_BUILD_TOP

set +e
