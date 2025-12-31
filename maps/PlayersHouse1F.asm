object_const_def
const PLAYERSHOUSE1F_MOM1
const PLAYERSHOUSE1F_MOM2
const PLAYERSHOUSE1F_MOM3
const PLAYERSHOUSE1F_MOM4
const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FNoop1Scene, SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_script PlayersHouse1FNoop2Scene, SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FNoop1Scene:
	end

PlayersHouse1FNoop2Scene:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

PokegearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_PLAYERSHOUSE1F_MEET_MOM
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Oh, <PLAYER>…! El"
	line "nostre veí, el"

	para "PROF.ELM, et"
	line "buscava."

	para "M'ha dit que volia"
	line "que li fessis un"
	cont "encàrrec."

	para "Oh! Gairebé ho"
	line "oblidava! El teu"

	para "#GEAR ja està"
	line "arreglat."

	para "Aquí el tens!"
	done

MomGivesPokegearText:
	text "#MON GEAR, o"
	line "simplement"
	cont "#GEAR."

	para "És essencial si"
	line "vols ser un bon"
	cont "entrenador."

	para "Oh, el dia de la"
	line "setmana no hi és."

	para "No t'ho pots"
	line "oblidar!"
	done

IsItDSTText:
	text "Ara és l'horari"
	line "d'estiu?"
	done

ComeHomeForDSTText:
	text "Torna a casa per"
	line "ajustar el rellot-"

	para "ge per l'horari"
	line "d'estiu."

	para "Per cert, saps com"
	line "fer servir el"
	cont "TELÈFON?"
	done

KnowTheInstructionsText:
	text "Només cal encendre"
	line "el #GEAR i"

	para "seleccionar la"
	line "icona del TELÈFON?"
	done

DontKnowTheInstructionsText:
	text "Llegiré les"
	line "instruccions."

	para "Encén el #GEAR"
	line "i selecciona la"
	cont "icona del TELÈFON."
	done

InstructionsNextText:
	text "Els números estan"
	line "a la memòria."

	para "Tria el nom de qui"
	line "vulguis trucar."

	para "No és convenient,"
	line "això?"
	done

HurryUpElmIsWaitingText:
	text "El PROF.ELM"
	line "t'està esperant."

	para "Afanya't, fill!"
	done

SoWhatWasProfElmsErrandText:
	text "I quin era"
	line "l'encàrrec del"
	cont "PROF.ELM?"

	para "…"

	para "Sembla tot un"
	line "repte."

	para "Però hauries"
	line "d'estar orgullós"
	cont "que confien en tu."
	done

ImBehindYouText:
	text "<PLAYER>, endavant!"

	para "Et recolzo al"
	line "cent per cent!"
	done

NeighborMornIntroText:
	text "Bon dia,"
	line "<PLAY_G>!"

	para "Sóc de visita!"
	done

NeighborDayIntroText:
	text "Hola, <PLAY_G>!"
	line "Sóc de visita!"
	done

NeighborNiteIntroText:
	text "Bona nit,"
	line "<PLAY_G>!"

	para "Sóc de visita!"
	done

NeighborText:
	text "<PLAY_G>, ho has"
	line "sentit?"

	para "La meva filla està"
	line "decidida a ser"

	para "l'ajudant del"
	line "PROF.ELM."

	para "Li encanten els"
	line "#MON!"
	done

PlayersHouse1FStoveText:
	text "L'especialitat de"
	line "la mare!"

	para "L'HAMBURGUESA"
	line "VOLCÀ CINNABAR!"
	done

PlayersHouse1FSinkText:
	text "La pica està"
	line "impecable. A la"
	cont "mare li agrada."
	done

PlayersHouse1FFridgeText:
	text "Vegem què hi ha a"
	line "la nevera…"

	para "AIGUA FRESCA i"
	line "LLIMONADA!"
	done

PlayersHouse1FTVText:
	text "Hi ha una pel·li a"
	line "la tele: Els es-"

	para "tels il·luminen el"
	line "cel mentre dos"

	para "nois van en tren…"

	para "Jo també hauria"
	line "d'anar tirant!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  8,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomLeftScript
	coord_event  9,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomRightScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
