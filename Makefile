# Paths to each config file
SYSTEM_DIR 	:= $(HOME)
REPO_DIR := $(CURDIR)/config

BASHRC := .bashrc
KITTY_CONFIG := .config/kitty/kitty.conf
NEOFETCH_CONFIG := .config/neofetch/config.conf
STARSHIP_CONFIG := .config/starship.toml

.PHONY: get_conf apply_conf install-packages install-apply-conf

# Install necessary packages
install-packages:
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm kitty
	sudo pacman -S --noconfirm neofetch
	sudo pacman -S --noconfirm starship
	sudo pacman -S --noconfirm ttf-firacode-nerd

# Copy files from the system to the repo
get-conf:
	cp $(SYSTEM_DIR)/$(BASHRC) $(REPO_DIR)/$(notdir $(BASHRC))
	cp $(SYSTEM_DIR)/$(KITTY_CONFIG) $(REPO_DIR)/$(notdir $(KITTY_CONFIG))
	cp $(SYSTEM_DIR)/$(NEOFETCH_CONFIG) $(REPO_DIR)/$(notdir $(NEOFETCH_CONFIG))
	cp $(SYSTEM_DIR)/$(STARSHIP_CONFIG) $(REPO_DIR)/$(notdir $(STARSHIP_CONFIG))

# Compy files from the repo to the system
apply-conf:
	cp $(REPO_DIR)/$(notdir $(BASHRC)) $(SYSTEM_DIR)/$(BASHRC)
	cp $(REPO_DIR)/$(notdir $(KITTY_CONFIG)) $(SYSTEM_DIR)/$(KITTY_CONFIG)
	cp $(REPO_DIR)/$(notdir $(NEOFETCH_CONFIG)) $(SYSTEM_DIR)/$(NEOFETCH_CONFIG)
	cp $(REPO_DIR)/$(notdir $(STARSHIP_CONFIG)) $(SYSTEM_DIR)/$(STARSHIP_CONFIG)

install-apply-conf: install-packages apply_conf