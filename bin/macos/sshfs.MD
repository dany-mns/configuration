# Requirements

0. [Install Brew if you don't have it](https://brew.sh/)

1. Install [MacFuse ](https://osxfuse.github.io/) - This will require you allow kernel extensions and such. For the build to work, we need libraries this also installs and for the binary to work at all obviously.

2. Install XCode (Maybe if Command Line tools for xcode are not present, brew should install them - but leaving in just in case)

3. `brew install meson ninja glib pkgconfig coreutils` - These packages are required for either the build itself, or ninja

4. Clone this repo

Option 1. 

Do it yourself

1. After cloning the repo, go to it's root folder, cd to sshfs-2.10. 
2. Run the following commands
   * `mkdir _build;cd _build`
   * `meson ..` (if rerunning, `meson .. --reconfigure`)
   * Run `ninja` to compile it, and run the tests. If all should be good, there should be an `sshfs` binary in the _build directory.
   * While this isn't distributable (as in, you cant use it on other macs), this can be used on your system without issue. You can move/copy it to an file on your $PATH to use it as such. Simply using basic alias can be a good option too. 
   * Rebuilding - you may need to delete the sshfs binary, and run meson with reconfigure option. Than run `ninja`. If this doesn't work, just remove the _build folder and retry from the start.
