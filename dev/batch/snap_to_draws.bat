::adds snap (fadein 0.0) to all draws to avoid blending issues
IF %draw_sequence%==none goto :EOF
cd "%qc_folder_temp%"
echo $append %draw_sequence% fadein 0.0 fadeout 0.1 >> %qc_file%