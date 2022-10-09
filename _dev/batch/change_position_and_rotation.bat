@echo off

::don't apply if hidden is yes
IF %•Hidden(y/n)%==y goto :EOF
::don't apply at all if all values are 0
IF %X_position%==0 IF %Y_position%==0 IF %Z_position%==0 IF %X_rotation%==0 IF %Y_rotation%==0 IF %Z_rotation%==0 goto :EOF

cd %qc_folder_temp%
:apply_for_sequence_1
IF %sequence_1%==none goto :EOF
echo $append %sequence_1% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:apply_for_sequence_2
IF %sequence_2%==none goto :EOF
echo $append %sequence_2% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:apply_for_sequence_3
IF %sequence_3%==none goto :EOF
echo $append %sequence_3% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:apply_for_sequence_4
IF %sequence_4%==none goto :EOF
echo $append %sequence_4% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:apply_for_sequence_5
IF %sequence_5%==none goto :EOF
echo $append %sequence_5% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:apply_for_sequence_6
IF %sequence_6%==none goto :EOF
echo $append %sequence_6% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:apply_for_sequence_7
IF %sequence_7%==none goto :EOF
echo $append %sequence_7% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:apply_for_sequence_8
IF %sequence_8%==none goto :EOF
echo $append %sequence_8% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:apply_for_sequence_9
IF %sequence_9%==none goto :EOF
echo $append %sequence_9% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%

:apply_for_sequence_10
IF %sequence_10%==none goto :EOF
echo $append %sequence_10% origin %X_position% %Y_position% %Z_position% angles %X_rotation% %Y_rotation% %Z_rotation% >> %qc_file%