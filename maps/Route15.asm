	object_const_def
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL

Route15_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerTeacherColette:
	trainer TEACHER, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer TEACHER, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHillaryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyKipp:
	trainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyKippAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyTommyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJohnnyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyBilly:
	trainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyBillyAfterBattleText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball PP_UP

TeacherColetteSeenText:
	text "T'has oblidat"
	line "alguna cosa?"
	done

TeacherColetteBeatenText:
	text "Kyaaah!"
	done

TeacherColetteAfterBattleText:
	text "Abans de ser"
	line "mestra, m'oblidava"

	para "de moltes coses."
	done

TeacherHillarySeenText:
	text "Els dies de sol,"
	line "crec que els nens"

	para "preferirien jugar"
	line "al pati que"

	para "estudiar a"
	line "classe."
	done

TeacherHillaryBeatenText:
	text "No volia perdre…"
	done

TeacherHillaryAfterBattleText:
	text "Estudiar és"
	line "important, però"

	para "l'exercici també"
	line "és vital."
	done

SchoolboyKippSeenText:
	text "Espera. He de"
	line "trucar a la mare."
	done

SchoolboyKippBeatenText:
	text "Perdona, mare!"
	line "M'han guanyat!"
	done

SchoolboyKippAfterBattleText:
	text "La meva mare es"
	line "preocupa tant per"

	para "mi que l'he de"
	line "trucar sempre."
	done

SchoolboyTommySeenText:
	text "Lluitem!"
	line "No perdré!"
	done

SchoolboyTommyBeatenText:
	text "He oblidat fer els"
	line "deures!"
	done

SchoolboyTommyAfterBattleText:
	text "Sayonara! Ho acabo"
	line "d'aprendre a la"
	cont "classe de japonès."
	done

SchoolboyJohnnySeenText:
	text "Fem una excursió a"
	line "la TORRE RÀDIO de"

	para "LAVENDER per a"
	line "ciències socials."
	done

SchoolboyJohnnyBeatenText:
	text "Ets molt dur!"
	done

SchoolboyJohnnyAfterBattleText:
	text "Estic cansat de"
	line "caminar. Necessito"
	cont "fer un descans."
	done

SchoolboyBillySeenText:
	text "La meva classe"
	line "preferida és"
	cont "gimnàstica!"
	done

SchoolboyBillyBeatenText:
	text "Oh, no!"
	line "Com he pogut"
	cont "perdre?"
	done

SchoolboyBillyAfterBattleText:
	text "Si els #MON"
	line "fossin assignatura"
	cont "seria el millor!"
	done

Route15SignText:
	text "RUTA 15"

	para "CIUTAT FUCHSIA -"
	line "POBLE LAVENDER"
	done

Route15_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  2,  5, ROUTE_15_FUCHSIA_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_READ, Route15Sign

	def_object_events
	object_event 10, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	object_event 33, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	object_event 27, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyBilly, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
