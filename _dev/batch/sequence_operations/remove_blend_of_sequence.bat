::used to remove blends that use the mentioned sequence
::if the current sequence is "knife_idle", it will remove all blends that use "knife_idle" (addlayer "knife_idle", blendlayer "knife_idle")
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
:: call "%dev_folder%\batch\sequence_operations\remove_blend_of_sequence.bat"

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

:process_sequences
IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_1%
call :blend_remover

IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_2%
call :blend_remover

IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_3%
call :blend_remover

IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_4%
call :blend_remover

IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_5%
call :blend_remover

IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_6%
call :blend_remover

IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_7%
call :blend_remover

IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_8%
call :blend_remover

IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_9%
call :blend_remover

IF %operating_sequence_1%==none goto :process_sequences_done
set sequence_to_remove_blend_from=%operating_sequence_10%
call :blend_remover
:process_sequences_done

::exit
goto :EOF


:blend_remover
cd "%qc_folder_temp%"
::remove temp
IF EXIST no_blendlayer_temp del no_blendlayer_temp >nul
IF EXIST no_addlayer_temp del no_addlayer_temp >nul
::remove mentions of blend for that sequence
FINDSTR /v /i /r /c:"blendlayer .%sequence_to_remove_blend_from%." "%qc_file%" > no_blendlayer_temp
FINDSTR /v /i /r /c:"addlayer .%sequence_to_remove_blend_from%." "no_blendlayer_temp" > no_addlayer_temp
::replace qc again
move "no_addlayer_temp" "%qc_file%" >nul
::clean temp again and exit
IF EXIST no_blendlayer_temp del no_blendlayer_temp >nul
IF EXIST no_addlayer_temp del no_addlayer_temp >nul
EXIT /b