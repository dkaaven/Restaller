```
   ____           _        _ _           
  |  _ \ ___  ___| |_ __ _| | | ___ _ __ 
  | |_) / _ \/ __| __/ _` | | |/ _ \ '__|
  |  _ <  __/\__ \ || (_| | | |  __/ |   
  |_| \_\___||___/\__\__,_|_|_|\___|_|   

         Shell Script Installer
       -------------------------
            By Daniel Kåven
               @dkaaven
       -------------------------
```


# Restaller - Simplifying reinstallation

This script will help you set up the system the first time. It uses my preferred settings and plugins. 

## About the project

This is a project I use while distro-hopping, testing new tools and learning shell-scripting at the same time.
The code is built in stages and revisited to improve previous scripts with new things I learn along the way.

I do try to comment the code as much as I see relevant.

## Lisence
[GNU GPLv3](LICENSE)

⚠️ No warranty, use at your own risk. ⚠️ 
Even though I try to make it work as smooth as possible, please read the [script-files](scripts/README.md) before running the script.


# Install instructions
## Requirements
* Ubuntu-based distro
* Bash


## How to run
```
git clone https://github.com/dkaaven/restaller
cd restaller
bash install.sh

```

# Documentation



## Content
| Folder | File | Description |
|---|---|---|
| .config| / | Standard config files |
| assets | / | Config template files |
| assets | [functions.sh](assets/functions.sh) | Functions used in other scripts.  |
| scripts | / | All my install scripts |
| / | [install.sh](install.sh) | Shows a list of all install scripts and let you run them. |
| / | [config.sh.temp](config.sh.temp) | A template for the config file |

## Tested on
* [Pop!_OS](https://system76.com/pop/)

# Project plans


## TO DO
- [ ] Support more distros
- [ ] Support more shells
- [ ] A function to install based on distro
- [ ] A function to add shells

# Author
**Daniel Kåven** - [@dkaaven](https://github.com/dkaaven)
I use AI to help me learn shell-script, but the code is planned and written by me.