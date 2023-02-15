.DEFAULT_GOAL := all
.PHONY: help
.SILENT:


## By default install dependencies and run actual install
all: deps install

## Installs Ansible dependencies
deps:
	ansible-galaxy install -f -r requirements.yml
	touch deps

## Run main Ansible playbook
install:
	ansible-playbook main.yml --ask-become-pass --tags "always,homebrew,mas,dock,dotfiles,system,sudoers,osx,iterm,ssh,shell"
	touch install


# Specific installs:

## Install brew
brew:
	ansible-playbook main.yml --ask-become-pass --tags "always,homebrew"
	touch brew

## Setup macos brew
dock:
	ansible-playbook main.yml --ask-become-pass --tags "always,dock"
	touch dock

## Setup dotfiles
dotfiles:
	ansible-playbook main.yml --tags "always,dotfiles"
	touch dotfiles

## Setup iTerm2
iterm:
	ansible-playbook main.yml --tags "always,iterm"
	touch iterm

## Install items from Mac App Store
mas:
	ansible-playbook main.yml --ask-become-pass --tags "always,mas"
	touch mas

## Setup osx custom stuff
osx:
	ansible-playbook main.yml --ask-become-pass --tags "always,osx"
	touch osx

## Setup ZSH et al
shell:
	ansible-playbook main.yml --ask-become-pass --tags "always,shell"
	touch shell

## Setup .ssh and config
ssh:
	ansible-playbook main.yml --ask-become-pass --tags "always,ssh"
	touch ssh

## Setup other system settings
system:
	ansible-playbook main.yml --ask-become-pass --tags "always,system"
	touch system

## Setup sudoers file
sudoers:
	ansible-playbook main.yml --ask-become-pass --tags "always,sudoers"
	touch sudoers


## Cleanup make outputs
clean:
	rm -rf install brew dock dotfiles iterm mas osx shell ssh system sudoers

## Cleanup deps make output
clean_deps:
	rm -rf deps


# Helpers below

# Help
## Prints this help text
help:
	@awk -v skip=1 \
		'/^##/ { sub(/^[#[:blank:]]*/, "", $$0); doc_h=$$0; doc=""; skip=0; next } \
		 skip  { next } \
		 /^#/  { doc=doc "\n" substr($$0, 2); next } \
		 /:/   { sub(/:.*/, "", $$0); printf "\033[34m%-30s\033[0m\033[1m%s\033[0m %s\n\n", $$0, doc_h, doc; skip=1 }' \
		$(MAKEFILE_LIST)