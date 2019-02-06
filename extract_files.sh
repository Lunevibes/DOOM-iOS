#!/bin/bash

set -eu

EXE=`basename $0`

usage ()
{
  echo "Usage:"
  echo "  $EXE <doom ipa>"
}

die ()
{
  echo "ERROR: $1"
  usage
  exit 1
}

copyfile ()
{
  [ -e "$1" ] || echo "$1 does not exist."
  cp -r "$@"
}

[ $# -eq 1 ] || die "Wrong number of arguments."

[ "$1" != "*.ipa" ] || die "Please supply ipa file for DOOM IOS."

# Set inputfile
IPAFILE=$1

# Set tmpdir
MYTMPDIR=`mktemp -d`
MYPAYLOAD="$MYTMPDIR/Payload/Doom.app"

# Unzip IPA file to tmpdir
unzip "$IPAFILE" -d "$MYTMPDIR"


# This directory is required.
DIR="IB Images"
[ -d "$DIR" ] || mkdir -p "$DIR"

for FILE in AdvancedButton.png \
AdvancedButton_Highlighted.png \
BackButton.png \
BackButton_Highlighted.png \
Button.png \
Button_Highlighted.png \
DOOM_sigil_decal.png \
DifficultyBackground.png \
Divide.png \
DoomLogo.png \
DownArrow.png \
DownArrow_Highlighted.png \
Easy.png \
Episode1Background.png \
Episode1Background_Highlighted.png \
Episode2Background.png \
Episode2Background_Highlighted.png \
Episode3Background.png \
Episode3Background_Highlighted.png \
Episode4Background.png \
Episode4Background_Highlighted.png \
Hard.png \
LayoutDualButton.png \
LayoutDualButton_Highlighted.png \
LayoutSingleButton.png \
LayoutSingleButton_Highlighted.png \
LayoutWheelButton.png \
LayoutWheelButton_Highlighted.png \
MapOverlay.png \
Medium.png \
MenuBackground.png \
MissonBackground.png \
NextButton.png \
NextButton_Highlighted.png \
Nightmare.png \
ResumeButton.png \
SelectedBracket.png \
SettingsButton.png \
SettingsButton_Highlighted.png \
SliderSkull.png \
SliderSkull@2x.png \
SliderSkull~ipad.png \
SubMenuBackground.png \
SubMenuButton.png \
SubMenuButton_Highlighted.png \
UpArrow.png \
UpArrow_Highlighted.png
do
  copyfile "$MYPAYLOAD/$FILE" "$DIR"
done

DIR=base
[ -d "$DIR" ] || mkdir -p "$DIR"
for FILE in base.iPack \
doom.wad
do
  copyfile "$MYPAYLOAD/$FILE" "$DIR"
done

DIR=code/iphone
[ -d "$DIR" ] || mkdir -p "$DIR"

for FILE in DOOM_114.png \
DOOM_120.png \
DOOM_144.png \
DOOM_152.png \
DOOM_57.png \
DOOM_72.png \
DOOM_76.png \
Default-568h@2x.png \
Default-Landscape~ipad.png \
Default-Portrait~ipad.png \
Default.png \
Default@2x.png \
Default~ipad.png \
de.lproj \
en.lproj \
es.lproj \
fr.lproj \
it.lproj
do
  # Some of the FILEs are directories.
  copyfile "$MYPAYLOAD/$FILE" "$DIR"
done

DIR=.
[ -d "$DIR" ] || mkdir -p "$DIR"
copyfile "$MYPAYLOAD/idGinzaNar-Md2.otf" "$DIR"

echo "INFO: Successfully copied files from IPA."


