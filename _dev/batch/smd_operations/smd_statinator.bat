::used to make a set of .smd animations static
::just set operating_smd_1 - operating_smd_10 and call the script
::make sure to set unused smds to none - they could carry over from before

::template
:: set operating_smd_1=none
:: set operating_smd_2=none
:: set operating_smd_3=none
:: set operating_smd_4=none
:: set operating_smd_5=none
:: set operating_smd_6=none
:: set operating_smd_7=none
:: set operating_smd_8=none
:: set operating_smd_9=none
:: set operating_smd_10=none
:: call "%dev_folder%\batch\smd_operations\smd_statinator.bat"

@echo off

::reset unused vars
IF NOT DEFINED operating_smd_1 set operating_smd_1=none
IF NOT DEFINED operating_smd_2 set operating_smd_2=none
IF NOT DEFINED operating_smd_3 set operating_smd_3=none
IF NOT DEFINED operating_smd_4 set operating_smd_4=none
IF NOT DEFINED operating_smd_5 set operating_smd_5=none
IF NOT DEFINED operating_smd_6 set operating_smd_6=none
IF NOT DEFINED operating_smd_7 set operating_smd_7=none
IF NOT DEFINED operating_smd_8 set operating_smd_8=none
IF NOT DEFINED operating_smd_9 set operating_smd_9=none
IF NOT DEFINED operating_smd_10 set operating_smd_10=none

::exit if idle does not exist
IF %idle_smd%==none goto :EOF
cd "%smd_folder%"
IF NOT EXIST "%idle_smd%" goto :EOF

:extract_nodes_and_first_frame
::only extract once per weapon
IF NOT DEFINED last_smd set last_sequence=none
IF "%last_sequence%" EQU "%idle_sequence%" goto :extract_nodes_and_first_frame_done
set "last_sequence=%idle_sequence%"
::extract nodes
cd "%smd_folder%"
IF EXIST nodes del nodes >nul
FOR /F "tokens=*" %%A IN (%idle_smd%) DO (
	echo %%A
	IF %%A==skeleton goto :nodes_extracted ) >> nodes
:nodes_extracted
::extract first frame of idle
IF EXIST first_frame del first_frame >nul
set echo_now=off
FOR /F "tokens=*" %%A IN (%idle_smd%) DO (
	IF "%%A" EQU "time 0" set echo_now=on
	IF NOT "%%A" EQU "time 0" IF NOT "%%A" EQU "time 1" IF !echo_now!==on ECHO %%A
	IF "%%A" EQU "time 1" goto :extract_nodes_and_first_frame_done ) >> first_frame
:extract_nodes_and_first_frame_done

:process_smds
IF %operating_smd_1%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_1%
call :smd_statinator

IF %operating_smd_2%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_2%
call :smd_statinator

IF %operating_smd_3%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_3%
call :smd_statinator

IF %operating_smd_4%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_4%
call :smd_statinator

IF %operating_smd_5%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_5%
call :smd_statinator

IF %operating_smd_6%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_6%
call :smd_statinator

IF %operating_smd_7%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_7%
call :smd_statinator

IF %operating_smd_8%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_8%
call :smd_statinator

IF %operating_smd_9%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_9%
call :smd_statinator

IF %operating_smd_10%==none goto :process_smds_done
set smd_to_make_static=%operating_smd_10%
call :smd_statinator
:process_smds_done

::exit
goto :EOF


:smd_statinator
cd "%smd_folder%"
::delete temp - except nodes
IF EXIST framecount del framecount >nul
IF EXIST addedframes del addedframes >nul
IF EXIST static.smd del static.smd >nul
::extract number of frames
findstr /i /c:"time" "%smd_to_make_static%" > framecount
::add frames
FOR /F "tokens=*" %%A IN (framecount) DO (
	echo %%A
	type first_frame ) >> addedframes
::build file and replace original
copy "nodes" + "addedframes" "static.smd" >nul
echo end >> static.smd
move "static.smd" "%smd_to_make_static%" >nul
::delete temp
IF EXIST framecount del framecount >nul
IF EXIST addedframes del addedframes >nul
IF EXIST static.smd del static.smd >nul
::exit call
exit /b