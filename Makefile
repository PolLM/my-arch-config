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
	@if [ -f /etc/arch-release ]; then \
		sudo pacman -Syu --noconfirm; \
		sudo pacman -S --noconfirm kitty neofetch ttf-firacode-nerd starship; \
	elif [ -f /etc/debian_version ]; then \
		sudo apt update && sudo apt upgrade -y; \
		sudo apt install -y kitty neofetch fonts-firacode starship; \
	else \
		echo "Unsupported OS"; \
		exit 1; \
	fi

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
