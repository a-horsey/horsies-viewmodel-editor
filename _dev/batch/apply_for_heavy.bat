@echo off
title Applying Heavy Settings...
echo		 Applying Heavy Settings...
set settings_file=settings_heavy.txt
set "smd_folder=%qc_folder_temp%\c_heavy_animations_anims"
set qc_file=c_heavy_animations.qc
::replace snap
cd "%batch_folder%"
call replace_snap.bat

:miniguns
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::miniguns"

::set draw
set draw_sequence=m_draw
::set draw smd
set draw_smd=m_draw.smd

::set idle
set idle_sequence=m_idle
::set idle smd
set idle_smd=m_idle.smd

::set attack sequences
set attack_sequence_1=m_fire
set attack_sequence_2=m_spool_up
set attack_sequence_3=m_spool_down
set attack_sequence_4=m_spool_idle

::set attack smds
set attack_smd_1=m_fire.smd
set attack_smd_2=m_spool_up.smd
set attack_smd_3=m_spool_down.smd
set attack_smd_4=m_spool_idle.smd


::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=m_idle
set sequence_2=m_fire
set sequence_3=m_spool_up
set sequence_4=m_spool_down
set sequence_5=m_draw
set sequence_6=m_spool_idle

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:Shotguns
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::shotguns"

::set draw
set draw_sequence=draw
::set draw smd
set draw_smd=draw.smd

::set idle
set idle_sequence=idle
::set idle smd
set idle_smd=idle.smd

::set attack sequences
set attack_sequence_1=fire
::set attack smds
set attack_smd_1=fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=reload_start
set reload_sequence_2=reload_loop
set reload_sequence_3=reload_end

::set reload smds
set reload_smd_1=reload_start.smd
set reload_smd_2=reload_loop.smd
set reload_smd_3=reload_end.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=draw
set sequence_2=idle
set sequence_3=fire
set sequence_4=reload_start
set sequence_5=reload_loop
set sequence_6=reload_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:sandwich
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sandwich"

::set draw
set draw_sequence=sw_draw
::set draw smd
set draw_smd=sw_draw.smd

::set idle
set idle_sequence=sw_idle
::set idle smd
set idle_smd=sw_idle.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=sw_draw
set sequence_2=sw_idle

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:melee
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::melee"

::set draw
set draw_sequence=f_draw
::set draw smd
set draw_smd=f_draw.smd

::set idle
set idle_sequence=f_idle
::set idle smd
set idle_smd=f_idle.smd

::set attack sequences
set attack_sequence_1=f_swing_left
set attack_sequence_2=f_swing_right
set attack_sequence_3=f_swing_crit

::set attack smds
set attack_smd_1=f_swing_left.smd
set attack_smd_2=f_swing_right.smd
set attack_smd_3=f_swing_crit.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=f_swing_left
set sequence_2=f_swing_right
set sequence_3=f_swing_crit
set sequence_4=f_idle
set sequence_5=f_draw

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:boxing_gloves
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::boxinggloves"

::set draw
set draw_sequence=bg_draw
::set draw smd
set draw_smd=bg_draw.smd

::set idle
set idle_sequence=bg_idle
::set idle smd
set idle_smd=bg_idle.smd

::set attack sequences
set attack_sequence_1=bg_swing_left
set attack_sequence_2=bg_swing_right
set attack_sequence_3=bg_swing_crit

::set attack smds
set attack_smd_1=bg_swing_left.smd
set attack_smd_2=bg_swing_right.smd
set attack_smd_3=bg_swing_crit.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bg_swing_left
set sequence_2=bg_swing_right
set sequence_3=bg_swing_crit
set sequence_4=bg_idle
set sequence_5=bg_draw

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:boxing_gloves_part2
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::boxinggloves"

::set draw
set draw_sequence=bg_metal_draw
::set draw smd
set draw_smd=bg_metal_draw.smd

::set idle
set idle_sequence=bg_idle
::set idle smd
set idle_smd=bg_idle.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bg_metal_draw

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:bread_bite
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::breadbite"

::set draw
set draw_sequence=breadglove_draw_A
::set draw smd
set draw_smd=breadglove_draw_A.smd

::set idle
set idle_sequence=breadglove_idle_A
::set idle smd
set idle_smd=breadglove_idle_A.smd

::set attack sequences
set attack_sequence_1=breadglove_swing_left
set attack_sequence_2=breadglove_swing_right
set attack_sequence_3=breadglove_swing_crit

::set attack smds
set attack_smd_1=breadglove_swing_left.smd
set attack_smd_2=breadglove_swing_right.smd
set attack_smd_3=breadglove_swing_crit.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=breadglove_draw_A
set sequence_2=breadglove_idle_A
set sequence_3=breadglove_swing_left
set sequence_4=breadglove_swing_right
set sequence_5=breadglove_swing_crit

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:bread_bite_part2
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::breadbite"

::set draw
set draw_sequence=breadglove_draw_B
::set draw smd
set draw_smd=breadglove_draw_B.smd

::set idle
set idle_sequence=breadglove_idle_B
::set idle smd
set idle_smd=breadglove_idle_B.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=breadglove_draw_B
set sequence_2=breadglove_idle_B


::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:bread_bite_part3
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::breadbite"

::set draw
set draw_sequence=breadglove_draw_B
::set draw smd
set draw_smd=breadglove_draw_B.smd

::set idle
set idle_sequence=breadglove_idle_C
::set idle smd
set idle_smd=breadglove_idle_C.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=breadglove_draw_B
set sequence_2=breadglove_idle_C


