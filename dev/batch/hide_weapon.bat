@echo off

::exit if hidden is no
IF NOT %•Hidden(y/n)%==y goto :EOF

::set values
set hide_origin_value=origin 0 -170 5 blend "animation_destroyer" 0 0
set hide_origin_value_keep_flames_visible=origin 0 -85 35
set hide_origin_value_keep_beam_visible=origin 0 -85 50
::apply values for beam/flames
IF %attack_sequence_2%==fire_loop set hide_origin_value=origin 999 999 999 blend "animation_destroyer" 0 0
IF %attack_sequence_1%==ft_fire set hide_origin_value=origin -999 -999 -999 blend "animation_destroyer" 0 0
IF %Keep_flames_visible(y/n)%==y set hide_origin_value=%hide_origin_value_keep_flames_visible%
IF %Keep_beam_visible(y/n)%==y set hide_origin_value=%hide_origin_value_keep_beam_visible%
::change values for other specific weapons
IF %attack_sequence_1%==db_fire set hide_origin_value=origin 0 -242 5 blend "animation_destroyer" 0 0

cd "%qc_folder_temp%"

:hide_draw
IF %draw_sequence%==none goto :hide_draw_end
IF %Keep_draw_visible(y/n)%==y echo $append %draw_sequence% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_draw_visible(y/n)%==y echo $append %draw_sequence% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 
:hide_draw_end

:hide_idle
IF %idle_sequence%==none goto :hide_idle_end
IF %Keep_idle_visible(y/n)%==y echo $append %idle_sequence% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_idle_visible(y/n)%==y echo $append %idle_sequence% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 
:hide_idle_end


:hide_attack
:hide_attack_1
IF %attack_sequence_1%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_1% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_1% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_attack_2
IF %attack_sequence_2%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_2% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_2% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_attack_3
IF %attack_sequence_3%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_3% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_3% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_attack_4
IF %attack_sequence_4%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_4% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_4% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_attack_5
IF %attack_sequence_5%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_5% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_5% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_attack_6
IF %attack_sequence_6%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_6% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_6% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 
:hide_attack_end


:hide_reload

::set values
set hide_origin_value=origin 0 -150 2600

:hide_reload_1
IF %reload_sequence_1%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_1% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_1% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_reload_2
IF %reload_sequence_2%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_2% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_2% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_reload_3
IF %reload_sequence_3%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_3% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_3% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_reload_4
IF %reload_sequence_4%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_4% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_4% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_reload_5
IF %reload_sequence_5%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_5% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_5% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_reload_6
IF %reload_sequence_6%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_6% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_6% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_reload_7
IF %reload_sequence_7%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_7% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_7% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_reload_8
IF %reload_sequence_8%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_8% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_8% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 
:hide_reload_end

:hide_other

::set values
set hide_origin_value=origin 0 -170 5 blend "animation_destroyer" 0 0
set hide_origin_value_keep_flames_visible=origin 0 -85 35
set hide_origin_value_keep_beam_visible=origin 0 -85 50
::apply values for beam/flames
IF %attack_sequence_2%==fire_loop set hide_origin_value=origin 999 999 999 blend "animation_destroyer" 0 0
IF %attack_sequence_1%==ft_fire set hide_origin_value=origin -999 -999 -999 blend "animation_destroyer" 0 0
IF %Keep_flames_visible(y/n)%==y set hide_origin_value=%hide_origin_value_keep_flames_visible%
IF %Keep_beam_visible(y/n)%==y set hide_origin_value=%hide_origin_value_keep_beam_visible%
::change values for other specific weapons
IF %attack_sequence_1%==db_fire set hide_origin_value=origin 0 -242 5 blend "animation_destroyer" 0 0

:hide_other_1
IF %other_sequence_1%==none goto :hide_other_end
echo $append %other_sequence_1% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_other_2
IF %other_sequence_2%==none goto :hide_other_end
echo $append %other_sequence_2% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_other_3
IF %other_sequence_3%==none goto :hide_other_end
echo $append %other_sequence_3% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_other_4
IF %other_sequence_4%==none goto :hide_other_end
echo $append %other_sequence_4% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_other_5
IF %other_sequence_5%==none goto :hide_other_end
echo $append %other_sequence_5% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_other_6
IF %other_sequence_6%==none goto :hide_other_end
echo $append %other_sequence_6% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_other_7
IF %other_sequence_7%==none goto :hide_other_end
echo $append %other_sequence_7% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_other_8
IF %other_sequence_8%==none goto :hide_other_end
echo $append %other_sequence_8% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 
:hide_other_end

:hide_secondary_attack
:hide_secondary_attack_1
IF %secondary_attack_sequence_1%==none goto :hide_secondary_attack_end
IF %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_1% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_1% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_secondary_attack_2
IF %secondary_attack_sequence_2%==none goto :hide_secondary_attack_end
IF %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_2% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_2% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_secondary_attack_3
IF %secondary_attack_sequence_3%==none goto :hide_secondary_attack_end
IF %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_3% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_3% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 

:hide_secondary_attack_4
IF %secondary_attack_sequence_4%==none goto :hide_secondary_attack_end
IF %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_4% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_4% %hide_origin_value% fadein 0.0 fadeout 0.0 >> %qc_file% 
:hide_secondary_attack_end


