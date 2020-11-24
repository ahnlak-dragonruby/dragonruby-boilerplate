#!/bin/sh
#
# This script will copy the runtime DragonRuby files from the provided folder;
# this is done so that you can easily switch between DragonRuby versions without
# emperiling your project!
#
# Copyright (c) 2020 Pete Favelle <dragonruby@ahnlak.com>
# This script is released under the MIT License, see LICENSE for details.

# Try and make sure we're running where we expect to be. There are limits to
# what you can do here, so we'll just make sure we have a mygame folder
if [ ! -d mygame ]
then
  echo "No mygame folder detected - please run this script from your project root"
  exit 1
fi

# Also make sure we've been given a folder to copy from
if [ -z $1 ]
then
  echo "usage: copy-dr.sh <DragonRuby Folder>"
  exit 2
fi

if [ ! -d $1 ]
then
  echo "DragonRuby folder \"$1\" does not exist"
  exit 3
fi

# Final check, that there is actually some DragonRuby there!
if [ ! -d $1/.dragonruby ]
then
  echo "Dragonruby folder \"$1\" does not appear to contain DragonRuby!"
  exit 4
fi

# Excellent; we can proceed. Nuke the .dragonruby directory, and copy the fresh one
if [ -d .dragonruby ]
then
  rm -r .dragonruby 
fi
cp -R $1/.dragonruby .

# And work through the individual files, too
DR_TARGETS="dragonruby dragonruby-bind dragonruby-httpd dragonruby-publish open-source-licenses.txt"
for fn in $DR_TARGETS
do
  # Remove it if it's here already
  if [ -f $fn ]
  then
    rm $fn
  fi

  # And copy it anew
  cp $1/$fn .
done