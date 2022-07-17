::adds snap (fadein 0.0) to all draws to avoid blending issues
IF %draw_sequence%==none goto :EOF
cd %qc_folder_temp%
echo $append %draw_sequence% { >> %qc_file%
echo fadein 0.0 >> %qc_file%
echo } >> %qc_file%