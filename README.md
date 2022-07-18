# Horsie's Viewmodel Editor
A powerful viewmodel editor for Team Fortress 2
## Features

- Edit your viewmodels however you want. Includes many possible settings for every weapon
- Automatic preloading. Preloads the animations at game start without you having to do anything. Can optionally be disabled in the menu
- Fully supports the [Fixed Viewmodels](https://gamebanana.com/mods/206440) pack. All credits for creating the pack go to the author. This fixes hundreds of default animations, such as the extra hands when using the original or sapper
- Everything is automatic, just pick your settings and the tool will extract, decompile, edit, compile and pack the animations

## List of some per-weapon settings:
- Change position on X, Y and Z axis
- Change rotation on X, Y and Z axis
- Hide
- Hide but keep chosen animations visible, such as: draw animations, reload animations, idle animations, attack animation, and many more depending on class and weapon
- Make any animations static. This makes them not move and look like the idle animation. Some examples: the draw animations, the reload animations, the attack animations, the idle animations(makes them more static) and more depending on class and weapon
- Other class or weapon specific settings

## Instructions:
- Download it and place the main folder in your game's "custom" folder or "tf" folder. I suggest the "tf" folder.
- Edit the class-specific settings files however you wish. I suggest using something other than standard notepad
- Launch GENERATE.bat
- Check [this](https://developer.valvesoftware.com/wiki/$origin) for more info on how positioning works. More detailed info to be added in the future

## Installing Fixed Viewmodels (highly recommended):
- Download the Fixed Viewmodels mod from [here](https://gamebanana.com/dl/469246) (direct link)
- Extract the main vpk in "fixed viewmodels addon"
- Done, the tool will automatically install it next time you run GENERATE.bat
