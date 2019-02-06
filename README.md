#  DOOM, DOOM II and Final DOOM for iOS 11+

This clean update aims Schnapple (tomkidd) 64bit DOOM to be compiled and archived on earlier Xcode version (tested on Xcode 8). My fork doesn't support tvOS, for that please visit [his](https://github.com/tomkidd/DOOM-iOS)

To be compiled, the build requires some copyrighted file you can provide from the original app: you can purchase / download it using this (old) version of [iTunes](https://support.apple.com/en-us/HT208079)

#  Build Instructions
- Copy your DOOM 2.7.ipa in the main folder where `extract_files.sh` script is located
- Open your terminal and move to that folder
- Run `./extract_files.sh DOOM\ 2.7.ipa`. This will also add `doom.wad` in `base` folder to build DOOM-iOS target. To build other targets you have to copy your `doom2.wad`, `plutonia.wad` and `tnt.wad` in the same folder. 
- Open `DOOM.xcworkspace`
- Select a DOOM-iOS target and tick `Automatically manage signing` in General tab
- Click `Enable Automatic` and add your account (Apple ID)
- You can change `Generic iOS Device` in the top and then press Play button to directly compile the build on your device (or simulator), otherwise: Product -> Archive will build an .xcarchive file. Once done, click `Show in Finder` -> `Show Package Content` then Products -> Applications and copy your .app file wherever you want to. You can install it on your device connecting it, then Xcode -> Window -> Devices, select your device and click `+` button.
Note: If Xcode says `Could not attach to pid..` just click Play button again,
Enjoy!


`Minor bugs:`
- Noise on background music needs to be removed / reduced
- iPad interface builder .xib need to be fixed to work well on all iPads

For any info or question just PM me here or at lunev@live.it
