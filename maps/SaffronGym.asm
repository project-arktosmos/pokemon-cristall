	object_const_def
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUIDE

SaffronGym_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuideWinScript
	writetext SaffronGymGuideText
	waitbutton
	closetext
	end

.SaffronGymGuideWinScript:
	writetext SaffronGymGuideWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd GymStatue2Script

SabrinaIntroText:
	text "SABRINA: Sabia"
	line "que vindries…"

	para "Fa tres anys vaig"
	line "tenir una visió"
	cont "de la teva visita."

	para "Vols la meva"
	line "MEDALLA."

	para "No m'agrada com-"
	line "batre, però és el"

	para "meu deure com a"
	line "LÍDER atorgar"

	para "MEDALLES a qui"
	line "demostri ser"
	cont "digne."

	para "Ja que ho desitges"
	line "et mostraré els"
	cont "meus poders!"
	done

SabrinaWinLossText:
	text "SABRINA: El teu"
	line "poder…"

	para "Supera amb escreix"
	line "el que preveia…"

	para "Potser no es pot"
	line "predir del tot"

	para "el que depara"
	line "el futur…"

	para "D'acord, has"
	line "guanyat. T'has"
	cont "guanyat la"
	cont "M.ANÍMIC"
	done

ReceivedMarshBadgeText:
	text "<PLAYER> ha rebut"
	line "la M.ANÍMIC."
	done

SabrinaMarshBadgeText:
	text "SABRINA: La"
	line "M.ANÍMIC allibera"

	para "els teus poders"
	line "subliminals…"

	para "Tot i que no vaig"
	line "predir bé el teu"
	cont "poder, això sí"
	cont "que ho sé del"
	cont "cert."

	para "Seràs un CAMPIÓ"
	line "cèlebre i"
	cont "estimat!"
	done

SabrinaFightDoneText:
	text "SABRINA: L'amor"
	line "pels teus #MON"

	para "ha superat el meu"
	line "poder psíquic…"

	para "El poder de l'amor"
	line "crec que també és"

	para "un tipus de poder"
	line "psíquic…"
	done

MediumRebeccaSeenText:
	text "El poder de tots"
	line "els que has vençut"
	cont "ve cap a mi!"
	done

MediumRebeccaBeatenText:
	text "Fort…"
	line "Massa fort…"
	done

MediumRebeccaAfterBattleText:
	text "Quina és la font"
	line "del teu poder?"
	done

PsychicFranklinSeenText:
	text "El poder psíquic"
	line "és el poder de la"
	cont "teva ànima."
	done

PsychicFranklinBeatenText:
	text "La teva ànima té"
	line "més poder que la"
	cont "meva!"
	done

PsychicFranklinAfterBattleText:
	text "Has enfortit la"
	line "teva ànima, no"
	cont "només habilitats."
	done

MediumDorisSeenText:
	text "Fufufufu…"
	line "Ho veig clarament."

	para "Puc veure dins"
	line "la teva ànima!"
	done

MediumDorisBeatenText:
	text "Tot i llegir-te,"
	line "he perdut…"
	done

MediumDorisAfterBattleText:
	text "Llamps! He oblidat"
	line "que vaig predir"
	cont "que perdria!"
	done

PsychicJaredSeenText:
	text "El DOJO DE LLUITA"
	line "del costat era"
	cont "el GIMNÀS abans."
	done

PsychicJaredBeatenText:
	text "No era rival…"
	done

PsychicJaredAfterBattleText:
	text "El REI DEL KARATE,"
	line "mestre del DOJO"

	para "DE LLUITA, va ser"
	line "derrotat per"
	cont "SABRINA."
	done

SaffronGymGuideText:
	text "Ei, futur CAMPIÓ!"

	para "Un entrenador tan"
	line "hàbil com tu"

	para "no cal que li"
	line "diguin com vèncer"

	para "#MON de tipus"
	line "psíquic, oi?"

	para "Espero grans coses"
	line "de tu!"

	para "Bona sort!"
	done

SaffronGymGuideWinText:
	text "Ha estat un altre"
	line "combat fantàstic!"
	done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuideScript, -1
