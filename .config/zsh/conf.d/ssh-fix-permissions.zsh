#!/usr/bin/env zsh

local PERM_PRIVATE_KEY=600
local PERM_PUBLIC_KEY=644

# makes sure permissions in the ssh folder are right
# based on https://superuser.com/a/1559867
function ssh-fix-permissions() {
	local SSH_DIR="${1:-$HOME/.ssh}"
	typeset -A FILE_PERMISSIONS=(
		["$SSH_DIR/"]=700
		["$SSH_DIR/authorized_keys"]=600
		["$SSH_DIR/config"]=600
		["$SSH_DIR/known_hosts"]=644
		["$SSH_DIR/id_rsa"]=600
		["$SSH_DIR/id_ed25519"]=600
		["$SSH_DIR/id_rsa.pub"]=644
		["$SSH_DIR/id_ed25519.pub"]=644
	)
	echo "Fixing permissions on $SSH_DIR..."

	# fix base files
	# I purposefully avoid using/generating anything else than those files in the base dir
	# to make the next step easier
	for file perm in ${(kv)FILE_PERMISSIONS}; do
		[[ -f "$file" ]] || continue
		echo "chmod $perm $file"
		chmod "$perm" "$file"
	done
	
	# iterate through directories. this structure is assumed:
	# - a directory is a self contained "module"
	# - all files are at the root of said directory (subdirectories are ignored)
	# - has one or many 'foo.conf' ssh config files (auto included by '~/.ssh/config')
	# - rest of the files are ssh keys in either of those formats:
	# 	- public+private ssh key pair (foo.pub + foo)
	# 	- pem private key (foo.pem)
	for dir in "$SSH_DIR"/*/; do
		echo "chmod 700 $dir"
		chmod 700 "$dir"

		for file in "$dir"*; do
			if [[ "$file" == config ]]; then
				echo "chmod 600 $file"
				chmod 600 "$file"				
			elif [[ "$file" == *.pub ]]; then
				echo "chmod 644 $file"
				chmod 644 "$file"				
			else
				# assume it's a private key
				echo "chmod 600 $file"
				chmod 600 "$file"
			fi
		done
	done

	echo "Done!"
}

