::used for replacing snap with fadein and fadeout values in the whole qc
::also removes fadein 0.2 and fadeout 0.2 as they are default anyway

@echo off
cd "%qc_folder_temp%"

IF EXIST snap_replaced.qc del snap_replace.qc >nul
FOR /F "tokens=*" %%A IN (%qc_file%) DO (
	IF NOT "%%A" EQU "snap" IF NOT "%%A" EQU "fadein 0.2" IF NOT "%%A" EQU "fadeout 0.2" IF NOT "%%A" EQU "}" ECHO.%%A
	IF "%%A" EQU "snap" set snap_detected=yes
	IF "%%A" EQU "}" IF NOT !snap_detected!==yes ECHO.}
	IF "%%A" EQU "}" IF !snap_detected!==yes (
		ECHO.fadein 0.0
		ECHO.fadeout 0.1
		ECHO.}
		set snap_detected=no )
	) >> snap_replaced.qc
move "snap_replaced.qc" "%qc_file%" >nul
IF EXIST snap_replaced.qc del snap_replace.qc >nul
	
