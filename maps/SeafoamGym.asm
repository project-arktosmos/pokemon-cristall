	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: Buaaah!"

	para "El meu GIMNÀS de"
	line "CINNABAR va"
	cont "cremar."

	para "Els meus #MON"
	line "de foc i jo estem"

	para "sense llar per"
	line "culpa del volcà."

	para "Buaaah!"

	para "Però he tornat a"
	line "treballar com a"

	para "LÍDER de GIMNÀS"
	line "en aquesta cova."

	para "Si em vences, et"
	line "donaré una MEDALLA"

	para "Ha! Més val que"
	line "portis ANTICREMA!"
	done

BlaineWinLossText:
	text "BLAINE: Increïble."
	line "M'he cremat…"

	para "T'has guanyat la"
	line "MEDALLA VOLCÀ!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> ha rebut"
	line "la MEDALLA VOLCÀ."
	done

BlaineAfterBattleText:
	text "BLAINE: He perdut"
	line "aquest cop, però"

	para "guanyaré el"
	line "pròxim cop."

	para "Quan reconstrueixi"
	line "el meu GIMNÀS de"

	para "CINNABAR, haurem"
	line "de fer la revenja."
	done

BlaineFightDoneText:
	text "BLAINE: Els meus"
	line "#MON de foc"

	para "seran encara més"
	line "forts. Ja ho"
	cont "veuràs!"
	done

SeafoamGymGuideWinText:
	text "Ei!"

	para "… Eh? Ja s'ha"
	line "acabat?"

	para "Perdona, perdona!"

	para "El GIMNÀS CINNABAR"
	line "no hi era, així"

	para "que no sabia on"
	line "trobar-te."

	para "Però, bé, ets prou"
	line "fort fins i tot"

	para "sense els"
	line "consells."
	cont "Sabia que"
	cont "guanyaries!"
	done

SeafoamGymGuideWinText2:
	text "Un GIMNÀS #MON"
	line "pot ser a"
	cont "qualsevol"

	para "lloc mentre el"
	line "LÍDER hi sigui."

	para "No cal cap"
	line "edifici."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
