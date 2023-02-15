# Mac Setup Process (for @dm)

This document covers setting up a brand new Mac out of the box.

## Initial setup

Complete Apple's macOS setup wizard (create local user account, sign-in to iCloud account).

Once on the macOS desktop, I do the following (in order):

  - **Sign in to App Store**
  - Clone mac-dev-playbook to the Mac: `git clone git@github.com:dm/mac-dev-playbook.git`
  - Drop `config.yml` from `config backups` to the playbook. My current copy at time of creation is [here](https://gist.github.com/dm/5d1a5cfada86bc51d919f5da8b4bc29a)
  - Run `make`

## Optional other make targets:
  
```
all                           By default install dependencies and run actual install

deps                          Installs Ansible dependencies

install                       Run main Ansible playbook

brew                          Install brew

dock                          Setup macos brew

dotfiles                      Setup dotfiles

iterm                         Setup iTerm2

mas                           Install items from Mac App Store

osx                           Setup osx custom stuff

shell                         Setup ZSH et al

ssh                           Setup .ssh and config

system                        Setup other system settings

sudoers                       Setup sudoers file

clean                         Cleanup make outputs

clean_deps                    Cleanup deps make output

help                          Prints this help text
```