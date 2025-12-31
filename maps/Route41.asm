	object_const_def
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5

Route41_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock: ; unreferenced
	jumpstd SmashRockScript

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "L'aigua és càlida"
	line "aquí. Estic molt"
	cont "relaxat."

	para "Endavant, accepto"
	line "el repte!"
	done

SwimmermCharlieBeatenText:
	text "Ai! Tinc la pell"
	line "arrugada!"
	done

SwimmermCharlieAfterBattleText:
	text "No és relaxant"
	line "flotar així?"
	done

SwimmermGeorgeSeenText:
	text "Estic una mica"
	line "cansat. Si guanyo,"
	cont "deixa'm el"
	cont "#MON."
	done

SwimmermGeorgeBeatenText:
	text "Buf, buf…"
	done

SwimmermGeorgeAfterBattleText:
	text "CIANWOOD és molt"
	line "lluny."

	para "Però tornar a"
	line "OLIVINE tampoc és"
	cont "fàcil."

	para "Què hauria de fer?"
	done

SwimmermBerkeSeenText:
	text "Veus aquelles"
	line "illes bloquejades"
	cont "pels remolins?"

	para "Hi ha d'haver un"
	line "secret!"
	done

SwimmermBerkeBeatenText:
	text "Quin és el secret"
	line "de la teva força?"
	done

SwimmermBerkeAfterBattleText:
	text "Era una nit fosca"
	line "i tempestuosa…"

	para "Vaig veure un"
	line "#MON gegant que"
	cont "volava de l'illa."

	para "Escampava plomes"
	line "de les seves ales"
	cont "de plata."
	done

SwimmermKirkSeenText:
	text "Les ones són molt"
	line "fortes aquí."

	para "Et cansen mentre"
	line "nedes."
	done

SwimmermKirkBeatenText:
	text "Estic destrossat!"
	done

SwimmermKirkAfterBattleText:
	text "Els corrents no"
	line "em deixen arribar"
	cont "a aquella illa."
	done

SwimmermMathewSeenText:
	text "Busques els"
	line "secrets de les"
	cont "ILLES REMOLÍ?"
	done

SwimmermMathewBeatenText:
	text "Oh, tens molta"
	line "resistència!"
	done

SwimmermMathewAfterBattleText:
	text "Un secret de les"
	line "ILLES REMOLÍ…"

	para "A dins és fosc"
	line "com la nit!"
	done

SwimmerfKayleeSeenText:
	text "Vaig cap a les"
	line "ILLES REMOLÍ."

	para "Hi vaig a explorar"
	line "amb amics."
	done

SwimmerfKayleeBeatenText:
	text "Així és com ho"
	line "fas?"
	done

SwimmerfKayleeAfterBattleText:
	text "Diuen que hi ha"
	line "un gran #MON a"
	cont "les profunditats"
	cont "d'ILLES REMOLÍ."

	para "Quin deu ser?"
	done

SwimmerfSusieSeenText:
	text "Quedes tan elegant"
	line "muntant el teu"
	cont "#MON."
	done

SwimmerfSusieBeatenText:
	text "Estic arrasada…"
	done

SwimmerfSusieAfterBattleText:
	text "No hi havia una"
	line "cançó sobre un noi"
	cont "muntant un LAPRAS?"
	done

SwimmerfDeniseSeenText:
	text "Fa tan bon temps"
	line "que estic"
	cont "embadalida!"
	done

SwimmerfDeniseBeatenText:
	text "Ohhh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Les cremades de"
	line "sol són dolentes"
	cont "per a la pell."

	para "Però no faig"
	line "servir protector."

	para "No vull contaminar"
	line "l'aigua."
	done

SwimmerfKaraSeenText:
	text "Si necessites"
	line "descansar, queda't"
	cont "flotant."

	para "Recuperaràs les"
	line "forces i podràs"

	para "continuar amb"
	line "energia."
	done

SwimmerfKaraBeatenText:
	text "Oh! Tens més"
	line "energia que jo."
	done

SwimmerfKaraAfterBattleText:
	text "Vaig sentir rugits"
	line "de l'interior de"
	cont "les ILLES."
	done

SwimmerfWendySeenText:
	text "A la nit, STARYU"
	line "es reuneixen prop"
	cont "de la superfície."
	done

SwimmerfWendyBeatenText:
	text "Oh, vaja…"
	done

SwimmerfWendyAfterBattleText:
	text "Els grups de"
	line "STARYU"
	cont "s'il·luminen"
	cont "alhora."

	para "És tan bonic que"
	line "fa por."
	done

Route41_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	def_object_events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
