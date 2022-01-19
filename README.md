# Steam Proton Assassins creed 2 deluxe and brotherhood deluxe helper scripts

# Version 2

Complete rewrite heres the main changes
1. Completely refactored much neater now
1. Menu allows selection of which game to install
1. Removed requirement for WGET uses curl which should be installed in most distros
1. Backgrounding the calls to steam client to make the terminal less chatty
1. Added fix to down load common re-distributables, see about.
1. Script now puts working files in /tmp dir


# About

These scripts help get Assassins creed 2 and brotherhood working with steam, fixes two things 

1. The CD key issue, the script will download and install a fixed appcache.vdf this uses the fixed files from [https://gist.github.com/pdfrod](https://gist.github.com/pdfrod) github (Thanks go to him!)
1. The second installs the common re-distributables that are required for the game to install correctly but are not included in the normal install, you might be luckly and have another game that has them, if so the script should skip over this step.

After running the scripts the game should work ok. **Note: helps to make sure steam is completely closed before you start.**

# Prerequisites

1. The games, Download either assassins creed 2 deluxe or assassins creed brotherhood deluxe from steam in the normal way.
2. I'm unsure about different paths to where you might have steam installed so you may need to update the paths if your steam is installed in a different location.

## How to install

1. Open terminal and clone the script to your machine, CD to the directory you want them to be installed to, the run the following command from the terminal

```
git clone https://github.com/smintman/assfix
```

2. Run the following command

```
bash assfix.sh
```

3. Follow the prompts on the screen, select 1) for assassins creed 2 and 2) for Assassins creed brotherhood.
  
Hopefully the game will just run normally from steam the next time you try it!? Happy Assassinations!
  
