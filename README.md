# Dotfiles

## About this repo
Fully automated configuration using ansible.

### Goals of this repo
Provide fully automated development environment that is easy to set up and maintain.  
At this time, only Mac OS is supported, but the repo is set up so that it will be easy to support additional OS and linux distributions in the future.

### Why ansible ?
Ansible replicates what we would do to set up a development environment pretty well. There are many automation solutions out there - I happen to enjoy using Ansible.

## Requirements
### Mac OS
#### Homebrew
Homebrew is the standard Mac OS package manager. If you do not yet have is installed, simply run the following commands
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
(echo; echo 'eval "$/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### Pipx
Pipx is a python package manager, which we use it to install Ansible.
```
brew install pipx
pipx ensurepath
```

#### Ansible
Obviously, in an ansible-based dotfile managing solution, we need ansible.
To install ansible using pipx, simply run the following command: 
```
pipx install --include-deps ansible
```

### Ansible galaxy requirements
To install the ansible requirements for this package, simply run :
```
ansible-galaxy install -r requirements.yml
```

## Setup
### Variables
We store variables in the `@group_vars/all/` directory.  
Regular variables are located in `@group_vars/all/vars.yml`, and sensitive data is located in an encrypted `@group_vars/all/vault.yml` file.  
For the sake of readability, each sensitive variable is present, empty, in `vars.yml`, and has a counterpart set in `vault.yml` with the `vault_` prefix.  
When referencing an encrypted variable, always use the `vault_` prefixed key.

```
vars.yml
  git_user_name: Timothee Simon-Franza
  git_user_email: # This variable is empty because it is considered sensitive

vault.yml
  vault_git_user_email: someVeryCoolEmail@example.com
```

Use the `ansible-vault encrypt` and `ansible-vault decrypt` commands to encrypt and decrypt the vault file, be careful not to commit a decrypted vault file, though !  
To call the playbook, you can either input the password manually using the `--ask-vault-pass` flag, or store the password in a file **outside of the repo** and pass its path using the `--vault-password-file` option.


## Run the playbook
### Run the whole playbook
```
  ansible-playbook --vault-password-file <vault_password_file_path>  main.yml --ask-become-pass
```

### Run specific roles
You can specify tags to trigger specific roles if you wish to, using the `-t <tag>` option, like so :
```
  ansible-playbook --vault-password-file <vault_password_file_path> main.yml --ask-become-pass -t <role_tag>
```
