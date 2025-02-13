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

# Automount


# SSHFS Auto-Mount on macOS Using `autofs`

This guide explains how to automatically mount an SSHFS drive on macOS using `autofs`. This method ensures the remote filesystem is only mounted when accessed, making it more efficient than running SSHFS persistently in the background.

---

## **1. Enable Automount in `/etc/auto_master`**

1. Open the auto-mount configuration file:
   ```bash
   sudo nano /etc/auto_master
   ```
2. Add the following line at the bottom:
   ```
   /mnt    auto_sshfs
   ```
3. Save and exit (press `CTRL + X`, then `Y`, then `ENTER`).

---

## **2. Create the `auto_sshfs` Configuration File**

1. Open or create the `/etc/auto_sshfs` file:
   ```bash
   sudo nano /etc/auto_sshfs
   ```
2. Add the following line:
   ```
   mydrive -fstype=fusefs,allow_other,defer_permissions,volname=MyDrive,reconnect :sshfs#ds:/mnt/mydrive
   ```
   - `mydrive` → The mount name (will be available at `/mnt/mydrive`).
   - `fusefs` → Uses FUSE for SSHFS.
   - `allow_other` → Allows other users to access the mount.
   - `defer_permissions` → Ensures correct permission handling.
   - `volname=MyDrive` → Sets the drive name in Finder.
   - `reconnect` → Automatically reconnects if disconnected.
   - `ds:/mnt/mydrive` → Uses the SSH alias `ds` from `~/.ssh/config`.

3. Save and exit (`CTRL + X`, then `Y`, then `ENTER`).

4. Set the correct permissions:
   ```bash
   sudo chmod 644 /etc/auto_sshfs
   ```

---

## **3. Restart `autofs` to Apply Changes**

Run the following command to reload the automount configuration:
```bash
sudo automount -vc
```

This will automatically mount `ds:/mnt/mydrive` when you access `/mnt/mydrive`.

---

## **4. Verify the Mount**

1. Access the mounted directory:
   ```bash
   ls /mnt/mydrive
   ```
2. If you see files from the remote system, the setup is working!

---

## **5. (Optional) Unmounting the Drive**

To manually unmount the SSHFS mount:
```bash
sudo umount /mnt/mydrive
```

---


