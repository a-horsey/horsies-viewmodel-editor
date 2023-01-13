@echo off

::exit if hidden is no
IF NOT %•Hidden(y/n)%==y goto :EOF

::set values
set hide_origin_value=origin 0 -170 5
::apply values for beam/flames
IF %attack_sequence_2%==fire_loop set hide_origin_value=origin 0 -9999 9999
IF %attack_sequence_1%==ft_fire set hide_origin_value=origin 0 -999 -999
::value for visible flames
IF %Keep_flames_visible(y/n)%==y set hide_origin_value=origin 0 -85 35
::value for visible beam
IF %Keep_beam_visible(y/n)%==y set hide_origin_value=origin 0 -85 50
::value for visible tracers on double barrels
IF %attack_sequence_1%==db_fire set hide_origin_value=origin 0 -242 5
::value for sappers to prevent bugs
IF "%settings_label%" EQU "&::sapper" set hide_origin_value=origin 0 -9999 9999

cd "%qc_folder_temp%"

:hide_draw
IF %draw_sequence%==none goto :hide_draw_end
IF %Keep_draw_visible(y/n)%==y echo $append %draw_sequence% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_draw_visible(y/n)%==y echo $append %draw_sequence% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 
:hide_draw_end

:hide_idle
IF %idle_sequence%==none goto :hide_idle_end
IF %Keep_idle_visible(y/n)%==y echo $append %idle_sequence% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_idle_visible(y/n)%==y echo $append %idle_sequence% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%
:hide_idle_end

::set values for attacks
set hide_origin_value=origin 0 -170 5
::apply values for beam/flames
IF %attack_sequence_2%==fire_loop set hide_origin_value=origin 0 -9999 9999
IF %attack_sequence_1%==ft_fire set hide_origin_value=origin 0 -999 -999 blend "animation_destroyer" 0 0
::value for visible flames
IF %Keep_flames_visible(y/n)%==y set hide_origin_value=origin 0 -85 35
::value for visible beam
IF %Keep_beam_visible(y/n)%==y set hide_origin_value=origin 0 -85 50
::value for visible tracers on double barrels
IF %attack_sequence_1%==db_fire set hide_origin_value=origin 0 -242 5
::value for sappers to prevent bugs
IF "%settings_label%" EQU "&::sapper" set hide_origin_value=origin 0 -9999 9999
::special value if tracers not visible
IF NOT %attack_sequence_2%==fire IF NOT %attack_sequence_1%==ft_fire IF %Keep_tracers_visible(y/n)%==n set hide_origin_value=origin 0 -400 0 blend "animation_destroyer" 0 0
::values for hidden beam trail setting
IF %•Turn_beam_into_trail_when_hidden(y/n)%==y IF %attack_sequence_2%==fire_loop set hide_origin_value=origin 0 -9999 999 blend "animation_destroyer" 0 0

:hide_attack
:hide_attack_1
IF %attack_sequence_1%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_1% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_1% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_attack_2
IF %attack_sequence_2%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_2% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_2% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_attack_3
IF %attack_sequence_3%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_3% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_3% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%

:hide_attack_4
IF %attack_sequence_4%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_4% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_4% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_attack_5
IF %attack_sequence_5%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_5% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_5% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_attack_6
IF %attack_sequence_6%==none goto :hide_attack_end
IF %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_6% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_attack_visible(y/n)%==y echo $append %attack_sequence_6% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 
:hide_attack_end

::set values back after attacks
set hide_origin_value=origin 0 -170 5
::apply values for beam/flames
IF %attack_sequence_2%==fire_loop set hide_origin_value=origin 0 -9999 999
IF %attack_sequence_1%==ft_fire set hide_origin_value=origin 0 -999 -999
::value for visible flames
IF %Keep_flames_visible(y/n)%==y set hide_origin_value=origin 0 -85 35
::value for visible beam
IF %Keep_beam_visible(y/n)%==y set hide_origin_value=origin 0 -85 50
::value for visible tracers on double barrels
IF %attack_sequence_1%==db_fire set hide_origin_value=origin 0 -242 5
::value for sappers to prevent bugs
IF "%settings_label%" EQU "&::sapper" set hide_origin_value=origin 0 -9999 9999


:hide_reload
:hide_reload_1
IF %reload_sequence_1%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_1% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_1% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_reload_2
IF %reload_sequence_2%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_2% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_2% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_reload_3
IF %reload_sequence_3%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_3% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_3% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_reload_4
IF %reload_sequence_4%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_4% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_4% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_reload_5
IF %reload_sequence_5%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_5% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_5% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_reload_6
IF %reload_sequence_6%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_6% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_6% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_reload_7
IF %reload_sequence_7%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_7% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_7% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_reload_8
IF %reload_sequence_8%==none goto :hide_reload_end
IF %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_8% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_reload_visible(y/n)%==y echo $append %reload_sequence_8% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 
:hide_reload_end

