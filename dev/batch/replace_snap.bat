@echo off
cd "%qc_folder_temp%"
set qc_file_output=%qc_file%_edited

::delete output and temp files just in case they exist already
IF EXIST "%qc_file_output%" del "%qc_file_output%"
IF EXIST "temp_replace_snap" del "temp_replace_snap"
IF EXIST "temp_replace_snap_2" del "temp_replace_snap_2"

::remove fadein and fadeout 0.2 as they are default anyway
findstr /i /v /c:"fadein 0.2" %qc_file% > temp_replace_snap
findstr /i /v /c:"fadeout 0.2" temp_replace_snap > temp_replace_snap_2
IF EXIST "temp_replace_snap" del "temp_replace_snap"
IF EXIST "temp_replace_snap_2" ren "temp_replace_snap_2" "temp_replace_snap"

::add fadeout 0.0 under snap 
FOR /F "tokens=*" %%A IN (temp_replace_snap) DO (
  ECHO %%A
  IF "%%A" EQU "snap" (
    ECHO fadein 0.0
  )
) >> temp_replace_snap_2
IF EXIST "temp_replace_snap" del "temp_replace_snap"
IF EXIST "temp_replace_snap_2" ren "temp_replace_snap_2" "temp_replace_snap"

::remove snap
findstr /i /v /c:"snap" temp_replace_snap > %qc_file_output%

::remove temp files
IF EXIST "temp_replace_snap" del "temp_replace_snap"
IF EXIST "temp_replace_snap_2" del "temp_replace_snap_2"

::replace original files
IF EXIST "%qc_file%" del "%qc_file%"
IF EXIST "%qc_file_output%" ren "%qc_file_output%" "%qc_file%"