Possible alternative to `synouidmod`: ⚠️

Edit `/etc/passwd` and `/etc/group` manually and use `synouser --rebuild all` to synchronize. 

# Build synouidmod
This script uses Docker to build the [synouidmod](https://github.com/sunnyone/synouidmod) binary for your Synology DSM version and platform.

Depending on your hardware, it may take a while to complete. After the message "Available platforms" it may seem like the system hangs but it is not.

You can also check [here](https://github.com/technorabilia/build-synouidmod/tree/main/output) if a binary is already available. If so, you can use it and you don't have to compile it yourself.

For more information about the Synology Build Environment see the [Synology Developer Guide](https://help.synology.com/developer-guide).

# Findings for synouidmod ⚠️
* Before you start, read the [README](https://github.com/sunnyone/synouidmod#readme) of `synouidmod`
* Backup `/var/run/synosdk` before using `synouidmod`
* Changing a user with a `UID` less than or equal to `1024` is not recommended
* Using a `UID` less than or equal to `1024` is not recommended
* Binaries built for the `x86` architecture (e.g. Intel and AMD processors) can probably be used interchangeably.

# How to use
Git clone this repository.
```
git clone https://github.com/technorabilia/build-synouidmod.git
```
Check your DSM version and platform.
```
$ uname -a
Linux DS716 3.10.105 #25556 SMP Thu Mar 4 18:00:29 CST 2021 x86_64 GNU/Linux synology_braswell_716+
$ grep productversion /etc.defaults/VERSION
productversion="6.2.4"
$
```
In this case the version number is `6.2` and the platform is ```braswell```.

Change the `VERSION` and `PLATFORM` in `build.sh` appropriately.
```
VERSION=6.2
PLATFORM=braswell
```
Execute the build script.
```
. ./build.sh
```
After completion the `synouidmod` binary will be in the directory `./output`.

You can copy this file to the directory `/usr/local/sbin` on your Synology.

# Access the build environment
After the build, you can access the build environment with the following `docker run` command.
```
$ docker run -it --rm --name synobuild synobuild
root@397b92bfbecd:/toolkit/build_env/ds.braswell-6.2# ls
PkgVersion  boot  etc   lib    mnt  pkgscripts  root  sbin    srv  tmp  var
bin         dev   home  lib64  opt  proc        run   source  sys  usr
root@397b92bfbecd:/toolkit/build_env/ds.braswell-6.2# exit
exit
$
```
# Cleanup
Because the image can be quite large, you can also delete it if you no longer need it.
```
$ docker image ls synobuild
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
synobuild           latest              2568d28931d8        2 hours ago         7.93GB
$ docker image rm synobuild
Untagged: synobuild:latest
Deleted: sha256:2568d28931d86d6d4c23506b9bf0dba54ef62ca833197df7fa96b77443fe4bb8
$
```
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

# Acknowledgements
All credit goes to [sunnyone](https://github.com/sunnyone) for writing this handy utility.
