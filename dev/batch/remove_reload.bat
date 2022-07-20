@echo off

::exit it not true
IF NOT %•Static_reload(y/n)%==y goto :eof

::some logic to not apply if the reload animation is hidden
IF NOT %•Hidden(y/n)%==y goto :start
IF %•Hidden(y/n)%==y goto :check_hide_reload
:check_hide_reload
IF %Keep_reload_visible(y/n)%==y goto :start
IF NOT %Keep_reload_visible(y/n)%==y goto :EOF

::count the frames for each smd and turn them into variables
:start
cd "%smd_folder%"

:count_smd_1
::count frames for reload_smd_1
IF NOT EXIST %reload_smd_1% goto :counting_done
set smd_to_count=%reload_smd_1%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A reload_smd_1_frames=%%b
    )
  )

:count_smd_2
::count frames for reload_smd_2
IF NOT EXIST %reload_smd_2% goto :counting_done
set smd_to_count=%reload_smd_2%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A reload_smd_2_frames=%%b
    )
  )

:count_smd_3
::count frames for reload_smd_3
IF NOT EXIST %reload_smd_3% goto :counting_done
set smd_to_count=%reload_smd_3%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A reload_smd_3_frames=%%b
    )
  )

:count_smd_4
::count frames for reload_smd_4
IF NOT EXIST %reload_smd_4% goto :counting_done
set smd_to_count=%reload_smd_4%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A reload_smd_4_frames=%%b
    )
  )

:count_smd_5
::count frames for reload_smd_5
IF NOT EXIST %reload_smd_5% goto :counting_done
set smd_to_count=%reload_smd_5%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A reload_smd_5_frames=%%b
    )
  )

:count_smd_6
::count frames for reload_smd_6
IF NOT EXIST %reload_smd_6% goto :counting_done
set smd_to_count=%reload_smd_6%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A reload_smd_6_frames=%%b
    )
  )

:count_smd_7
::count frames for reload_smd_7
IF NOT EXIST %reload_smd_7% goto :counting_done
set smd_to_count=%reload_smd_7%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A reload_smd_7_frames=%%b
    )
  )

:count_smd_8
::count frames for reload_smd_8
IF NOT EXIST %reload_smd_8% goto :counting_done
set smd_to_count=%reload_smd_8%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A reload_smd_8_frames=%%b
    )
  )
:counting_done

::replace reload SMD with idle SMD
cd "%smd_folder%"

:replace reload_smd_1
IF EXIST %reload_smd_1% (
	copy %idle_smd% %reload_smd_1%
	)
:replace reload_smd_2
IF EXIST %reload_smd_2% (
	copy %idle_smd% %reload_smd_2%
	)
:replace reload_smd_3
IF EXIST %reload_smd_3% (
	copy %idle_smd% %reload_smd_3%
	)
:replace reload_smd_4
IF EXIST %reload_smd_4% (
	copy %idle_smd% %reload_smd_4%
	)
:replace reload_smd_5
IF EXIST %reload_smd_5% (
	copy %idle_smd% %reload_smd_5%
	)
:replace reload_smd_6
IF EXIST %reload_smd_6% (
	copy %idle_smd% %reload_smd_6%
	)
:replace reload_smd_7
IF EXIST %reload_smd_7% (
	copy %idle_smd% %reload_smd_7%
	)
:replace reload_smd_8
IF EXIST %reload_smd_8% (
	copy %idle_smd% %reload_smd_8%
	)

::add frame numbers to qc files, also remove snap (fadein 0.0) for reload_1
cd "%qc_folder_temp%"
:frames_1
IF %reload_sequence_1%==none goto :EOF
echo $append %reload_sequence_1% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %reload_smd_1_frames% >> %qc_file%
echo fadein 0.2 >> %qc_file%				
echo } >> %qc_file%
:frames_2
IF %reload_sequence_2%==none goto :EOF
echo $append %reload_sequence_2% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %reload_smd_2_frames% >> %qc_file%		
if %reload_sequence_2_is_alternative_start%==true echo fadein 0.2 >> %qc_file%
echo } >> %qc_file%
:frames_3
IF %reload_sequence_3%==none goto :EOF
echo $append %reload_sequence_3% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %reload_smd_3_frames% >> %qc_file%			
echo } >> %qc_file%
:frames_4
IF %reload_sequence_4%==none goto :EOF
echo $append %reload_sequence_4% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %reload_smd_4_frames% >> %qc_file%			
echo } >> %qc_file%
:frames_5
IF %reload_sequence_5%==none goto :EOF
echo $append %reload_sequence_5% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %reload_smd_5_frames% >> %qc_file%			
echo } >> %qc_file%
:frames_6
IF %reload_sequence_6%==none goto :EOF
echo $append %reload_sequence_6% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %reload_smd_6_frames% >> %qc_file%			
echo } >> %qc_file%
:frames_7
IF %reload_sequence_7%==none goto :EOF
echo $append %reload_sequence_7% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %reload_smd_7_frames% >> %qc_file%			
echo } >> %qc_file%
:frames_8
IF %reload_sequence_8%==none goto :EOF
echo $append %reload_sequence_8% { >> %qc_file%
echo frame 0 0 >> %qc_file%
echo numframes %reload_smd_8_frames% >> %qc_file%			
echo } >> %qc_file%
