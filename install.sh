#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -d $HOME/.oh-my-zsh ]; then
	echo "oh-my-zsh already installed. skipping."
else
	$DIR/install-oh-my-zsh.sh
fi

function ensure_mount_point_exists {	
	src=$1
	mountpoint=$2
	[ -e "$mountpoint" ] && return
	if [ -d "$src" ]; then
		sudo mkdir "$mountpoint"
	else
		sudo touch "$mountpoint"
	fi
}

function add_to_fstab {
	src=$1
	mountpoint=$2
	grep -q "$src" /etc/fstab || echo "$src $mountpoint none defaults,bind 0 0" | sudo tee -a /etc/fstab > /dev/null
}

for f in $DIR/.[!.]*; do
	if [[ "$f" == "$DIR/.git"* ]]; then
		echo "Skipping $f"
		continue
	fi
	mountpoint="$(realpath ~/$(basename $f))"
	echo "Installing $f to $mountpoint"
	ensure_mount_point_exists $f $mountpoint
	add_to_fstab $f $mountpoint
done
