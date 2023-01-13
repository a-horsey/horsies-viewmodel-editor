::used to remove snap from a set of specific sequences
::set operating_sequence_1 - operating_sequence_10 and call the script
::make sure to set unused sequences to none - they could carry over from before

::template
:: set operating_sequence_1=none
:: set operating_sequence_2=none
:: set operating_sequence_3=none
:: set operating_sequence_4=none
:: set operating_sequence_5=none
:: set operating_sequence_6=none
:: set operating_sequence_7=none
:: set operating_sequence_8=none
:: set operating_sequence_9=none
:: set operating_sequence_10=none
:: call "%dev_folder%\batch\sequence_operations\remove_snap_from_sequences.bat"

@echo off

::reset unused vars
IF NOT DEFINED operating_sequence_1 set operating_sequence_1=none
IF NOT DEFINED operating_sequence_2 set operating_sequence_2=none
IF NOT DEFINED operating_sequence_3 set operating_sequence_3=none
IF NOT DEFINED operating_sequence_4 set operating_sequence_4=none
IF NOT DEFINED operating_sequence_5 set operating_sequence_5=none
IF NOT DEFINED operating_sequence_6 set operating_sequence_6=none
IF NOT DEFINED operating_sequence_7 set operating_sequence_7=none
IF NOT DEFINED operating_sequence_8 set operating_sequence_8=none
IF NOT DEFINED operating_sequence_9 set operating_sequence_9=none
IF NOT DEFINED operating_sequence_10 set operating_sequence_10=none

cd "%qc_folder_temp%"
::del temp just in case
IF EXIST remove_snap_temp del remove_snap_temp >nul
::remove snap
set sequence_found=no
for /f "tokens=*" %%x in (%qc_file%) do (
	set "echo_line=%%x"
	set "check_line=!echo_line: =!"
	set "check_line=!check_line:	=!"
	IF NOT %operating_sequence_1%==none IF "!check_line!" EQU "$sequence"%operating_sequence_1%"{" set "sequence_found=yes"
	IF NOT %operating_sequence_2%==none IF "!check_line!" EQU "$sequence"%operating_sequence_2%"{" set "sequence_found=yes"
	IF NOT %operating_sequence_3%==none IF "!check_line!" EQU "$sequence"%operating_sequence_3%"{" set "sequence_found=yes"
	IF NOT %operating_sequence_4%==none IF "!check_line!" EQU "$sequence"%operating_sequence_4%"{" set "sequence_found=yes"
	IF NOT %operating_sequence_5%==none IF "!check_line!" EQU "$sequence"%operating_sequence_5%"{" set "sequence_found=yes"
	IF NOT %operating_sequence_6%==none IF "!check_line!" EQU "$sequence"%operating_sequence_6%"{" set "sequence_found=yes"
	IF NOT %operating_sequence_7%==none IF "!check_line!" EQU "$sequence"%operating_sequence_7%"{" set "sequence_found=yes"
	IF NOT %operating_sequence_8%==none IF "!check_line!" EQU "$sequence"%operating_sequence_8%"{" set "sequence_found=yes"
	IF NOT %operating_sequence_9%==none IF "!check_line!" EQU "$sequence"%operating_sequence_9%"{" set "sequence_found=yes"
	IF NOT %operating_sequence_10%==none IF "!check_line!" EQU "$sequence"%operating_sequence_10%"{" set "sequence_found=yes"
	IF "!check_line!" EQU "}" set "sequence_found=no"
	IF NOT !sequence_found!==yes echo !echo_line!
	IF !sequence_found!==yes echo !echo_line:snap=////snap!
) >> remove_snap_temp
::replace qc
IF EXIST remove_snap_temp move "remove_snap_temp" "%qc_file%" >nul
