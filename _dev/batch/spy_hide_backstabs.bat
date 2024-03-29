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

:hide_backstab_2
IF %backstab_stun_sequence%==none goto :hide_backstab_end
IF NOT %Keep_backstab_visible(y/n)%==y echo $append %backstab_stun_sequence% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y echo $append %backstab_stun_sequence% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
:hide_backstab_end

::hide_backstab_detection
:hide_backstab_detection_1
IF %backstab_detect_sequence_up%==none goto :hide_backstab_detection_end
IF NOT %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_up% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_up% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:hide_backstab_detection_2
IF %backstab_detect_sequence_down%==none goto :hide_backstab_detection_end
IF %•Instant_backstab_detection(y/n)%==y IF %Keep_backstab_detection_visible(y/n)%==y (
	echo $append %backstab_detect_sequence_down% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
	goto :hide_backstab_detection_3 )
IF NOT %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_down% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_down% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%


:hide_backstab_detection_3
IF %backstab_detect_sequence_idle%==none goto :hide_backstab_detection_end
IF NOT %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_idle% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo $append %backstab_detect_sequence_idle% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
:hide_backstab_detection_end

::remove blends only if using custom animations
IF %custom_vm%==on IF EXIST "%dev_folder%\decompiled_custom_animations\%qc_file%" goto :remove_blends
goto :EOF
:remove_blends

:remove_blends_stab
IF %Keep_backstab_visible(y/n)%==y goto :remove_blends_backstab_done
set operating_sequence_1=%backstab_attack_sequence%
set operating_sequence_2=%backstab_stun_sequence%
set operating_sequence_3=none
set operating_sequence_4=none
set operating_sequence_5=none
set operating_sequence_6=none
set operating_sequence_7=none
set operating_sequence_8=none
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_of_sequence.bat"
:remove_blends_backstab_done

:remove_blends_backstab_detection
IF %Keep_backstab_detection_visible(y/n)%==y goto :remove_blends_backstab_detection_done
set operating_sequence_1=%backstab_detect_sequence_up%
set operating_sequence_2=%backstab_detect_sequence_down%
set operating_sequence_3=%backstab_detect_sequence_idle%
set operating_sequence_4=none
set operating_sequence_5=none
set operating_sequence_6=none
set operating_sequence_7=none
set operating_sequence_8=none
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_of_sequence.bat"
:remove_blends_backstab_detection_done
