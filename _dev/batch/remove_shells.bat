IF NOT %•Remove_shells(y/n)%==y goto :EOF

cd "%qc_folder_temp%"

::del temp just in case
IF EXIST remove_shell_temp del remove_shell_temp >nul
::remove events
set sequence_found=no
for /f "tokens=*" %%x in (%qc_file%) do (
	set "echo_line=%%x"
	set "check_line=!echo_line: =!"
	set "check_line=!check_line:	=!"
	IF NOT %sequence_1%==none IF "!check_line!" EQU "$sequence"%sequence_1%"{" set "sequence_found=yes"
	IF NOT %sequence_2%==none IF "!check_line!" EQU "$sequence"%sequence_2%"{" set "sequence_found=yes"
	IF NOT %sequence_3%==none IF "!check_line!" EQU "$sequence"%sequence_3%"{" set "sequence_found=yes"
	IF NOT %sequence_4%==none IF "!check_line!" EQU "$sequence"%sequence_4%"{" set "sequence_found=yes"
	IF NOT %sequence_5%==none IF "!check_line!" EQU "$sequence"%sequence_5%"{" set "sequence_found=yes"
	IF NOT %sequence_6%==none IF "!check_line!" EQU "$sequence"%sequence_6%"{" set "sequence_found=yes"
	IF NOT %sequence_7%==none IF "!check_line!" EQU "$sequence"%sequence_7%"{" set "sequence_found=yes"
	IF NOT %sequence_8%==none IF "!check_line!" EQU "$sequence"%sequence_8%"{" set "sequence_found=yes"
	IF NOT %sequence_9%==none IF "!check_line!" EQU "$sequence"%sequence_9%"{" set "sequence_found=yes"
	IF NOT %sequence_10%==none IF "!check_line!" EQU "$sequence"%sequence_10%"{" set "sequence_found=yes"
	IF "!check_line!" EQU "}" set "sequence_found=no"
	IF NOT !sequence_found!==yes echo !echo_line!
	IF !sequence_found!==yes echo !echo_line:{ event 6002=////{ event 6002! ) >> remove_shell_temp
::replace qc
IF EXIST remove_shell_temp move "remove_shell_temp" "%qc_file%" >nul

