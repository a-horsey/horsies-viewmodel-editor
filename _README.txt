https://github.com/a-horsey/horsies-viewmodel-editor

	Welcome to Horsie's Viewmodel Editor! 
	To change the settings, open the settings.txt files for each class.
	For example, to change scout settings open settings_scout.txt
	To apply the settings, run GENERATE.bat
	
	Preloading, Fixed Viemodels and Custom Animations support:
1. Preloading allows you to use these viewmodels in any server, regardless of sv_pure.
This includes fully automated preloading at game start, it's highly recommended but toggleable.
It will not mess with your autoexec or other game files.

2. Fixed Viewmodels is a mod that fixes hundreds of default animations (https://gamebanana.com/mods/206440)
This mod is fully supported and easy to install - just drop the vpk in "fixed viewmodels addon".
More instructions and a direct link can be found in that folder.
All credits for creating it go to the author.

3. This also supports mods that change the custom animations.
Simply drop any viewmodel animations mods in the "custom animations" folder. 
I suggest reading "INSTRUCTIONS.txt" in that same folder
The mods will be automatically checked and installed next time you run GENERATE.bat
Incompatible mods will be deleted from the folder.
	
	Here are some of the settings:
1. Changing positions:
	You can change the positions of weapons on X, Y and Z axis. 
To see what each axis does, please check guide_position.png in this folder.

2. Changing rotations:
	You can change the rotations of weapons on X, Y and Z axis. 
To see what each axis does, please check guide_rotation.png in this folder.

3. Hiding weapons:
	There is a setting for each weapon that lets you hide that particular weapon.
Additionally, you can choose to keep specific animations of that weapon visible.
Such as: draws, reloads, attacks and more. More info below.

4. Making animations static:
	When you make an animation static, it makes that animation not move and
behave exactly like the idle animation.
	All animations such as draws, reloads, attacks and more can be made static.
	
5. Removing the left arm:
	You can remove the left arm from most weapons by enabling "Remove_left_arm" for that weapon.
	This option is present even for weapons with no visible left arm, because it can be used to
remove glitches at high viewmodel_fov values or for some custom animations that add the arm back.
	
6. Weapon-specific settings:
	There are some settings that are specific to certain weapons.
Such as removing shell ejection or some fancy spy knife settings.

	More in-depth information:
1. The animations you can keep visible or turn static are:
	•Draw animations - these play when you just switched to that particular weapon.
	•Reload animations - these play when you reload the weapon.
	•Attack animations - these play when you're attacking with the weapon.
	•Secondary attack animations - these play when you're doing the secondary attack, usually by pressing mouse2.
	•Idle animations - these play when the weapon is idle.
		Enabling the option "•More_static_idle" will make the idle not sway when standing still.
		(the weapon will still sway when moving, as that is hardcoded)
	•Some special animations such as backstabs, backstab detections, shortstop shove etc..
	
2. A list of some weapon-specific settings:
	•Mediguns: 
				Keep_beam_visible - keeps the heal beam visible if weapon is hidden.
					(always visible if attack is not hidden)
	•Flamethrowers:
				Keep_flames_visible - keeps the flames visible if weapon is hidden.
					(always visible if attack is not hidden)
	•All spy knives: 
				Keep_backstab_detection_visible - keeps the backstab detection (knife rising up) visible if weapon is hidden.
				Keep_backstab_visible - keeps the actual backstab visible if weapon is hidden.
				Instant_backstab_detection - makes the knife instantly rise up as soon as you can backstab someone.
				Replace_backstab_with_normal_attack - replaces the actual backstab animation with one of the regular attacks.
				Static_backstab_detection - makes the knife not move when you can backstab someone.
				Static_backstab - makes the knife not move when actually backstabbing someone.
	•Shotguns, scatterguns, sniper rifles:
				Remove_shells - makes the weapon not eject shells when reloading/attacking.
	•All weapons that shoot bullets (except the sniper rifle):
				Keep_tracers_visible - keeps the tracers visible if the weapon is hidden.
					(disabling this will cause console errors when shooting, but they're harmless)