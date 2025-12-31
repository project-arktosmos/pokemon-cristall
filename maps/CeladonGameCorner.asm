	object_const_def
	const CELADONGAMECORNER_CLERK
	const CELADONGAMECORNER_RECEPTIONIST
	const CELADONGAMECORNER_POKEFAN_M
	const CELADONGAMECORNER_TEACHER
	const CELADONGAMECORNER_FISHING_GURU
	const CELADONGAMECORNER_FISHER1
	const CELADONGAMECORNER_FISHER2
	const CELADONGAMECORNER_GYM_GUIDE
	const CELADONGAMECORNER_GRAMPS

CeladonGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGameCornerClerkScript:
	jumpstd GameCornerCoinVendorScript

CeladonGameCornerReceptionistScript:
	jumptextfaceplayer CeladonGameCornerReceptionistText

CeladonGameCornerPokefanMScript:
	faceplayer
	opentext
	writetext CeladonGameCornerPokefanMText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_POKEFAN_M, LEFT
	end

CeladonGameCornerTeacherScript:
	faceplayer
	opentext
	writetext CeladonGameCornerTeacherText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_TEACHER, RIGHT
	end

CeladonGameCornerFishingGuruScript:
	faceplayer
	opentext
	writetext CeladonGameCornerFishingGuruText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_FISHING_GURU, RIGHT
	end

CeladonGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .GotCoins
	writetext CeladonGameCornerFisherText1
	promptbutton
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	getstring STRING_BUFFER_4, .coinname
	scall .GiveCoins
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.GotCoins:
	writetext CeladonGameCornerFisherText2
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.GiveCoins:
	jumpstd ReceiveItemScript
	end

.coinname
	db "MONEDA@"

.NoCoinCase:
	writetext CeladonGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext CeladonGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

CeladonGymGuideScript:
	jumptextfaceplayer CeladonGymGuideText

CeladonGameCornerGrampsScript:
	faceplayer
	opentext
	writetext CeladonGameCornerGrampsText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_GRAMPS, LEFT
	end

CeladonGameCornerPoster1Script:
	jumptext CeladonGameCornerPoster1Text

CeladonGameCornerPoster2Script:
	jumptext CeladonGameCornerPoster2Text

CeladonGameCornerLuckySlotMachineScript:
	random 6
	ifequal 0, CeladonGameCornerSlotMachineScript
	reanchormap
	setval FALSE
	special SlotMachine
	closetext
	end

CeladonGameCornerSlotMachineScript:
	reanchormap
	setval TRUE
	special SlotMachine
	closetext
	end

CeladonGameCornerCardFlipScript:
	reanchormap
	special CardFlip
	closetext
	end

CeladonGameCornerLighterScript:
	jumptext CeladonGameCornerLighterText

CeladonGameCornerSodaCanScript:
	opentext
	writetext CeladonGameCornerSodaCanText
	waitbutton
	special CardFlip
	closetext
	end

CeladonGameCornerUnusedMovementData: ; unreferenced
	step RIGHT
	turn_head LEFT
	step_end

CeladonGameCornerReceptionistText:
	text "Benvingut!"

	para "Pots canviar les"
	line "teves monedes per"

	para "premis fabulosos"
	line "al costat."
	done

CeladonGameCornerPokefanMText:
	text "Les escurabutxa-"
	line "ques són d'última"
	cont "generació."
	done

CeladonGameCornerTeacherText:
if DEF(_CRYSTAL_AU)
	text "El temps a fora"
	line "és molt agradable."
	done
else
	text "Vull aquesta"
	line "màquina."

	para "Ahir em va deixar"
	line "sense res, així"

	para "que avui hauria"
	line "de pagar."
	done
endc

CeladonGameCornerFishingGuruText:
if DEF(_CRYSTAL_AU)
	text "Aquesta màquina"
	line "sembla igual que"
	cont "les altres."
	done
