@echo off

:check_setting_attack
IF NOT %•Static_attack(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_attack
IF %•Hidden(y/n)%==y IF NOT %Keep_attack_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_attack_visible(y/n)%==y goto :process_attack

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
echo $append %attack_sequence_1% frame 0 0 numframes %attack_smd_1_frames% fadein 0.2 fadeout 0.2 >> %qc_file%

:add_frames_attack_2
IF %attack_sequence_2%==none goto :add_frames_done
echo $append %attack_sequence_2% frame 0 0 numframes %attack_smd_2_frames% fadein 0.2 fadeout 0.2 >> %qc_file%

:add_frames_attack_3
IF %attack_sequence_3%==none goto :add_frames_done
echo $append %attack_sequence_3% frame 0 0 numframes %attack_smd_3_frames% fadein 0.2 fadeout 0.2 >> %qc_file%

:add_frames_attack_4
IF %attack_sequence_4%==none goto :add_frames_done
echo $append %attack_sequence_4% frame 0 0 numframes %attack_smd_4_frames% fadein 0.2 fadeout 0.2 >> %qc_file%

:add_frames_attack_5
IF %attack_sequence_5%==none goto :add_frames_done
echo $append %attack_sequence_5% frame 0 0 numframes %attack_smd_5_frames% fadein 0.2 fadeout 0.2 >> %qc_file%

:add_frames_attack_6
IF %attack_sequence_6%==none goto :add_frames_done
echo $append %attack_sequence_6% frame 0 0 numframes %attack_smd_6_frames% fadein 0.2 fadeout 0.2 >> %qc_file%
:add_frames_done

cd "%smd_folder%"
:replace attack_smd_1
IF EXIST %attack_smd_1% (
	copy %idle_smd% %attack_smd_1% >nul
	)
	
:replace attack_smd_2
IF EXIST %attack_smd_2% (
	copy %idle_smd% %attack_smd_2% >nul
	)
	
:replace attack_smd_3
IF EXIST %attack_smd_3% (
	copy %idle_smd% %attack_smd_3% >nul
	)
	
:replace attack_smd_4
IF EXIST %attack_smd_4% (
	copy %idle_smd% %attack_smd_4% >nul
	)
	
:replace attack_smd_5
IF EXIST %attack_smd_5% (
	copy %idle_smd% %attack_smd_5% >nul
	)
	
:replace attack_smd_6
IF EXIST %attack_smd_6% (
	copy %idle_smd% %attack_smd_6% >nul
	)