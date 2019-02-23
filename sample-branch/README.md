## Local Manifest Helper
### Sample Branch

The structure in this directory deserves its own branch (not to remain in subfolder). The clone that branch to the .repo/local-manifest-helper directory for your ROM source tree.

Based on if the branch (and equipment it is used on) is shared by others, you may want to protect the branch to avoid allowing any rebases (to not allow covering of tracks).

Then to semi-automate with Jenkins, provide the following setup (or remix for your own purposes):

Add the following parameters:

String - Name: "Device"
Choice - Name: "Sync"

* Only Sync
* With Cherrypicks
* Neither

Choice - Name: "Type"

* user
* userdebug
* eng

Boolean - Name: "Dirty" (default false)

Then for the build, include the following shell code:
(Replace `ROM-version` with your own tree name)

```bash

#!/bin/bash

cd ~/ROM-version/

if [ "$Sync" != "Neither" ] ; then
	.repo/local-manifest-helper/reposync
	if [ "$Sync" = "With Cherrypicks" ] ; then
		. envsetup-ROM-version
		. .repo/local-manifest-helper/$Device-cherry.sh
	fi
fi

if [ "$Dirty" == "true" ] ; then
	build-ROM-version $Device $Type dirty
else
	build-ROM-version $Device $Type
fi

```

Ensure appropriate copies of `*-ROM-version` scripts are copied from the master branch (samples in `bin/` plus their dependencies) into your own `bin/` directory.
