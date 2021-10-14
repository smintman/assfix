# Assassins creed 2 deluxe and botherhood deluxe helper scripts

# About

These scripts help get Assassins creed 2 and brotherhood working with steam, fixes two things 

1. The CD key issue, the script will download and install a fixed appcache.vdf this uses the fixed files from @pdfrod github (Thanks go to him!)
1. The second fix downloads an updated version of the ubisoft connect client and installs this into the proton prefix.
1. Also creates a symbolic link from the games downloaded installation to to the proton prefix. As something is failing in the existing set up to find the game?

After running the scripts the game should work ok. Note: helps to make sure steam is completely closed before you start.

# Prerequisites

1. The games
2. wget needs to be installed
3. The scrips assume you are using proton 6.3 versions, update the script if you want to use a different version (I may make this selectable in the future)

# How to use the scripts

4. Download either assassins creed 2 deluxe or assassins creed brotherhood deluxe from steam in the normal way.

5. Clone the script to your machine, CD to the directory you want them to be installed to, the run the following command from the terminal

```
git clone https://github.com/smintman/assfix
```
## Part 1 the CD key fix..

1. CD into the assfix directory and run the following to give the scripts execute permissons

```
chmod +x assfix-ass2-cdkey.sh assfix-ass2-uplay.sh assfix-assbro-cdkey.sh assfix-assbro-uplay.sh
```

2. Run the cdkey.sh script for the game you want to fix e.g for assassins creed 2..

```
./assfix-ass2-cdkey.sh
```
This will download the cd key fix and copy to the right place then tell steam to run assassins creed 2. Note this will fail with the following error below **this is to be expected. We need to have the game run once to create the prefix for it.**

> Unable to find the Ubisoft Game launcher. Please re-install Assassins creed <whatever>
> Ubisoft Game launcher:
> Error code 1.

8. Quit steam completely i.e make sure it does not appear in any system tray.
  
## Part 2 the uplay fix
  
1. Run the second script 
  
  ```
  ./assfix-ass2-uplay.sh
  ```

  This will download ubisoftconnect from their site, and install into the prefix for the game silently.
  
2. Once complete the script will try and open the game in steam again, Hopefully you should see the uplay screens, follow the set up from there as usual.. and with any luck the game will start.
  
  Hopefully the game will just run normally from steam the next time you try it!? Happy Assassinations!
  
