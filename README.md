# Horsie's Viewmodel Editor
A powerful viewmodel editor for Team Fortress 2
![Thumbnail](https://i.imgur.com/JH5boq4.png)
## Features

- Edit your viewmodels however you want. Includes many possible settings for every weapon
- Automatic preloading. Preloads the animations at game start without you having to do anything. Preloading allows you to use these in any server, no matter the sv_pure setting. Can optionally be disabled in the menu
- Fully supports the [Fixed Viewmodels](https://gamebanana.com/mods/206440) pack. All credits for creating the pack go to the author. This fixes hundreds of default animations, such as the extra hands when using the original or sapper
- Supports custom viewmodel animation mods. Automatically checks if they're compatible and applies your own settings to them. More details below
- Everything is automatic, just pick your settings and the tool will extract, decompile, edit, compile and pack the animations

## List of some per-weapon settings:
- Change position on X, Y and Z axis
- Change rotation on X, Y and Z axis
- Hide
- Hide but keep chosen animations visible, such as: draw animations, reload animations, idle animations, attack animations, and many more depending on class and weapon
- Make any animations static. This makes them not move and look like the idle animation. Some examples: the draw animations, the reload animations, the attack animations, the idle animations(makes them more static) and more depending on class and weapon
- Remove the left arm from any weapon
- Other class or weapon specific settings
- More info can be found in [_README.txt](https://github.com/a-horsey/horsies-viewmodel-editor/blob/main/_README.txt)

## Instructions:
- Download it and place the main folder in your game's "custom" folder or "tf" folder. I suggest the "tf" folder.
- Edit the class-specific settings files however you wish. I suggest using something other than standard notepad
- Launch GENERATE.bat
- Check [guide_position](https://raw.githubusercontent.com/a-horsey/horsies-viewmodel-editor/main/guide_position.png) and [guide_rotation](https://raw.githubusercontent.com/a-horsey/horsies-viewmodel-editor/main/guide_rotation.png) for some info on how positioning and rotation work. Also [this](https://developer.valvesoftware.com/wiki/$origin) could be useful

## Installing Fixed Viewmodels (highly recommended):
- Download the Fixed Viewmodels mod from [here](https://gamebanana.com/dl/469246) (direct link)
- Extract the main vpk in "fixed viewmodels addon"
- Done, the tool will automatically install it next time you run GENERATE.bat

## Installing custom animations:
- Download any custom viewmodel animation mods
- Place the VPKs in the "custom animations" folder (loose files currently not supported)
- Lanch GENERATE.bat and install
- All mods will be automatically checked. If they're compatible they get installed. If not, the VPK is deleted from the folder.
- I suggest reading INSTRUCTIONS.txt from the custom animations folder

## Credits:
- UltraTechX - made [CrowbarCommandLine](https://github.com/UltraTechX/Crowbar-Command-Line)
- [Ryan "Nemesis" Gregg](https://developer.valvesoftware.com/wiki/User:Nem) - made [HLLib](https://developer.valvesoftware.com/wiki/HLLib)
- yttrium, JarateKing, mastercoms and other users in the mastercomfig discord - provided a lot of important information when I first started making viewmodel stuff
- Flewvar - made some assets for left arm removal (not used anymore), also helped test a lot of theories related to viewmodels
- [newguy111](https://gamebanana.com/members/1609859) for telling me how to fix the buggy kunai/eternal reward/sharp dresser idles. And [N-Cognito](https://gamebanana.com/members/1300652) for actually making the files used in the fix.
- Discord user Arlwiss - did extensive testing and found a lot of bugs/issues
- Peaches because I kinda took over his discord for debugging and helped me test stuff
- [Valve Developer Community](https://developer.valvesoftware.com/wiki/Main_Page) - contains all the information needed to make something like this 
