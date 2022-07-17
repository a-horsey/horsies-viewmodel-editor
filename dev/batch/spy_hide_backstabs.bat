::this script is for hiding spy's backstab animations

@echo off

::exit if hidden is no
IF NOT %•Hidden(y/n)%==y goto :EOF

cd %qc_folder_temp%
:hide_backstab
:hide_backstab_1
IF %backstab_attack_sequence%==none goto :hide_backstab_end
echo $append %backstab_attack_sequence% { >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y goto :hide_backstab_2
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%

:hide_backstab_2
IF %backstab_stun_sequence%==none goto :hide_backstab_end
echo $append %backstab_stun_sequence% { >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_backstab_visible(y/n)%==y goto :hide_backstab_end
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_backstab_end

:hide_backstab_detection
:hide_backstab_detection_1
IF %backstab_detect_sequence_up%==none goto :hide_backstab_detection_end
echo $append %backstab_detect_sequence_up% { >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y goto :hide_backstab_detection_2
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%

:hide_backstab_detection_2
IF %backstab_detect_sequence_down%==none goto :hide_backstab_detection_end
echo $append %backstab_detect_sequence_down% { >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y goto :hide_backstab_detection_3
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%

:hide_backstab_detection_3
IF %backstab_detect_sequence_idle%==none goto :hide_backstab_detection_end
echo $append %backstab_detect_sequence_idle% { >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_backstab_detection_visible(y/n)%==y goto :hide_backstab_detection_end
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_backstab_detection_end
