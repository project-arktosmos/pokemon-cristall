	object_const_def
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2

Route39_MapScripts:
	def_scene_scripts

	def_callbacks

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	endifjustbattled
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue .NumberAccepted
	checkpoke PIKACHU
	iffalse .WantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokefanMDerekText_NotBragging
	promptbutton
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.WantsPikachu:
	writetext PokefanMDerekPikachuIsItText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "MILTANK: Muuu!"
	done

SailorEugeneSeenText:
	text "Acabo de tornar a"
	line "OLIVINE."

	para "Què tal un combat"
	line "de #MON?"
	done

SailorEugeneBeatenText:
	text "Aaaaargh!"
	done

SailorEugeneAfterBattleText:
	text "Els meus #MON"
	line "van ser capturats"
	cont "a l'estranger."

	para "Són els meus"
	line "companys en els"
	cont "llargs viatges."
	done

PokefanmDerekSeenText:
	text "És un bon moment"
	line "per presumir del"
	cont "meu PIKACHU!"
	done

PokefanmDerekBeatenText:
	text "No he tingut temps"
	line "de lluir PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "No t'escolto"
	line "presumir!"

	para "Els # FANS"
	line "tenim la norma de"

	para "no escoltar els"
	line "altres presumir!"
	done

PokefanfRuthSeenText:
	text "Quins #MON"
	line "tan adorables."

	para "Mostrem els"
	line "nostres #MON"
	cont "alhora."
	done

PokefanfRuthBeatenText:
	text "No m'importa"
	line "perdre."
	done

PokefanfRuthAfterBattleText:
	text "Coneixes els"
	line "#MON nadons?"

	para "Segur que són"
	line "adorables!"
	done

PokefanMDerekPikachuIsItText:
	text "PIKACHU és el"
	line "millor! No creus?"
	done

PsychicNormanSeenText:
	text "Deixa'm veure de"
	line "què són capaços"
	cont "els teus #MON."
	done

PsychicNormanBeatenText:
	text "Oh, els teus"
	line "#MON tenen"
	cont "potencial."
	done

PsychicNormanAfterBattleText:
	text "Saps que els #-"
	line "MON tenen diverses"
	cont "habilitats?"

	para "La gent és igual."
	line "Tothom té un"
	cont "potencial"
	cont "diferent."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Ufufufu… Espero"
	line "que es faci fosc."
	done

PokefanfJaimeSeenText:
	text "Has vingut en el"
	line "moment just."

	para "Lluitem."
	done

PokefanfJaimeBeatenText:
	text "Oh, quina"
	line "decepció…"
	done

PokefanfJaimeAfterBattleText:
	text "Vaig trobar el meu"
	line "MEOWTH de nit,"
	cont "aquí a la RUTA 39."

	para "No sé per què,"
	line "però sembla que"

	para "li agrada quan"
	line "entreno aquí."

	para "Sembla que es fa"
	line "més amic entrenant"

	para "aquí que a cap"
	line "altre lloc."
	done

Route39SignText:
	text "RUTA 39"

	para "OLIVINE -"
	line "ECRUTEAK"
	done

MoomooFarmSignText:
	text "GRANJA MOOMOO"

	para "Gaudeix la nostra"
	line "llet fresca!"
	done

Route39TrainerTipsText:
	text "CONSELLS"

	para "Usa HEADBUTT als"
	line "arbres per fer"
	cont "caure #MON."

	para "Diferents tipus"
	line "de #MON cauen"
	cont "dels arbres."

	para "Usa HEADBUTT a"
	line "qualsevol arbre!"
	done

Route39_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  5, 31, BGEVENT_READ, Route39TrainerTips
	bg_event  9,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 15,  7, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget

	def_object_events
	object_event 13, 29, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSailorEugene, -1
	object_event 10, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 11, 19, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanfRuth, -1
	object_event  3, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  8, 13, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13,  7, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	object_event  9,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
	object_event  4, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
