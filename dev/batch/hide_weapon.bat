@echo off

::set values
set hide_origin_value=origin 0 -170 5
set hide_origin_value_keep_flames_visible=origin 0 -85 35
set hide_origin_value_keep_beam_visible=origin 0 -85 50

::exit if hidden is no
IF NOT %•Hidden(y/n)%==y goto :EOF
::apply values for beam/flames
IF %attack_sequence_2%==fire_loop set hide_origin_value=origin 9999 9999 9999
IF %attack_sequence_1%==ft_fire set hide_origin_value=origin 9999 9999 9999
IF %Keep_flames_visible(y/n)%==y set hide_origin_value=%hide_origin_value_keep_flames_visible%
IF %Keep_beam_visible(y/n)%==y set hide_origin_value=%hide_origin_value_keep_beam_visible%
::change values for other specific weapons
IF %attack_sequence_1%==db_fire set hide_origin_value=origin 0 -242 5

cd "%qc_folder_temp%"

:hide_draw
IF %draw_sequence%==none goto :hide_draw_end
echo $append %draw_sequence% { >> %qc_file%
IF %Keep_draw_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_draw_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_draw_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_draw_visible(y/n)%==y goto :hide_draw_end
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_draw_end

:hide_idle
IF %idle_sequence%==none goto :hide_idle_end
echo $append %idle_sequence% { >> %qc_file%
IF %Keep_idle_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_idle_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_idle_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_idle_visible(y/n)%==y goto :hide_idle_end
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_idle_end


:hide_attack
:hide_attack_1
IF %attack_sequence_1%==none goto :hide_attack_end
echo $append %attack_sequence_1% { >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_attack_visible(y/n)%==y goto :hide_attack_2
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_attack_2
IF %attack_sequence_2%==none goto :hide_attack_end
echo $append %attack_sequence_2% { >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_attack_visible(y/n)%==y goto :hide_attack_3
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_attack_3
IF %attack_sequence_3%==none goto :hide_attack_end
echo $append %attack_sequence_3% { >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_attack_visible(y/n)%==y goto :hide_attack_4
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_attack_4
IF %attack_sequence_4%==none goto :hide_attack_end
echo $append %attack_sequence_4% { >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_attack_visible(y/n)%==y goto :hide_attack_5
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_attack_5
IF %attack_sequence_5%==none goto :hide_attack_end
echo $append %attack_sequence_5% { >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_attack_visible(y/n)%==y goto :hide_attack_6
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_attack_6
IF %attack_sequence_6%==none goto :hide_attack_end
echo $append %attack_sequence_6% { >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_attack_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_attack_visible(y/n)%==y goto :hide_attack_end
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_attack_end


:hide_reload
:hide_reload_1
IF %reload_sequence_1%==none goto :hide_reload_end
echo $append %reload_sequence_1% { >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_reload_visible(y/n)%==y goto :hide_reload_2
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_reload_2
IF %reload_sequence_2%==none goto :hide_reload_end
echo $append %reload_sequence_2% { >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_reload_visible(y/n)%==y goto :hide_reload_3
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_reload_3
IF %reload_sequence_3%==none goto :hide_reload_end
echo $append %reload_sequence_3% { >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_reload_visible(y/n)%==y goto :hide_reload_4
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_reload_4
IF %reload_sequence_4%==none goto :hide_reload_end
echo $append %reload_sequence_4% { >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_reload_visible(y/n)%==y goto :hide_reload_5
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_reload_5
IF %reload_sequence_5%==none goto :hide_reload_end
echo $append %reload_sequence_5% { >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_reload_visible(y/n)%==y goto :hide_reload_6
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_reload_6
IF %reload_sequence_6%==none goto :hide_reload_end
echo $append %reload_sequence_6% { >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_reload_visible(y/n)%==y goto :hide_reload_7
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_reload_7
IF %reload_sequence_7%==none goto :hide_reload_end
echo $append %reload_sequence_7% { >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_reload_visible(y/n)%==y goto :hide_reload_8
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_reload_8
IF %reload_sequence_8%==none goto :hide_reload_end
echo $append %reload_sequence_8% { >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_reload_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_reload_visible(y/n)%==y goto :hide_reload_end
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_reload_end

:hide_other
:hide_other_1
IF %other_sequence_1%==none goto :hide_other_end
echo $append %other_sequence_1% { >> %qc_file%
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_other_2
IF %other_sequence_2%==none goto :hide_other_end
echo $append %other_sequence_2% { >> %qc_file%
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%

:hide_other_3
IF %other_sequence_3%==none goto :hide_other_end
echo $append %other_sequence_3% { >> %qc_file%
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%

:hide_other_4
IF %other_sequence_4%==none goto :hide_other_end
echo $append %other_sequence_4% { >> %qc_file%
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%

:hide_other_5
IF %other_sequence_5%==none goto :hide_other_end
echo $append %other_sequence_5% { >> %qc_file%
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%

:hide_other_6
IF %other_sequence_6%==none goto :hide_other_end
echo $append %other_sequence_6% { >> %qc_file%
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%

:hide_other_7
IF %other_sequence_7%==none goto :hide_other_end
echo $append %other_sequence_7% { >> %qc_file%
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%

:hide_other_8
IF %other_sequence_8%==none goto :hide_other_end
echo $append %other_sequence_8% { >> %qc_file%
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_other_end

:hide_special
IF %shove_sequence%==none goto :hide_special_end
echo $append %shove_sequence% { >> %qc_file%
IF %Keep_shove_visible(y/n)%==y echo origin %X_position% %Y_position% %Z_position% >> %qc_file%
IF %Keep_shove_visible(y/n)%==y echo angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF %Keep_shove_visible(y/n)%==y echo } >> %qc_file%
IF %Keep_shove_visible(y/n)%==y goto :hide_special_end
echo %hide_origin_value% >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo fadeout 0.0 >> %qc_file%
echo } >> %qc_file%
:hide_special_end



