::this script is for hiding spy's backstab animations

@echo off

::exit if hidden is no
IF NOT %•Hidden(y/n)%==y goto :EOF

cd "%qc_folder_temp%"

::hide_backstab
:hide_backstab_1
IF %backstab_attack_sequence%==none goto :hide_backstab_end
IF NOT %Keep_backstab_visible(y/n)%==y echo $append %backstab_attack_sequence% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y echo $append %backstab_attack_sequence% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_backstab_visible(y/n)%==y set sequence_to_remove_blend_from=%backstab_attack_sequence%
IF NOT %Keep_backstab_visible(y/n)%==y call :blend_remover

:hide_backstab_2
IF %backstab_stun_sequence%==none goto :hide_backstab_end
IF NOT %Keep_backstab_visible(y/n)%==y echo $append %backstab_stun_sequence% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y echo $append %backstab_stun_sequence% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_backstab_visible(y/n)%==y set sequence_to_remove_blend_from=%backstab_stun_sequence%
IF NOT %Keep_backstab_visible(y/n)%==y call :blend_remover
:hide_backstab_end

::hide_backstab_detection
:hide_backstab_detection_1
IF %backstab_detect_sequence_up%==none goto :hide_backstab_detection_end
IF NOT %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_up% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_up% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_backstab_detection_visible(y/n)%==y set sequence_to_remove_blend_from=%backstab_detect_sequence_up%
IF NOT %Keep_backstab_detection_visible(y/n)%==y call :blend_remover

:hide_backstab_detection_2
IF %backstab_detect_sequence_down%==none goto :hide_backstab_detection_end
IF %•Instant_backstab_detection(y/n)%==y IF %Keep_backstab_detection_visible(y/n)%==y (
	echo $append %backstab_detect_sequence_down% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
	goto :hide_backstab_detection_3 )
IF NOT %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_down% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_down% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_backstab_detection_visible(y/n)%==y set sequence_to_remove_blend_from=%backstab_detect_sequence_down%
IF NOT %Keep_backstab_detection_visible(y/n)%==y call :blend_remover


:hide_backstab_detection_3
IF %backstab_detect_sequence_idle%==none goto :hide_backstab_detection_end
IF NOT %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_idle% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_idle% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_backstab_detection_visible(y/n)%==y set sequence_to_remove_blend_from=%backstab_detect_sequence_idle%
IF NOT %Keep_backstab_detection_visible(y/n)%==y call :blend_remover
:hide_backstab_detection_end

goto :EOF
:blend_remover
IF NOT %custom_vm%==on IF NOT EXIST "%dev_folder%\decompiled_custom_animations\%qc_file%" EXIT /b
cd "%qc_folder_temp%"
::remove temp
IF EXIST no_blendlayer_temp del no_blendlayer_temp >nul
IF EXIST no_addlayer_temp del no_addlayer_temp >nul
::remove mentions of blend for that sequence
FINDSTR /v /i /r /c:"blendlayer .%sequence_to_remove_blend_from%." "%qc_file%" > no_blendlayer_temp
FINDSTR /v /i /r /c:"addlayer .%sequence_to_remove_blend_from%." "no_blendlayer_temp" > no_addlayer_temp
::replace qc again
move "no_addlayer_temp" "%qc_file%" >nul
::clean temp again and exit call
IF EXIST no_blendlayer_temp del no_blendlayer_temp >nul
IF EXIST no_addlayer_temp del no_addlayer_temp >nul
EXIT /b
