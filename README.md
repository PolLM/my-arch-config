# Terminal Configuration Setup

This repository contains my personal terminal configuration files and a `Makefile` to automate the setup process. It includes configurations for `bash`, `kitty`, `neofetch`, and `starship`.


## Setup Instructions

### 1. Install Necessary Packages

Use the `Makefile` to install all necessary packages:

```bash
make install-packages
```
### 2. Install Necessary Packages

Use the Makefile to install all necessary packages:

```bash
make install-packages
```

This command installs the following packages:

* Kitty (Terminal emulator)
* Neofetch (System information tool)
* Starship (Shell prompt)
* Fira Code Nerd Font (Necessary to use starship)

### 3. Apply the Configuration Files

To apply the configuration files to your system, run:

```bash
make apply-conf
```

This command will copy the configuration files from the repository to the appropriate locations on your system.
### 4. Retrieve Configuration Files from System

If you want to back up your current configuration files and store them in this repository, use:

```bash
make get-conf
```

This will copy the relevant configuration files from your system into the repository.
