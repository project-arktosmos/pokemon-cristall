	object_const_def
	const BLUESHOUSE_DAISY

BluesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DaisyScript:
	faceplayer
	opentext
	readvar VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutToWhite
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	promptbutton
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end

DaisyHelloText:
	text "DAISY: Hola! El"
	line "meu germà petit és"

	para "el LÍDER del GIM"
	line "de CIUTAT"
	cont "VIRIDIAN."

	para "Però surt de la"
	line "ciutat tan sovint"

	para "que causa"
	line "problemes"
	cont "als entrenadors."
	done

DaisyOfferGroomingText:
	text "DAISY: Hola! Bones"
	line "hores. Ara prendré"
	cont "una mica de te."

	para "Vols"
	line "acompanyar-me?"

	para "Ai, els teus"
	line "#MON"
	cont "estan una mica"
	cont "bruts."

	para "Vols que en"
	line "pentini"
	cont "un?"
	done

DaisyWhichMonText:
	text "DAISY: Quin vols"
	line "que pentini?"
	done

DaisyAlrightText:
	text "DAISY: D'acord,"
	line "el deixaré ben"
	cont "bonic de seguida."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " sembla"
	line "content."
	done

DaisyAllDoneText:
	text "DAISY: Aquí el"
	line "tens! Ja està."

	para "Veus? No et sembla"
	line "que està bonic?"

	para "És un #MON tan"
	line "bufó."
	done

DaisyAlreadyGroomedText:
	text "DAISY: Sempre"
	line "prenc el te a"

	para "aquesta hora. Vine"
	line "a fer-me"
	cont "companyia."
	done

DaisyRefusedText:
	text "DAISY: No en vols"
	line "cap de pentinat?"

	para "D'acord, només"
	line "prendrem el te."
	done

DaisyCantGroomEggText:
	text "DAISY: Ui,"
	line "perdona."
	cont "Sincerament, no"
	cont "puc pentinar un"
	cont "OU."
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