else
	text "Crec que aquesta"
	line "escurabutxaques"
	cont "pagarà…"

	para "Les probabilitats"
	line "varien segons la"
	cont "màquina."
	done
endc

CeladonGameCornerFisherText1:
if DEF(_CRYSTAL_AU)
	text "Uau!"

	para "Què? Vols jugar"
	line "a aquesta màquina?"

	para "Té, agafa les"
	line "meves monedes."
	done
else
	text "Gahahaha!"

	para "Les monedes no"
	line "paren de sortir!"

	para "Hm? Què, nano?"
	line "Vols jugar?"

	para "Compartiré la"
	line "sort amb tu!"
	done
endc

CeladonGameCornerFisherText2:
	text "Gahahaha!"

	para "Em fa sentir bé"
	line "fer coses bones"

	para "per altres"
	line "persones!"
	done

CeladonGameCornerFisherNoCoinCaseText:
	text "Ei, no tens un"
	line "MONEDER."

	para "Com se suposa que"
	line "t'he de donar"
	cont "monedes, nano?"
	done

CeladonGameCornerFisherFullCoinCaseText:
if DEF(_CRYSTAL_AU)
	text "El teu MONEDER"
	line "és ple."
	done
else
	text "Ei, el teu"
	line "MONEDER és ple."

	para "Deus estar en una"
	line "bona ratxa tu"
	cont "també."
	done
endc

CeladonGymGuideText:
	text "Ei! Futur CAMPIÓ!"

	para "Tu també jugues"
if DEF(_CRYSTAL_AU)
	line "aquí?"
else
	cont "a les màquines?"
endc

	para "Intento aconseguir"
	line "prou monedes per"
	cont "un # de premi."

	para "Però encara no en"
	line "tinc prou…"
	done

CeladonGameCornerGrampsText:
if DEF(_CRYSTAL_AU)
	text "Hi ha alguna"
	line "diferència entre"
	cont "aquestes línies?"
	done
else
	text "Hmmm… Segur que"
	line "les probabilitats"

	para "són millors per"
	line "la línia de"
	cont "PIKACHU, però…"
	done
endc

CeladonGameCornerPoster1Text:
	text "Ei!"

	para "Sota aquest"
	line "pòster…"

	para "No hi ha res!"
	done

CeladonGameCornerPoster2Text:
	text "Ei!"

	para "Sota aquest"
	line "pòster…"

	para "No hi ha res!"
	done

CeladonGameCornerLighterText:
	text "Hi ha un encenedor"
	line "aquí."
	done

CeladonGameCornerSodaCanText:
	text "Una llauna de"
	line "refresc…"

	para "Algú deu estar a"
	line "punt de tornar…"

	para "Eh? És buida!"
	done

CeladonGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 13, CELADON_CITY, 6
	warp_event 15, 13, CELADON_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  1,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  9, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1, 11, BGEVENT_LEFT, CeladonGameCornerCardFlipScript
	bg_event  6,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  9, BGEVENT_READ, CeladonGameCornerSodaCanScript
	bg_event  6, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6, 11, BGEVENT_RIGHT, CeladonGameCornerCardFlipScript
	bg_event  7,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7, 10, BGEVENT_READ, CeladonGameCornerSlotMachineScript
	bg_event  7, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  8, BGEVENT_READ, CeladonGameCornerLighterScript
	bg_event 18,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 15,  0, BGEVENT_READ, CeladonGameCornerPoster1Script
	bg_event  9,  0, BGEVENT_READ, CeladonGameCornerPoster2Script

	def_object_events
	object_event  5,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerClerkScript, -1
	object_event  3,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerReceptionistScript, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPokefanMScript, -1
	object_event 17,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerTeacherScript, -1
	object_event 11,  7, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFishingGuruScript, -1
	object_event  8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event  8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event 11,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGymGuideScript, -1
	object_event  2,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerGrampsScript, -1