::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:allclass_melee
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::allclassmelee"

::set draw
set draw_sequence=melee_allclass_draw
::set draw smd
set draw_smd=melee_allclass_draw.smd

::set idle
set idle_sequence=melee_allclass_idle
::set idle smd
set idle_smd=melee_allclass_idle.smd

::set attack sequences
set attack_sequence_1=melee_allclass_swing

::set attack smds
set attack_smd_1=melee_allclass_swing.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds


::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=melee_allclass_draw
set sequence_2=melee_allclass_idle
set sequence_3=melee_allclass_swing

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:grappling_hook
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::grapplehook"

::set draw
::set draw_sequence=grapple_draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=grapple_draw
set other_sequence_2=grapple_idle
set other_sequence_3=grapple_fire_start
set other_sequence_4=grapple_fire_idle
set other_sequence_5=grapple_pull_start
set other_sequence_6=grapple_pull_idle
set other_sequence_7=grapple_pull_end

::name all the sequences for positioning
set sequence_1=grapple_draw
set sequence_2=grapple_idle
set sequence_3=grapple_fire_start
set sequence_4=grapple_fire_idle
set sequence_5=grapple_pull_start
set sequence_6=grapple_pull_idle
set sequence_7=grapple_pull_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:passtime_ball
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::passtimeball"

::set draw
::set draw_sequence=PASSTIME_ball_pickup

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=PASSTIME_ball_pickup
set other_sequence_2=PASSTIME_ball_idle
set other_sequence_3=PASSTIME_ball_catch1
set other_sequence_4=PASSTIME_ball_catch2
set other_sequence_5=PASSTIME_ball_throw_end
set other_sequence_6=PASSTIME_ball_throw_start
set other_sequence_7=PASSTIME_ball_throw_loop

::name all the sequences for positioning
set sequence_1=PASSTIME_ball_pickup
set sequence_2=PASSTIME_ball_idle
set sequence_3=PASSTIME_ball_catch1
set sequence_4=PASSTIME_ball_catch2
set sequence_5=PASSTIME_ball_throw_end
set sequence_6=PASSTIME_ball_throw_start
set sequence_7=PASSTIME_ball_throw_loop

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:spell_cast
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::spellcast"

::set draw

::set idle
::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
::set reload smds

::set extra sequences for hiding
set other_sequence_1=spell_draw
set other_sequence_2=spell_fire

::name all the sequences for positioning
set sequence_1=spell_draw
set sequence_2=spell_fire

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:throw
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::throw"

::set draw
set draw_sequence=throw_draw
::set draw smd
set draw_smd=throw_draw.smd

::set idle
set idle_sequence=throw_idle
::set idle smd
set idle_smd=throw_idle.smd

::set attack sequences
set attack_sequence_1=throw_fire
::set attack smds
set attack_smd_1=throw_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=throw_draw
set sequence_2=throw_idle
set sequence_3=throw_fire

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:minigun_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::minigunsinspects"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=primary_inspect_start
set other_sequence_2=primary_inspect_idle
set other_sequence_3=primary_inspect_end

::name all the sequences for positioning
set sequence_1=primary_inspect_start
set sequence_2=primary_inspect_idle
set sequence_3=primary_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:shotguns_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::shotgunsinspects"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=secondary_inspect_start
set other_sequence_2=secondary_inspect_idle
set other_sequence_3=secondary_inspect_end

::name all the sequences for positioning
set sequence_1=secondary_inspect_start
set sequence_2=secondary_inspect_idle
set sequence_3=secondary_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:sandwich_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sandwichinspects"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=item1_inspect_start
set other_sequence_2=item1_inspect_idle
set other_sequence_3=item1_inspect_end

::name all the sequences for positioning
set sequence_1=item1_inspect_start
set sequence_2=item1_inspect_idle
set sequence_3=item1_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:melee_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::meleeinspects"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=melee_inspect_start
set other_sequence_2=melee_inspect_idle
set other_sequence_3=melee_inspect_end

::name all the sequences for positioning
set sequence_1=melee_inspect_start
set sequence_2=melee_inspect_idle
set sequence_3=melee_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:boxing_gloves_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::boxingglovesinspects"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=Alt1_inspect_start
set other_sequence_2=Alt1_inspect_idle
set other_sequence_3=Alt1_inspect_end

::name all the sequences for positioning
set sequence_1=Alt1_inspect_start
set sequence_2=Alt1_inspect_idle
set sequence_3=Alt1_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:bread_bite_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::breadbiteinspect"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=Alt2_inspect_start
set other_sequence_2=Alt2_inspect_idle
set other_sequence_3=Alt2_inspect_end

::name all the sequences for positioning
set sequence_1=Alt2_inspect_start
set sequence_2=Alt2_inspect_idle
set sequence_3=Alt2_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:eviction_notice_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::evictionnoticeinspect"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=Alt3_inspect_start
set other_sequence_2=Alt3_inspect_idle
set other_sequence_3=Alt3_inspect_end

::name all the sequences for positioning
set sequence_1=Alt3_inspect_start
set sequence_2=Alt3_inspect_idle
set sequence_3=Alt3_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:allclassmelee_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::allclassmeleeinspects"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=melee_allclass_inspect_start
set other_sequence_2=melee_allclass_inspect_idle
set other_sequence_3=melee_allclass_inspect_end

::name all the sequences for positioning
set sequence_1=melee_allclass_inspect_start
set sequence_2=melee_allclass_inspect_idle
set sequence_3=melee_allclass_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

::delete settings file 
cd %qc_folder_temp% 
del %settings_file%