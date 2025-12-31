	object_const_def
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE

VioletPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VioletPokecenterNurse:
	jumpstd PokecenterNurseScript

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "EGG@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext VioletCityElmsAideFullPartyText
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext VioletPokecenterElmsAideRefuseText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	text "<PLAY_G>, quant"
	line "de temps!"

	para "El PROF.ELM m'ha"
	line "enviat a trobar-"
	cont "te."

	para "Et vol demanar un"
	line "altre favor."

	para "Pots quedar-te"
	line "l'OU de #MON?"
	done

VioletPokecenterElmsAideGiveEggText:
	text "Hem descobert que"
	line "un #MON no"

	para "eclodeix fins que"
	line "no creix a l'OU."

	para "A més, ha de ser"
	line "amb altres #MON"
	cont "actius."

	para "<PLAY_G>, ets"
	line "l'única persona"
	cont "en qui confiem."

	para "Truca al PROF.ELM"
	line "quan l'OU"
	cont "eclosioni!"
	done

VioletCityElmsAideFullPartyText:
	text "Oh, no. No pots"
	line "portar més #MON"
	cont "amb tu."

	para "Esperaré aquí"
	line "mentre fas lloc"
	cont "per a l'OU."
	done

VioletPokecenterElmsAideRefuseText:
	text "P-però… El"
	line "PROF.ELM t'ho ha"
	cont "demanat a tu…"
	done

VioletPokecenterElmsAideAskEggText:
	text "<PLAY_G>, vols"
	line "quedar-te l'OU?"
	done

VioletPokecenterFarawayLinkText: ; unreferenced
	text "He pensat que"
	line "estaria bé poder"

	para "connectar i"
	line "lluitar"
	cont "amb els meus amics"

	para "que viuen molt"
	line "lluny."
	done

VioletPokecenterMobileAdapterText: ; unreferenced
	text "Acabo de lluitar"
	line "amb un amic de"
	cont "CIANWOOD per link."

	para "Si connectes un"
	line "MOBILE ADAPTER,"

	para "pots enllaçar amb"
	line "un amic llunyà."
	done

VioletPokecenter1FGameboyKidText:
	text "Un noi anomenat"
	line "BILL va crear el"
	cont "sistema PC"
	cont "#MON."
	done

VioletPokecenter1FGentlemanText:
	text "Va ser fa uns"
	line "tres anys."

	para "El TEAM ROCKET"
	line "feia malifetes"
	cont "amb els #MON."

	para "Però la justícia"
	line "va triomfar: un"
	cont "nen els va aturar."
	done

VioletPokecenter1FYoungsterText:
	text "Els #MON són"
	line "intel·ligents. No"

	para "obeeixen un"
	line "entrenador que no"
	cont "respecten."

	para "Sense les MEDALLES"
	line "DE GIMNÀS, faran"

	para "el que els vingui"
	line "de gust."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
