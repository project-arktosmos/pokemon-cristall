	object_const_def
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	def_scene_scripts
	scene_script WiseTriosRoomNoop1Scene, SCENE_WISETRIOSROOM_SAGE_BLOCKS
	scene_script WiseTriosRoomNoop2Scene, SCENE_WISETRIOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WiseTriosRoomWiseTrioCallback

WiseTriosRoomNoop1Scene:
	end

WiseTriosRoomNoop2Scene:
	end

WiseTriosRoomWiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, WiseTriosRoomSageBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, WiseTriosRoomSageReturnsMovement
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	promptbutton
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, WiseTriosRoomSageAllowsPassageMovement
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_WISETRIOSROOM_NOOP
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

WiseTriosRoomSageBlocksPlayerMovement:
	step LEFT
	step LEFT
	step_end

WiseTriosRoomSageReturnsMovement:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSageAllowsPassageMovement:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:
	text "Increïble…"

	para "SUICUNE, ENTEI i"
	line "RAIKOU s'han"
	cont "despertat…"

	para "S'està fent"
	line "realitat la"
	cont "llegenda?"
	done

WiseTriosRoomSage2Text:
	text "Ens entrenem a la"
	line "TORRE CREMADA,"

	para "però mai havíem"
	line "sentit que s'hi"

	para "obrís un forat."
	line "Algú l'ha d'haver"

	para "fet expressament."
	done

WiseTriosRoomSage3BlocksExitText:
	text "A la TORRE ESTANY"
	line "hi poden entrar"

	para "els qui tinguin la"
	line "MEDALLA D'ECRUTEAK"

	para "Però ara que"
	line "SUICUNE, RAIKOU"

	para "i ENTEI s'han"
	line "despertat, et"
	cont "prego"

	para "que no hi entris!"
	done

WiseTriosRoomSage3Text:
	text "Nosaltres, el TRIO"
	line "SAVI, som els"

	para "protectors dels"
	line "#MON"
	cont "llegendaris."
	done

SageGakuSeenText:
	text "Diu la llegenda"
	line "que quan aparegui"

	para "un entrenador que"
	line "pugui tocar les"

	para "ànimes dels"
	line "#MON,"
	cont "un #MON vindrà"

	para "a posar a prova"
	line "l'entrenador a la"

	para "TORRE ESTANY."

	para "La llegenda s'ha"
	line "fet realitat!"

	para "El #MON"
	line "llegendari SUICUNE"
	cont "ha arribat!"

	para "Nosaltres, el TRIO"
	line "SAVI, posarem a"

	para "prova si mereixes"
	line "entrar-hi!"
	done

SageGakuBeatenText:
	text "Més fort del que"
	line "pensàvem? Potser…"
	done

SageGakuAfterBattleText:
	text "Ah, així que ets"
	line "tu el qui diu que"

	para "va veure SUICUNE,"
	line "ENTEI i RAIKOU"
	cont "mentre dormien?"

	para "Increïble!"

	para "Diu la llegenda"
	line "que no es poden"
	cont "veure quan dormen…"
	done

SageMasaSeenText:
	text "Se't pot confiar"
	line "la veritat?"

	para "He de comprovar"
	line "si ets digne."
	done

SageMasaBeatenText:
	text "…T'explicaré"
	line "la veritat…"
	done

SageMasaAfterBattleText:
	text "Antigament, aquí"
	line "hi havia dues"
	cont "torres de 9 pisos."

	para "La TORRE LLAUTÓ,"
	line "on es deia que els"

	para "#MON es"
	line "despertaven, i la"

	para "TORRE ESTANY, on"
	line "es deia que"
	cont "descansaven."

	para "Les vistes des"
	line "dels cims de les"

	para "TORRES devien ser"
	line "magnífiques."

	para "Aleshores, es deia"
	line "que un #MON"

	para "immens de color"
	line "argent s'estava"

	para "al cim de la"
	line "TORRE LLAUTÓ."

	para "Però…"

	para "Fa uns 150 anys,"
	line "un llamp va colpir"

	para "una de les TORRES."

	para "Les flames la van"
	line "engolir durant"
	cont "tres dies."

	para "Un xàfec sobtat"
	line "finalment va"
	cont "apagar l'incendi."

	para "I així és com va"
	line "néixer la TORRE"
	cont "CREMADA."
	done

SageKojiSeenText:
	text "Deixa'm veure el"
	line "teu poder!"
	done

SageKojiBeatenText:
	text "Massa fort!"
	line "Com pot ser?"
	done

SageKojiAfterBattleQuestionText:
	text "Tu… Ets tu"
	line "l'entrenador que"

	para "els #MON"
	line "llegendaris"
	cont "esperen?"
	done

SageKojiAfterBattleSpeechText:
	text "Ja veig…"

	para "A nosaltres, el"
	line "TRIO SAVI, ens han"

	para "donat la tasca de"
	line "protegir els"
	cont "#MON"

	para "llegendaris."
	line "Només podem deixar"

	para "passar aquells que"
	line "tinguin el poder i"

	para "l'ànima de la"
	line "veritat."

	para "Si us plau, entra"
	line "a la TORRE ESTANY."

	para "SUICUNE et posarà"
	line "a prova."
	done

SageKojiAfterBattleFinalText:
	text "Si us plau, entra."

	para "SUICUNE et posarà"
	line "a prova."
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	def_coord_events
	coord_event  7,  4, SCENE_WISETRIOSROOM_SAGE_BLOCKS, WiseTriosRoom_CannotEnterTinTowerScript

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
