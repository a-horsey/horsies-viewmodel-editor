@echo off

::set directories
::set base_folder=%cd%
::set smd_folder=%cd%\decompiled_animations\c_scout_animations_anims
::set qc_folder_temp=%cd%\decompiled_animations
::set qc_file=c_scout_animations.qc

::set idle smd
::set idle_smd=none

::set attack smds
::set attack_smd_1=none
::set attack_smd_2=none
::set attack_smd_3=none
::set attack_smd_4=none
::set attack_smd_5=none
::set attack_smd_6=none

::set idle sequence
::set idle_sequence=none

::set attack sequences
::set attack_sequence_1=none
::set attack_sequence_2=none
::set attack_sequence_3=none
::set attack_sequence_4=none
::set attack_sequence_5=none
::set attack_sequence_6=none

:check_setting_draw
IF NOT %•Static_draw(y/n)%==y goto :check_setting_idle
:check_draw_1
IF NOT %•Hidden(y/n)%==y goto :process_draw
IF %•Hidden(y/n)%==y goto :check_draw_2
:check_draw_2
IF %Keep_draw_visible(y/n)%==y goto :process_draw
IF NOT %Keep_draw_visible(y/n)%==y goto :check_setting_idle

:process_draw
cd "%smd_folder%"

:count_frames_draw
IF NOT EXIST %draw_smd% goto :count_frames_draw_done
set smd_to_count=%draw_smd%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A draw_smd_frames=%%b
    )
  )
:count_frames_draw_done

::add frame numbers for draw
cd "%qc_folder_temp%"
IF %draw_sequence%==none goto :add_frames_done
echo $append %draw_sequence% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %draw_smd_frames% >> %qc_file%
echo } >> %qc_file%

::replace smd with idle
cd "%smd_folder%"
:replace draw_smd
IF EXIST %draw_smd% IF EXIST %idle_smd% (
	copy %idle_smd% %draw_smd%
	)
	
::special check for scout to remove buggy particle if the weapon is a drink
IF %draw_sequence%==ed_draw goto :remove_drink_particle
goto :check_setting_idle
:remove_drink_particle
cd "%qc_folder_temp%"
findstr /i /v /l "AE_CL_CREATE_PARTICLE_EFFECT" %qc_file% >> temp_draw_idle_drinks_special
move temp_draw_idle_drinks_special %qc_file%


:check_setting_idle
IF NOT %•More_static_idle(y/n)%==y goto :check_setting_attack
:check_idle_1
IF NOT %•Hidden(y/n)%==y goto :process_idle
IF %•Hidden(y/n)%==y goto :check_idle_2
:check_idle_2
IF %Keep_idle_visible(y/n)%==y goto :process_idle
IF NOT %Keep_idle_visible(y/n)%==y goto :check_setting_attack

:process_idle
cd "%smd_folder%"

:count_frames_idle
IF NOT EXIST %idle_smd% goto :count_frames_idle_done
set smd_to_count=%idle_smd%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A idle_smd_frames=%%b
    )
  )
:count_frames_idle_done

::add frame numbers for idle
cd "%qc_folder_temp%"
:add_frames_idle
IF %idle_sequence%==none goto :add_frames_done
echo $append %idle_sequence% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %idle_smd_frames% >> %qc_file%
echo } >> %qc_file%

:check_setting_attack
IF NOT %•Static_attack(y/n)%==y goto :check_shove
:check_attack_1
IF NOT %•Hidden(y/n)%==y goto :process_attack
IF %•Hidden(y/n)%==y goto :check_attack_2
:check_attack_2
IF %Keep_attack_visible(y/n)%==y goto :process_attack
IF NOT %Keep_attack_visible(y/n)%==y goto :check_shove

:process_attack
cd "%smd_folder%"
:count_frames_attack_1
IF NOT EXIST %attack_smd_1% goto :count_frames_attack_done
set smd_to_count=%attack_smd_1%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A attack_smd_1_frames=%%b
    )
  )

