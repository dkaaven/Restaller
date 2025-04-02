# Script folder
Each folder is a category, and every .sh file in the folders are install scripts.

install.sh uses these folders and shell files to make the menu.

Each category folder has a README.md, the first line is the description for the category.

## [script].sh requirements
Every script need this at the top of the file.

```
#!/bin/bash
# The tagline explaining the script

<Your code>
```

## Accessing config og assets
This snippet makes sure that relative path work both when using the install script and when running the script-file directly.
```
if [ -z "$ROOT_DIR" ]; then
    ROOT_DIR="../.."
fi

source $ROOT_DIR/config.sh                # Get config variables
source $ROOT_DIR/assets/functions.sh      # Get functions

```


## Check if file or folder exists
To avoid reinstalling when already installed.

### Check if file exists
```
if [ ! -e <file-path> ]; then
    # Do if file is missing
else
    # Do if file exists
fi
```
### Check if folder exists

```
if [ ! -d <file-path> ]; then
    # Do if file is missing
else
    # Do if file exists
fi
```
