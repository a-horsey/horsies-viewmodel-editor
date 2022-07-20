:: This file resets the names of the sequences and SMDs to "none"
:: so I don't have to spam the class bat with "none" values
:: values set to "none" always get skipped by all scripts
:: this also serves as a template for available settings per-weapon


::set draw
set draw_sequence=none
::set draw smd
set draw_smd=none
::set idle
set idle_sequence=none
::set idle smd
set idle_smd=none
::set attack sequences
set attack_sequence_1=none
set attack_sequence_2=none
set attack_sequence_3=none
set attack_sequence_4=none
set attack_sequence_5=none
set attack_sequence_6=none
::set attack smds
set attack_smd_1=none
set attack_smd_2=none
set attack_smd_3=none
set attack_smd_4=none
set attack_smd_5=none
set attack_smd_6=none
::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=none
set reload_sequence_2=none
set reload_sequence_3=none
set reload_sequence_4=none
set reload_sequence_5=none
set reload_sequence_6=none
set reload_sequence_7=none
set reload_sequence_8=none
::set reload smds
set reload_smd_1=none
set reload_smd_2=none
set reload_smd_3=none
set reload_smd_4=none
set reload_smd_5=none
set reload_smd_6=none
set reload_smd_7=none
set reload_smd_8=none
::set extra sequences for hiding
set other_sequence_1=none
set other_sequence_2=none
set other_sequence_3=none
set other_sequence_4=none
set other_sequence_5=none
set other_sequence_6=none
set other_sequence_7=none
set other_sequence_8=none
::name all the sequences for positioning
set sequence_1=none
set sequence_2=none
set sequence_3=none
set sequence_4=none
set sequence_5=none
set sequence_6=none
set sequence_7=none
set sequence_8=none
set sequence_9=none
set sequence_10=none

::spy stuff
::set some spy-exclusive stuff for the backstab scripts
::backstab itself
set backstab_attack_sequence=none
set backstab_stun_sequence=none
set backstab_attack_smd=none
set backstab_stun_smd=none
::backstab detection
set backstab_detect_sequence_up=none
set backstab_detect_sequence_down=none
set backstab_detect_sequence_idle=none
set backstab_detect_smd_up=none
set backstab_detect_smd_down=none
set backstab_detect_smd_idle=none
::diagonal stabs
set diagonal_stab_smd=none

::special stuff
set shove_sequence=none
set shove_smd=none