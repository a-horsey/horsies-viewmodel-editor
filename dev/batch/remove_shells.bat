IF NOT %•Remove_shells(y/n)%==y goto :EOF
cd "%qc_folder_temp%"
findstr /i /v /l "6002" %qc_file% >> remove_shells_temp
move remove_shells_temp %qc_file%