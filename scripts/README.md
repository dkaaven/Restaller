# Script folder
install.sh will list every file in this folder and display the second line as a tag.

## Filename structure
The category - software will be implemented later when more scripts are added.
To future-proof use this naming convention: 
{category}-{software}.sh


## script.sh requirements
Every script need this at the top of the file.

```
#!/bin/bash
# The tagline explaining the script

<Your code>
```

## Accessing config and functions
When making a new script, here are some useful snippets.
```
source ../config.sh                # Get config variables
source ../assets/functions.sh      # Get functions
```

## Check if file or folder exists
To avoid reinstalling when already installed, check if file exists.

```
if [ ! -e <file-path> ]; then
    # Do if file is missing
else
    # Do if file exists
fi
```
