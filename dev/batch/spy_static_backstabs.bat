::this script is for applying static settings to spy's backstabs

@echo off

:check_setting_backstab
IF NOT %•Static_backstab(y/n)%==y goto :check_backstab_detection
:check_backstab_1
IF NOT %•Hidden(y/n)%==y goto :check_setting_backstab_done
:check_backstab_2
IF NOT %Keep_backstab_visible(y/n)%==y goto :check_backstab_detection
:check_setting_backstab_done

:process_backstab
cd "%smd_folder%"

:count_frames_backstab
IF NOT EXIST %backstab_attack_smd% goto :count_frames_backstab_done
set smd_to_count=%backstab_attack_smd%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A backstab_frames=%%b
    )
  )

IF NOT EXIST %backstab_stun_smd% goto :count_frames_backstab_done
set smd_to_count=%backstab_stun_smd%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A backstab_stun_frames=%%b
    )
  )
:count_frames_backstab_done

::add frame numbers for backstab
cd "%qc_folder_temp%"
:add_frames_backstab
IF %backstab_attack_sequence%==none goto :add_frames_done
echo $append %backstab_attack_sequence% { >> %qc_file%
echo numframes %backstab_frames% >> %qc_file%
echo frame 0 0 >> %qc_file%
echo fadein 0.2>> %qc_file%
echo } >> %qc_file%

IF %backstab_stun_sequence%==none goto :add_frames_done
echo $append %backstab_stun_sequence% { >> %qc_file%
echo numframes %backstab_stun_frames% >> %qc_file%
echo frame 0 0 >> %qc_file%
echo fadein 0.2>> %qc_file%
echo } >> %qc_file%
:add_frames_done

::replace smd with idle
cd "%smd_folder%"
:replace draw_smd
IF EXIST %backstab_attack_smd% IF EXIST %idle_smd% (
	copy %idle_smd% %backstab_attack_smd% >nul
	)
	
:check_backstab_detection
IF NOT %•Static_backstab_detection(y/n)%==y goto :eof
:check_backstab_det_1
IF NOT %•Hidden(y/n)%==y goto :check_backstab_detection_done
IF %•Hidden(y/n)%==y goto :check_backstab_det_2
:check_backstab_det_2
IF NOT %Keep_backstab_detection_visible(y/n)%==y goto :eof
:check_backstab_detection_done

::count frames for backstab detections
cd "%smd_folder%"

:count_frames_backstab_up
IF NOT EXIST %backstab_detect_smd_up% goto :count_frames_backstab_det_done
set smd_to_count=%backstab_detect_smd_up%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A backstab_detect_smd_up_frames=%%b
    )
  )



:count_frames_backstab_down
IF NOT EXIST %backstab_detect_smd_down% goto :count_frames_backstab_det_done
set smd_to_count=%backstab_detect_smd_down%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A backstab_detect_smd_down_frames=%%b
    )
  )

:count_frames_backstab_idle
IF NOT EXIST %backstab_detect_smd_idle% goto :count_frames_backstab_det_done
set smd_to_count=%backstab_detect_smd_idle%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A backstab_detect_smd_idle_frames=%%b
    )
  )
:count_frames_backstab_det_done

::add frames to qc
cd "%qc_folder_temp%"

:add_frames_backstab_detect_smd_up
IF %backstab_detect_sequence_up%==none goto :add_frames_det_done
echo $append %backstab_detect_sequence_up% { >> %qc_file%
echo numframes %backstab_detect_smd_up_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo frame 0 0 >> %qc_file%
echo } >> %qc_file%

:add_frames_backstab_detect_smd_down
IF %backstab_detect_sequence_down%==none goto :add_frames_det_done
echo $append %backstab_detect_sequence_down% { >> %qc_file%
echo numframes %backstab_detect_smd_down_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo frame 0 0 >> %qc_file%
echo } >> %qc_file%

:add_frames_backstab_detect_smd_idle
IF %backstab_detect_sequence_idle%==none goto :add_frames_det_done
echo $append %backstab_detect_sequence_idle% { >> %qc_file%
echo numframes %backstab_detect_smd_idle_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%
echo frame 0 0 >> %qc_file%
echo } >> %qc_file%

:add_frames_det_done


::replace smds with idles
cd "%smd_folder%"

IF EXIST %backstab_detect_smd_up% IF EXIST %idle_smd% (
	copy %idle_smd% %backstab_detect_smd_up% >nul
	)
	
IF EXIST %backstab_detect_smd_down% IF EXIST %idle_smd% (
	copy %idle_smd% %backstab_detect_smd_down% >nul
	)
	
IF EXIST %backstab_detect_smd_idle% IF EXIST %idle_smd% (
	copy %idle_smd% %backstab_detect_smd_idle% >nul
	)


