@echo off

IF %qc_file%==c_sniper_animations.qc IF %•Remove_right_arm(y/n)%==y set •Remove_left_arm(y/n)==y
IF NOT %•Remove_left_arm(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF NOT %Keep_draw_visible(y/n)%==y IF NOT %Keep_attack_visible(y/n)%==y IF NOT %Keep_reload_visible(y/n)%==y IF NOT %Keep_idle_visible(y/n)%==y IF NOT %Keep_secondary_attack_visible(y/n)%==y goto :EOF

:add_layer_to_sequences
cd "%qc_folder_temp%"
IF %qc_file%==c_scout_animations.qc IF NOT EXIST layer_and_weights_added_scout call :add_layers_and_weights_scout
IF %qc_file%==c_soldier_animations.qc IF NOT EXIST layer_and_weights_added_soldier call :add_layers_and_weights_soldier
IF %qc_file%==c_pyro_animations.qc IF NOT EXIST layer_and_weights_added_pyro call :add_layers_and_weights_pyro
IF %qc_file%==c_demo_animations.qc IF NOT EXIST layer_and_weights_added_demo call :add_layers_and_weights_demo
IF %qc_file%==c_heavy_animations.qc IF NOT EXIST layer_and_weights_added_heavy call :add_layers_and_weights_heavy
IF %qc_file%==c_engineer_animations.qc IF NOT EXIST layer_and_weights_added_engineer call :add_layers_and_weights_engineer
IF %qc_file%==c_medic_animations.qc IF NOT EXIST layer_and_weights_added_medic call :add_layers_and_weights_medic
IF %qc_file%==c_sniper_animations.qc IF NOT EXIST layer_and_weights_added_sniper call :add_layers_and_weights_sniper
IF %qc_file%==c_spy_animations.qc IF NOT EXIST layer_and_weights_added_spy call :add_layers_and_weights_spy


:apply_layers
:apply_for_sequence_1
IF %sequence_1%==none goto :apply_layers_done
echo.$append %sequence_1% addlayer "remove_left_arm" >> %qc_file%

:apply_for_sequence_2
IF %sequence_2%==none goto :apply_layers_done
echo.$append %sequence_2% addlayer "remove_left_arm" >> %qc_file%

:apply_for_sequence_3
IF %sequence_3%==none goto :apply_layers_done
echo.$append %sequence_3% addlayer "remove_left_arm" >> %qc_file%

:apply_for_sequence_4
IF %sequence_4%==none goto :apply_layers_done
echo.$append %sequence_4% addlayer "remove_left_arm" >> %qc_file%

:apply_for_sequence_5
IF %sequence_5%==none goto :apply_layers_done
echo.$append %sequence_5% addlayer "remove_left_arm" >> %qc_file%

:apply_for_sequence_6
IF %sequence_6%==none goto :apply_layers_done
echo.$append %sequence_6% addlayer "remove_left_arm" >> %qc_file%

:apply_for_sequence_7
IF %sequence_7%==none goto :apply_layers_done
echo.$append %sequence_7% addlayer "remove_left_arm" >> %qc_file%

:apply_for_sequence_8
IF %sequence_8%==none goto :apply_layers_done
echo.$append %sequence_8% addlayer "remove_left_arm" >> %qc_file%

:apply_for_sequence_9
IF %sequence_9%==none goto :apply_layers_done
echo.$append %sequence_9% addlayer "remove_left_arm" >> %qc_file%

:apply_for_sequence_10
IF %sequence_10%==none goto :apply_layers_done
echo.$append %sequence_10% addlayer "remove_left_arm" >> %qc_file%
:apply_layers_done

:bug_fixes
IF %custom_vm%==on IF EXIST "%dev_folder%\decompiled_custom_animations\%qc_file%" goto :bug_fixes_custom_mods

:fix_shortstop_shell
IF "%settings_label%" EQU "&::shortstop" echo $append ss_idle addlayer "remove_shell_shortstop" >> %qc_file%
IF "%settings_label%" EQU "&::shortstop" echo $append ss_draw addlayer "remove_shell_shortstop" >> %qc_file%
IF "%settings_label%" EQU "&::shortstop" echo $append ss_fire addlayer "remove_shell_shortstop" >> %qc_file%
IF "%settings_label%" EQU "&::shortstop" echo $append ss_alt_fire addlayer "remove_shell_shortstop" >> %qc_file%
IF "%settings_label%" EQU "&::shortstop" echo $append ss_reload blendlayer "remove_shell_shortstop" 27 27 36 36 noblend >> %qc_file%
:fix_shortstop_shell_done

:fix_shotgun_soldier
IF "%settings_label%" EQU "&::shotguns" IF %qc_file%==c_soldier_animations.qc (
	echo $append reload_start addlayer "remove_shell" >> %qc_file%
	echo $append reload_end addlayer "remove_shell" >> %qc_file% )

:fix_shotgun_pyro
IF "%settings_label%" EQU "&::shotguns" IF %qc_file%==c_pyro_animations.qc (
	echo $append reload_start addlayer "remove_shell" >> %qc_file%
	echo $append reload_end addlayer "remove_shell" >> %qc_file%
	echo $append draw addlayer "remove_shell" >> %qc_file%
	echo $append idle addlayer "remove_shell" >> %qc_file%
	echo $append fire addlayer "remove_shell" >> %qc_file% )

:fix_shotgun_pyro_inspect
IF "%settings_label%" EQU "&::secondariesinspect" IF %qc_file%==c_pyro_animations.qc (
	echo $append secondary_inspect_start addlayer "remove_shell" >> %qc_file%
	echo $append secondary_inspect_idle addlayer "remove_shell" >> %qc_file%
	echo $append secondary_inspect_end addlayer "remove_shell" >> %qc_file% )
	
:fix_demo_grenade
IF "%settings_label%" EQU "&::grenadelaunchers" IF %qc_file%==c_demo_animations.qc (
	echo $append g_draw addlayer "remove_shell" >> %qc_file%
	echo $append g_idle addlayer "remove_shell" >> %qc_file%
	echo $append g_fire addlayer "remove_shell" >> %qc_file%
	echo $append g_auto_fire addlayer "remove_shell" >> %qc_file% )
	
:fix_spy_revolver_reload
IF "%settings_label%" EQU "&::revolvers" IF %qc_file%==c_spy_animations.qc (
	echo $append reload addlayer "remove_shell" >> %qc_file%
	echo $append reload2 addlayer "remove_shell" >> %qc_file%
	echo $append reload blendlayer "remove_shell_fix" 0 0 8 8 noblend >> %qc_file%
	echo $append reload2 blendlayer "remove_shell_fix" 0 0 8 8 noblend >> %qc_file% )


goto :EOF


:bug_fixes_custom_mods
:fix_shotgun_soldier_modded
IF "%settings_label%" EQU "&::shotguns" IF %qc_file%==c_soldier_animations.qc (
	echo $append reload_start addlayer "remove_shell" >> %qc_file%
	echo $append reload_loop addlayer "remove_shell" >> %qc_file%
	echo $append reload_end addlayer "remove_shell" >> %qc_file%
	echo $append draw addlayer "remove_shell" >> %qc_file%
	echo $append idle addlayer "remove_shell" >> %qc_file%
	echo $append fire addlayer "remove_shell" >> %qc_file% )
	
:fix_shotgun_soldier_inspect
:fix_shotgun_pyro_inspect_modded
IF "%settings_label%" EQU "&::secondaryinspect" IF %qc_file%==c_soldier_animations.qc (
	echo $append secondary_inspect_start addlayer "remove_shell" >> %qc_file%
	echo $append secondary_inspect_idle addlayer "remove_shell" >> %qc_file%
	echo $append secondary_inspect_end addlayer "remove_shell" >> %qc_file% )

:fix_shotgun_pyro_modded
IF "%settings_label%" EQU "&::shotguns" IF %qc_file%==c_pyro_animations.qc (
	echo $append reload_start addlayer "remove_shell" >> %qc_file%
	echo $append reload_loop addlayer "remove_shell" >> %qc_file%
	echo $append reload_end addlayer "remove_shell" >> %qc_file%
	echo $append draw addlayer "remove_shell" >> %qc_file%
	echo $append idle addlayer "remove_shell" >> %qc_file%
	echo $append fire addlayer "remove_shell" >> %qc_file% )

:fix_shotgun_pyro_inspect_modded
IF "%settings_label%" EQU "&::secondariesinspect" IF %qc_file%==c_pyro_animations.qc (
	echo $append secondary_inspect_start addlayer "remove_shell" >> %qc_file%
	echo $append secondary_inspect_idle addlayer "remove_shell" >> %qc_file%
	echo $append secondary_inspect_end addlayer "remove_shell" >> %qc_file% )
	
:fix_demo_grenade_modded
IF "%settings_label%" EQU "&::grenadelaunchers" IF %qc_file%==c_demo_animations.qc (
	echo $append g_draw addlayer "remove_shell" >> %qc_file%
	echo $append g_idle addlayer "remove_shell" >> %qc_file%
	echo $append g_fire addlayer "remove_shell" >> %qc_file%
	echo $append g_auto_fire addlayer "remove_shell" >> %qc_file% )

:fix_spy_revolver_reload
IF "%settings_label%" EQU "&::revolvers" IF %qc_file%==c_spy_animations.qc (
	echo $append reload addlayer "remove_shell" >> %qc_file%
	echo $append reload2 addlayer "remove_shell" >> %qc_file% )

::exit
goto :EOF


:add_layers_and_weights_scout
cd "%qc_folder_temp%"
 echo.$weightlist "remove_left_arm" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 1 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 1 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 1 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_L" 1 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 1 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 1 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_L" 1 >> %qc_file% 
 echo."bip_thumb_0_L" 1 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 1 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 1 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 1 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 1 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 1 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 1 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 1 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 1 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 1 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 1 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 1 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 1 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 1 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 1 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 
 
  echo.$weightlist "remove_shell" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 0 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 
 
  echo.$weightlist "remove_shell_shortstop" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 0 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 1 >> %qc_file% 
 echo."vm_weapon_bone_2" 1 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_left_arm" { >> %qc_file% 
 echo."c_scout_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file% 
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_left_arm" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_shell" { >> %qc_file% 
 echo."c_scout_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file% 
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
 
 echo.$sequence "remove_shell_shortstop" { >> %qc_file% 
 echo."c_scout_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file% 
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell_shortstop" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
::mark as added and exit call
echo added_weights_and_layers > layer_and_weights_added_scout
exit /b
 
:add_layers_and_weights_soldier
cd "%qc_folder_temp%"
 echo.$weightlist "remove_left_arm" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_upperArm_L" 1 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 1 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_wrist_L" 1 >> %qc_file% 
 echo."bip_wrist_R" 0 >> %qc_file% 
 echo."bip_hand_L" 1 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 1 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 1 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_L" 1 >> %qc_file% 
 echo."handle_bone" 0 >> %qc_file% 
 echo."rocket" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 1 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 1 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 1 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_meta_0_L" 1 >> %qc_file% 
 echo."bip_index_meta_0_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 1 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 1 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 1 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_meta_0_L" 1 >> %qc_file% 
 echo."bip_middle_meta_0_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 1 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 1 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 1 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_meta_0_L" 1 >> %qc_file% 
 echo."bip_ring_meta_0_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 1 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 1 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 1 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_meta_0_L" 1 >> %qc_file% 
 echo."bip_pinky_meta_0_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 1 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 1 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 1 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 

  echo.$weightlist "remove_shell" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_wrist_L" 0 >> %qc_file% 
 echo."bip_wrist_R" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."handle_bone" 0 >> %qc_file% 
 echo."rocket" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_meta_0_L" 0 >> %qc_file% 
 echo."bip_index_meta_0_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_meta_0_L" 0 >> %qc_file% 
 echo."bip_middle_meta_0_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_meta_0_L" 0 >> %qc_file% 
 echo."bip_ring_meta_0_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_meta_0_L" 0 >> %qc_file% 
 echo."bip_pinky_meta_0_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_left_arm" { >> %qc_file% 
 echo."c_soldier_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_left_arm" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%

 echo.$sequence "remove_shell" { >> %qc_file% 
 echo."c_soldier_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
::mark as added and exit call
echo added_weights_and_layers > layer_and_weights_added_soldier
exit /b

:add_layers_and_weights_pyro
cd "%qc_folder_temp%"
 echo.$weightlist "remove_left_arm" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 1 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 1 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 1 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_L" 1 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 1 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 1 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_L" 1 >> %qc_file% 
 echo."bip_thumb_0_L" 1 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 1 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 1 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 1 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 1 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 1 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 1 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 1 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 1 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 1 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 1 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 1 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 1 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 1 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 1 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file%

  echo.$weightlist "remove_shell" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 0 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 
 
 echo.$sequence "remove_left_arm" { >> %qc_file% 
 echo."c_pyro_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file% 
 echo.frame 0 0 >> %qc_file%
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_left_arm" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_shell" { >> %qc_file% 
 echo."c_pyro_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell" >> %qc_file% 
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
::mark as added and exit call
echo added_weights_and_layers > layer_and_weights_added_pyro
exit /b

:add_layers_and_weights_demo
cd "%qc_folder_temp%"
 echo.$weightlist "remove_left_arm" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_upperArm_L" 1 >> %qc_file% 
 echo."bip_lowerArm_L" 1 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_wrist_R" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."bip_wrist_L" 1 >> %qc_file% 
 echo."bip_hand_L" 1 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_L" 1 >> %qc_file% 
 echo."weapon_targe" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 1 >> %qc_file% 
 echo."bip_middle_meta_0_L" 1 >> %qc_file% 
 echo."bip_middle_0_L" 1 >> %qc_file% 
 echo."bip_middle_1_L" 1 >> %qc_file% 
 echo."bip_middle_2_L" 1 >> %qc_file% 
 echo."bip_ring_meta_0_L" 1 >> %qc_file% 
 echo."bip_ring_0_L" 1 >> %qc_file% 
 echo."bip_ring_1_L" 1 >> %qc_file% 
 echo."bip_ring_2_L" 1 >> %qc_file% 
 echo."bip_pinky_meta_0_L" 1 >> %qc_file% 
 echo."bip_pinky_0_L" 1 >> %qc_file% 
 echo."bip_pinky_1_L" 1 >> %qc_file% 
 echo."bip_pinky_2_L" 1 >> %qc_file% 
 echo."bip_index_meta_0_L" 1 >> %qc_file% 
 echo."bip_index_0_L" 1 >> %qc_file% 
 echo."bip_index_1_L" 1 >> %qc_file% 
 echo."bip_index_2_L" 1 >> %qc_file% 
 echo."bip_thumb_0_L" 1 >> %qc_file% 
 echo."bip_thumb_1_L" 1 >> %qc_file% 
 echo."bip_thumb_2_L" 1 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_meta_0_R" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_meta_0_R" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_meta_0_R" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_meta_0_R" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file%

  echo.$weightlist "remove_shell" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_wrist_R" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."bip_wrist_L" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."weapon_targe" 0 >> %qc_file% 
 echo."weapon_bone_4" 1 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."bip_middle_meta_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_ring_meta_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_pinky_meta_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_index_meta_0_L" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_meta_0_R" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_meta_0_R" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_meta_0_R" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_meta_0_R" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 
 
 echo.$sequence "remove_left_arm" { >> %qc_file% 
 echo."c_demo_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_left_arm" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%

 echo.$sequence "remove_shell" { >> %qc_file% 
 echo."c_demo_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
::mark as added and exit call
echo added_weights_and_layers > layer_and_weights_added_demo
exit /b

:add_layers_and_weights_heavy
cd "%qc_folder_temp%"
 echo.$weightlist "remove_left_arm" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 1 >> %qc_file% 
 echo."bip_upperArm_L" 1 >> %qc_file% 
 echo."bip_lowerArm_L" 1 >> %qc_file% 
 echo."bip_hand_L" 1 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_1_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_2_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_3_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_4_L" 1 >> %qc_file% 
 echo."effect_hand_L" 1 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 1 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 1 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 1 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 1 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 1 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 1 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 1 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 1 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 1 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 1 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 1 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 1 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 1 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 1 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 1 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 

  echo.$weightlist "remove_shell" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_1_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_2_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_3_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_4_L" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_shell" { >> %qc_file% 
 echo."c_heavy_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
 
 echo.$sequence "remove_left_arm" { >> %qc_file% 
 echo."c_heavy_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_left_arm" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
::mark as added and exit call
echo added_weights_and_layers > layer_and_weights_added_heavy
exit /b

:add_layers_and_weights_engineer
::note both "remove_left_arm" and "remove_shell" actually remove the shell
cd "%qc_folder_temp%"
 echo.$weightlist "remove_left_arm" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_upperArm_L" 1 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 1 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_wrist_L" 1 >> %qc_file% 
 echo."bip_wrist_R" 0 >> %qc_file% 
 echo."bip_hand_L" 1 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."arm_attach_R" 0 >> %qc_file% 
 echo."bip_twist_R" 0 >> %qc_file% 
 echo."forearm_twist_01_L" 1 >> %qc_file% 
 echo."effect_hand_L" 1 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 1 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_L" 1 >> %qc_file% 
 echo."bip_thumb_0_L" 1 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 1 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 1 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_meta_0_L" 1 >> %qc_file% 
 echo."bip_index_meta_0_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 1 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 1 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 1 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_meta_0_L" 1 >> %qc_file% 
 echo."bip_middle_meta_0_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 1 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 1 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 1 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_meta_0_L" 1 >> %qc_file% 
 echo."bip_ring_meta_0_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 1 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 1 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 1 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_meta_0_L" 1 >> %qc_file% 
 echo."bip_pinky_meta_0_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 1 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 1 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 1 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 
 
  echo.$weightlist "remove_shell" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_wrist_L" 0 >> %qc_file% 
 echo."bip_wrist_R" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."arm_attach_R" 0 >> %qc_file% 
 echo."bip_twist_R" 0 >> %qc_file% 
 echo."forearm_twist_01_L" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_meta_0_L" 0 >> %qc_file% 
 echo."bip_index_meta_0_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_meta_0_L" 0 >> %qc_file% 
 echo."bip_middle_meta_0_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_meta_0_L" 0 >> %qc_file% 
 echo."bip_ring_meta_0_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_meta_0_L" 0 >> %qc_file% 
 echo."bip_pinky_meta_0_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_left_arm" { >> %qc_file% 
 echo."c_engineer_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file% 
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_left_arm" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_shell" { >> %qc_file% 
 echo."c_engineer_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file% 
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
::mark as added and exit call
echo added_weights_and_layers > layer_and_weights_added_engineer
exit /b

:add_layers_and_weights_medic
cd "%qc_folder_temp%"
 echo.$weightlist "remove_left_arm" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 1 >> %qc_file% 
 echo."bip_upperArm_L" 1 >> %qc_file% 
 echo."bip_lowerArm_L" 1 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 1 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 1 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_L" 1 >> %qc_file% 
 echo."bip_thumb_0_L" 1 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 1 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 1 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 1 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 1 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 1 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 1 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 1 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 1 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 1 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 1 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 1 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 1 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 1 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 1 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file%
 
  echo.$weightlist "remove_shell" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_left_arm" { >> %qc_file% 
 echo."c_medic_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo. frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_left_arm" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%

 echo.$sequence "remove_shell" { >> %qc_file% 
 echo."c_medic_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo. frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
::mark as added and exit call
echo added_weights_and_layers > layer_and_weights_added_medic
exit /b

:add_layers_and_weights_sniper
cd "%qc_folder_temp%"
 echo.$weightlist "remove_left_arm" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 1 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 1 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 1 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_L" 1 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 1 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 1 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_L" 1 >> %qc_file% 
 echo."bip_thumb_0_L" 1 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 1 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 1 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 1 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 1 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 1 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 1 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 1 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 1 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 1 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 1 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 1 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 1 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 1 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 1 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file%

  echo.$weightlist "remove_shell" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_collar_L" 0 >> %qc_file% 
 echo."bip_collar_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."vm_weapon_bone" 1 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_left_arm" { >> %qc_file% 
 echo."c_sniper_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file% 
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_left_arm" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_shell" { >> %qc_file% 
 echo."c_sniper_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file% 
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file% 
::mark as added and exit call
echo added_weights_and_layers > layer_and_weights_added_sniper
exit /b

:add_layers_and_weights_spy
cd "%qc_folder_temp%"
 echo.$weightlist "remove_left_arm" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 1 >> %qc_file% 
 echo."bip_lowerArm_L" 1 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."effect_hand_L" 1 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 0 >> %qc_file% 
 echo."weapon_bone_5" 0 >> %qc_file% 
 echo."weapon_bone_6" 0 >> %qc_file% 
 echo."weapon_bone_7" 0 >> %qc_file% 
 echo."weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 1 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 1 >> %qc_file% 
 echo."bip_thumb_0_L" 1 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 1 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 1 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 1 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 1 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 1 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 1 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 1 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 1 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 1 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 1 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 1 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 1 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 1 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 1 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo."Sleeve_Control" 0 >> %qc_file% 
 echo."Wrist_Control" 0 >> %qc_file% 
 echo.} >> %qc_file%

 echo.$weightlist "remove_shell" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 0 >> %qc_file% 
 echo."weapon_bone_4" 1 >> %qc_file% 
 echo."weapon_bone_5" 0 >> %qc_file% 
 echo."weapon_bone_6" 0 >> %qc_file% 
 echo."weapon_bone_7" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo."Sleeve_Control" 0 >> %qc_file% 
 echo."Wrist_Control" 0 >> %qc_file% 
 echo.} >> %qc_file% 
 
 echo.$weightlist "remove_shell_fix" { >> %qc_file% 
 echo."root" 0 >> %qc_file% 
 echo."bip_upperArm_R" 0 >> %qc_file% 
 echo."bip_lowerArm_R" 0 >> %qc_file% 
 echo."bip_hand_R" 0 >> %qc_file% 
 echo."bip_upperArm_L" 0 >> %qc_file% 
 echo."bip_lowerArm_L" 0 >> %qc_file% 
 echo."bip_hand_L" 0 >> %qc_file% 
 echo."effect_hand_L" 0 >> %qc_file% 
 echo."effect_hand_R" 0 >> %qc_file% 
 echo."weapon_bone" 0 >> %qc_file% 
 echo."weapon_bone_1" 0 >> %qc_file% 
 echo."weapon_bone_2" 0 >> %qc_file% 
 echo."weapon_bone_3" 1 >> %qc_file% 
 echo."weapon_bone_4" 1 >> %qc_file% 
 echo."weapon_bone_5" 0 >> %qc_file% 
 echo."weapon_bone_6" 0 >> %qc_file% 
 echo."weapon_bone_7" 0 >> %qc_file% 
 echo."weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone" 0 >> %qc_file% 
 echo."vm_weapon_bone_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_2" 0 >> %qc_file% 
 echo."vm_weapon_bone_3" 0 >> %qc_file% 
 echo."vm_weapon_bone_4" 0 >> %qc_file% 
 echo."vm_weapon_bone_5" 0 >> %qc_file% 
 echo."vm_weapon_bone_6" 0 >> %qc_file% 
 echo."vm_weapon_bone_7" 0 >> %qc_file% 
 echo."vm_weapon_bone_L" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_1" 0 >> %qc_file% 
 echo."vm_weapon_bone_L_2" 0 >> %qc_file% 
 echo."bip_thumb_0_L" 0 >> %qc_file% 
 echo."bip_thumb_0_R" 0 >> %qc_file% 
 echo."bip_thumb_1_L" 0 >> %qc_file% 
 echo."bip_thumb_1_R" 0 >> %qc_file% 
 echo."bip_thumb_2_L" 0 >> %qc_file% 
 echo."bip_thumb_2_R" 0 >> %qc_file% 
 echo."bip_index_0_L" 0 >> %qc_file% 
 echo."bip_index_0_R" 0 >> %qc_file% 
 echo."bip_index_1_L" 0 >> %qc_file% 
 echo."bip_index_1_R" 0 >> %qc_file% 
 echo."bip_index_2_L" 0 >> %qc_file% 
 echo."bip_index_2_R" 0 >> %qc_file% 
 echo."bip_middle_0_L" 0 >> %qc_file% 
 echo."bip_middle_0_R" 0 >> %qc_file% 
 echo."bip_middle_1_L" 0 >> %qc_file% 
 echo."bip_middle_1_R" 0 >> %qc_file% 
 echo."bip_middle_2_L" 0 >> %qc_file% 
 echo."bip_middle_2_R" 0 >> %qc_file% 
 echo."bip_ring_0_L" 0 >> %qc_file% 
 echo."bip_ring_0_R" 0 >> %qc_file% 
 echo."bip_ring_1_L" 0 >> %qc_file% 
 echo."bip_ring_1_R" 0 >> %qc_file% 
 echo."bip_ring_2_L" 0 >> %qc_file% 
 echo."bip_ring_2_R" 0 >> %qc_file% 
 echo."bip_pinky_0_L" 0 >> %qc_file% 
 echo."bip_pinky_0_R" 0 >> %qc_file% 
 echo."bip_pinky_1_L" 0 >> %qc_file% 
 echo."bip_pinky_1_R" 0 >> %qc_file% 
 echo."bip_pinky_2_L" 0 >> %qc_file% 
 echo."bip_pinky_2_R" 0 >> %qc_file% 
 echo."Sleeve_Control" 0 >> %qc_file% 
 echo."Wrist_Control" 0 >> %qc_file% 
 echo.} >> %qc_file% 

 echo.$sequence "remove_left_arm" { >> %qc_file% 
 echo."c_spy_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_left_arm" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
 
 echo.$sequence "remove_shell" { >> %qc_file% 
 echo."c_spy_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%

 echo.$sequence "remove_shell_fix" { >> %qc_file% 
 echo."c_spy_animations_anims\PASSTIME_ball_idle.smd" >> %qc_file%
 echo.frame 0 0 >> %qc_file% 
 echo.fps 1 >> %qc_file% 
 echo.hidden >> %qc_file% 
 echo.realtime >> %qc_file% 
 echo.loop >> %qc_file% 
 echo.weightlist "remove_shell_fix" >> %qc_file%
echo.blend "bone_destroyer" 0 0 >> %qc_file% 
 echo.} >> %qc_file%
::mark as added and exit call
echo added_weights_and_layers > layer_and_weights_added_spy
exit /b



 