:hide_other
:hide_other_1
IF %other_sequence_1%==none goto :hide_other_end
echo $append %other_sequence_1% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%

:hide_other_2
IF %other_sequence_2%==none goto :hide_other_end
echo $append %other_sequence_2% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_other_3
IF %other_sequence_3%==none goto :hide_other_end
echo $append %other_sequence_3% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file%

:hide_other_4
IF %other_sequence_4%==none goto :hide_other_end
echo $append %other_sequence_4% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_other_5
IF %other_sequence_5%==none goto :hide_other_end
echo $append %other_sequence_5% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_other_6
IF %other_sequence_6%==none goto :hide_other_end
echo $append %other_sequence_6% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_other_7
IF %other_sequence_7%==none goto :hide_other_end
echo $append %other_sequence_7% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_other_8
IF %other_sequence_8%==none goto :hide_other_end
echo $append %other_sequence_8% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 
:hide_other_end

:hide_secondary_attack
:hide_secondary_attack_1
IF %secondary_attack_sequence_1%==none goto :hide_secondary_attack_end
IF %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_1% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_1% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_secondary_attack_2
IF %secondary_attack_sequence_2%==none goto :hide_secondary_attack_end
IF %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_2% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_2% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_secondary_attack_3
IF %secondary_attack_sequence_3%==none goto :hide_secondary_attack_end
IF %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_3% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_3% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 

:hide_secondary_attack_4
IF %secondary_attack_sequence_4%==none goto :hide_secondary_attack_end
IF %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_4% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%
IF NOT %Keep_secondary_attack_visible(y/n)%==y echo $append %secondary_attack_sequence_4% %hide_origin_value% fadein 0.0 fadeout 0.0 snap >> %qc_file% 
:hide_secondary_attack_end


::remove blends only if using custom animations
IF %custom_vm%==on IF EXIST "%dev_folder%\decompiled_custom_animations\%qc_file%" goto :remove_blends
goto :EOF
:remove_blends

:remove_blends_draw
IF %Keep_draw_visible(y/n)%==y goto :remove_blends_draw_done
set operating_sequence_1=%draw_sequence%
set operating_sequence_2=none
set operating_sequence_3=none
set operating_sequence_4=none
set operating_sequence_5=none
set operating_sequence_6=none
set operating_sequence_7=none
set operating_sequence_8=none
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_of_sequence.bat"
:remove_blends_draw_done

:remove_blends_idle
IF %Keep_idle_visible(y/n)%==y goto :remove_blends_idle_done
set operating_sequence_1=%idle_sequence%
set operating_sequence_2=none
set operating_sequence_3=none
set operating_sequence_4=none
set operating_sequence_5=none
set operating_sequence_6=none
set operating_sequence_7=none
set operating_sequence_8=none
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_of_sequence.bat"
:remove_blends_idle_done

:remove_blends_attack
IF %Keep_attack_visible(y/n)%==y goto :remove_blends_attack_done
set operating_sequence_1=%attack_sequence_1%
set operating_sequence_2=%attack_sequence_2%
set operating_sequence_3=%attack_sequence_3%
set operating_sequence_4=%attack_sequence_4%
set operating_sequence_5=%attack_sequence_5%
set operating_sequence_6=%attack_sequence_6%
set operating_sequence_7=none
set operating_sequence_8=none
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_of_sequence.bat"
:remove_blends_attack_done

:remove_blends_reload
IF %Keep_reload_visible(y/n)%==y goto :remove_blends_reload_done
set operating_sequence_1=%reload_sequence_1%
set operating_sequence_2=%reload_sequence_2%
set operating_sequence_3=%reload_sequence_3%
set operating_sequence_4=%reload_sequence_4%
set operating_sequence_5=%reload_sequence_5%
set operating_sequence_6=%reload_sequence_6%
set operating_sequence_7=%reload_sequence_7%
set operating_sequence_8=%reload_sequence_8%
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_of_sequence.bat"
:remove_blends_reload_done

:remove_blends_secondary_attack
IF %Keep_secondary_attack_visible(y/n)%==y goto :remove_blends_secondary_attack_done
set operating_sequence_1=%secondary_attack_sequence_1%
set operating_sequence_2=%secondary_attack_sequence_2%
set operating_sequence_3=%secondary_attack_sequence_3%
set operating_sequence_4=%secondary_attack_sequence_4%
set operating_sequence_5=none
set operating_sequence_6=none
set operating_sequence_7=none
set operating_sequence_8=none
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_of_sequence.bat"
:remove_blends_secondary_attack_done

:remove_blends_other
set operating_sequence_1=%other_sequence_1%
set operating_sequence_2=%other_sequence_2%
set operating_sequence_3=%other_sequence_3%
set operating_sequence_4=%other_sequence_4%
set operating_sequence_5=%other_sequence_5%
set operating_sequence_6=%other_sequence_6%
set operating_sequence_7=%other_sequence_7%
set operating_sequence_8=%other_sequence_8%
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_of_sequence.bat"