:count_frames_attack_2
IF NOT EXIST %attack_smd_2% goto :count_frames_attack_done
set smd_to_count=%attack_smd_2%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A attack_smd_2_frames=%%b
    )
  )

:count_frames_attack_3
IF NOT EXIST %attack_smd_3% goto :count_frames_attack_done
set smd_to_count=%attack_smd_3%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A attack_smd_3_frames=%%b
    )
  )

:count_frames_attack_4
IF NOT EXIST %attack_smd_4% goto :count_frames_attack_done
set smd_to_count=%attack_smd_4%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A attack_smd_4_frames=%%b
    )
  )

:count_frames_attack_5
IF NOT EXIST %attack_smd_5% goto :count_frames_attack_done
set smd_to_count=%attack_smd_5%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A attack_smd_5_frames=%%b
    )
  )

:count_frames_attack_6
IF NOT EXIST %attack_smd_6% goto :count_frames_attack_done
set smd_to_count=%attack_smd_6%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A attack_smd_6_frames=%%b
    )
  )
:count_frames_attack_done

::add frame numbers for attack
cd "%qc_folder_temp%"
:add_frames_attack_1
IF %attack_sequence_1%==none goto :add_frames_done
echo $append %attack_sequence_1% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %attack_smd_1_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo } >> %qc_file%

:add_frames_attack_2
IF %attack_sequence_2%==none goto :add_frames_done
echo $append %attack_sequence_2% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %attack_smd_2_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo } >> %qc_file%

:add_frames_attack_3
IF %attack_sequence_3%==none goto :add_frames_done
echo $append %attack_sequence_3% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %attack_smd_3_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo } >> %qc_file%

:add_frames_attack_4
IF %attack_sequence_4%==none goto :add_frames_done
echo $append %attack_sequence_4% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %attack_smd_4_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo } >> %qc_file%

:add_frames_attack_5
IF %attack_sequence_5%==none goto :add_frames_done
echo $append %attack_sequence_5% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %attack_smd_5_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo } >> %qc_file%

:add_frames_attack_6
IF %attack_sequence_6%==none goto :add_frames_done
echo $append %attack_sequence_6% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %attack_smd_6_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo } >> %qc_file%
:add_frames_done

cd "%smd_folder%"
:replace attack_smd_1
IF EXIST %attack_smd_1% (
	copy %idle_smd% %attack_smd_1%
	)
	
:replace attack_smd_2
IF EXIST %attack_smd_2% (
	copy %idle_smd% %attack_smd_2%
	)
	
:replace attack_smd_3
IF EXIST %attack_smd_3% (
	copy %idle_smd% %attack_smd_3%
	)
	
:replace attack_smd_4
IF EXIST %attack_smd_4% (
	copy %idle_smd% %attack_smd_4%
	)
	
:replace attack_smd_5
IF EXIST %attack_smd_5% (
	copy %idle_smd% %attack_smd_5%
	)
	
:replace attack_smd_6
IF EXIST %attack_smd_6% (
	copy %idle_smd% %attack_smd_6%
	)


::special stuff
:check_shove
IF NOT %•Static_shove(y/n)%==y goto :process_shove_done
:check_shove_1
IF NOT %•Hidden(y/n)%==y goto :process_shove
IF %•Hidden(y/n)%==y goto :check_shove_2
:check_shove_2
IF %Keep_shove_visible(y/n)%==y goto :process_shove
IF NOT %Keep_shove_visible(y/n)%==y goto :process_shove_done

:process_shove
:count_frames_shove
cd %smd_folder%
::count frames for idle_smd
IF NOT EXIST %shove_smd% goto :count_frames_attack_done
set smd_to_count=%shove_smd%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A shove_smd_frames=%%b
    )
  )

:add_frames_shove
cd %qc_folder_temp%
IF %shove_sequence%==none goto :add_frames_done
echo $append %shove_sequence% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %shove_smd_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo } >> %qc_file%

:replace_shove_smd
cd %smd_folder%
IF EXIST %shove_smd% (
	copy %idle_smd% %shove_smd%
	)
:process_shove_done