IF NOT %•Remove_shells(y/n)%==y goto :EOF
cd "%qc_folder_temp%"

::set sequences to check based on weapon
::empty value just in case
set sequence_to_remove_shell_from=none
::sniper
IF %qc_file%==c_sniper_animations.qc IF "%settings_label%" EQU "&::sniperrifles" set sequence_to_remove_shell_from=fire
IF %qc_file%==c_sniper_animations.qc IF "%settings_label%" EQU "&::smgs" set sequence_to_remove_shell_from=smg_fire
::scout
IF %qc_file%==c_scout_animations.qc IF "%settings_label%" EQU "&::scatterguns" set sequence_to_remove_shell_from=sg_reload_loop
IF %qc_file%==c_scout_animations.qc IF "%settings_label%" EQU "&::pistols" set sequence_to_remove_shell_from=p_fire
::engi
IF %qc_file%==c_engineer_animations.qc IF "%settings_label%" EQU "&::shotguns" set sequence_to_remove_shell_from=fj_fire
IF %qc_file%==c_engineer_animations.qc IF "%settings_label%" EQU "&::pistols" set sequence_to_remove_shell_from=pstl_fire
::pyro
IF %qc_file%==c_pyro_animations.qc IF "%settings_label%" EQU "&::shotguns" set sequence_to_remove_shell_from=fire
::soldier
IF %qc_file%==c_soldier_animations.qc IF "%settings_label%" EQU "&::shotguns" set sequence_to_remove_shell_from=fire
::heavy
IF %qc_file%==c_heavy_animations.qc IF "%settings_label%" EQU "&::shotguns" set sequence_to_remove_shell_from=fire

::exit if still empty
IF %sequence_to_remove_shell_from%==none goto :EOF

::call remover
call :shell_remover

::exit
goto :EOF

:shell_remover
cd "%qc_folder_temp%"
::del temp just in case
IF EXIST noshell.qc del noshell.qc >nul
::remove event from sequence
set sequence_found=no
for /f "tokens=*" %%a in (%qc_file%) do (
	IF "%%a" EQU "$sequence "%sequence_to_remove_shell_from%" {" set sequence_found=yes
	IF NOT "%%a" EQU "}" IF NOT !sequence_found!==yes echo.%%a
	IF "%%a" EQU "}" (
		set sequence_found=no
		echo.%%a )
    IF !sequence_found!==yes for /f "usebackq tokens=*" %%x in (`echo.%%a ^| findstr /v /i /c:"{ event 6002"`) do echo.%%x ) >> noshell.qc
::replace original qc
MOVE "noshell.qc" "%qc_file%" >nul
::exit call
exit /b