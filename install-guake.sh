#!/bin/sh

set -e

sudo apt-get install -y guake

dconf load /apps/guake/ < guake.dconf
