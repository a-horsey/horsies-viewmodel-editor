IF NOT %•Remove_shells(y/n)%==y goto :EOF
cd "%qc_folder_temp%"

:process_attacks
IF %attack_sequence_1%==none goto :process_attacks_done
set sequence_to_remove_shell_from=%attack_sequence_1%
call :shell_remover

IF %attack_sequence_2%==none goto :process_attacks_done
set sequence_to_remove_shell_from=%attack_sequence_2%
call :shell_remover

IF %attack_sequence_3%==none goto :process_attacks_done
set sequence_to_remove_shell_from=%attack_sequence_3%
call :shell_remover

IF %attack_sequence_4%==none goto :process_attacks_done
set sequence_to_remove_shell_from=%attack_sequence_4%
call :shell_remover

IF %attack_sequence_5%==none goto :process_attacks_done
set sequence_to_remove_shell_from=%attack_sequence_5%
call :shell_remover

IF %attack_sequence_6%==none goto :process_attacks_done
set sequence_to_remove_shell_from=%attack_sequence_6%
call :shell_remover
:process_attacks_done

:process_reloads
IF %reload_sequence_1%==none goto :process_reloads_done
set sequence_to_remove_shell_from=%reload_sequence_1%
call :shell_remover

IF %reload_sequence_2%==none goto :process_reloads_done
set sequence_to_remove_shell_from=%reload_sequence_2%
call :shell_remover

IF %reload_sequence_3%==none goto :process_reloads_done
set sequence_to_remove_shell_from=%reload_sequence_3%
call :shell_remover

IF %reload_sequence_4%==none goto :process_reloads_done
set sequence_to_remove_shell_from=%reload_sequence_4%
call :shell_remover

IF %reload_sequence_5%==none goto :process_reloads_done
set sequence_to_remove_shell_from=%reload_sequence_5%
call :shell_remover

IF %reload_sequence_6%==none goto :process_reloads_done
set sequence_to_remove_shell_from=%reload_sequence_6%
call :shell_remover

IF %reload_sequence_7%==none goto :process_reloads_done
set sequence_to_remove_shell_from=%reload_sequence_7%
call :shell_remover

IF %reload_sequence_8%==none goto :process_reloads_done
set sequence_to_remove_shell_from=%reload_sequence_8%
call :shell_remover
:process_reloads_done

::exit
goto :EOF

:shell_remover
cd "%qc_folder_temp%"
::del temp just in case
IF EXIST remove_shell_temp del remove_shell_temp >nul
IF EXIST noshell.qc del noshell.qc >nul
:extract_sequence
set sequence_found=no
for /f "usebackq tokens=*" %%x in (`findstr /v /i /c:"{ event 6002" "%qc_file%"`) do (
	IF "%%x" EQU "$sequence "%sequence_to_remove_shell_from%" {" set sequence_found=yes
	IF !sequence_found!==yes IF "%%x" EQU "}" goto :sequence_extracted
	IF !sequence_found!==yes IF NOT "%%x" EQU "$sequence "%sequence_to_remove_shell_from%" {" IF NOT "%%x" EQU "}" echo.%%x ) >> remove_shell_temp
:sequence_extracted
::replace_sequence
set sequence_found=no
for /f "tokens=*" %%a in (%qc_file%) do (
	IF "%%a" EQU "$sequence "%sequence_to_remove_shell_from%" {" set sequence_found=yes
	IF !sequence_found!==yes IF "%%a" EQU "}" (
		echo.$sequence "%sequence_to_remove_shell_from%" {
		type remove_shell_temp
		set sequence_found=no )
	IF NOT !sequence_found!==yes IF NOT "%%a" EQU "$sequence "%sequence_to_remove_shell_from%" {" echo.%%a ) >> noshell.qc
::replace qc file
move "noshell.qc" "%qc_file%" >nul
::del temp and exit
IF EXIST remove_shell_temp del remove_shell_temp >nul
IF EXIST noshell.qc del noshell.qc >nul
exit /b
