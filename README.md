# Build synouidmod
This script uses Docker to build the [synouidmod](https://github.com/sunnyone/synouidmod) binary for your Synology DSM version and platform.

Depending on your hardware, it may take a while to complete. After the message "Available platforms" it may seem like the system hangs but it is not.

# How to use
Git clone this repository.
```
git clone https://github.com/technorabilia/build-synouidmod.git
```
Check your DSM version and platform.
````
$ uname -a
Linux DS716 3.10.105 #25556 SMP Thu Mar 4 18:00:29 CST 2021 x86_64 GNU/Linux synology_braswell_716+
$ grep productversion /etc.defaults/VERSION
productversion="6.2.4"
$
````
In this case the version number is ````6.2```` and the platform is ```braswell```.

Change the VERSION and PLATFORM in ````build.sh```` appropriately.
```
VERSION=6.2
PLATFORM=braswell
```
Execute the build script.
```
. ./build.sh
```
After completion the ````synouidmod```` binary will be in the directory ````./output````.

You can copy this file to the directory ````/usr/local/sbin```` on your Synology.

# Remarks
During the build the available platforms for the selected DSM version are listed.

At the time of writing the available platforms for DSM 6.2 are:
* 6281
* alpine
* alpine4k
* apollolake
* armada370
* armada375
* armada37xx
* armada38x
* armadaxp
* avoton
* braswell
* broadwell
* broadwellnk
* bromolow
* cedarview
* comcerto2k
* denverton
* dockerx64
* evansport
* geminilake
* grantley
* hi3535
* kvmx64
* monaco
* purley
* qoriq
* rtd1296
* v1000
* x64
