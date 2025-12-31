object_const_def
	const GOLDENRODCITY_POKEFAN_M1
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F1
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKETSCOUT
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_MOVETUTOR

GoldenrodCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodCityFlypointAndFloriaCallback
	callback MAPCALLBACK_OBJECTS, GoldenrodCityMoveTutorCallback

GoldenrodCityFlypointAndFloriaCallback:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone:
	endcallback

GoldenrodCityMoveTutorCallback:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MoveTutorDone
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear GOLDENRODCITY_MOVETUTOR
	endcallback

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear GOLDENRODCITY_MOVETUTOR
.MoveTutorDone:
	endcallback

MoveTutorScript:
	faceplayer
	opentext
	writetext GoldenrodCityMoveTutorAskTeachAMoveText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorAsk4000CoinsOkayText
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodCityMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	sjump .Incompatible

.Flamethrower:
	setval MOVETUTOR_FLAMETHROWER
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Thunderbolt:
	setval MOVETUTOR_THUNDERBOLT
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.IceBeam:
	setval MOVETUTOR_ICE_BEAM
	writetext GoldenrodCityMoveTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FLAMETHROWER@"
	db "THUNDERBOLT@"
	db "ICE BEAM@"
	db "CANCEL·LAR@"

.Refused:
	writetext GoldenrodCityMoveTutorAwwButTheyreAmazingText
	waitbutton
	closetext
	end

.Refused2:
	writetext GoldenrodCityMoveTutorHmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	writetext GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText
	promptbutton
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorFarewellKidText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .WalkAroundPlayer
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorEnterGameCornerMovement
	sjump .GoInside

.WalkAroundPlayer:
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear GOLDENRODCITY_MOVETUTOR
	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext GoldenrodCityMoveTutorBButText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText
	waitbutton
	closetext
	end

GoldenrodCityPokefanMScript:
	jumptextfaceplayer GoldenrodCityPokefanMText

GoldenrodCityYoungster1Script:
	jumptextfaceplayer GoldenrodCityYoungster1Text

GoldenrodCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext GoldenrodCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext GoldenrodCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext GoldenrodCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext GoldenrodCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

GoldenrodCityYoungster2Script:
	jumptextfaceplayer GoldenrodCityYoungster2Text

GoldenrodCityLassScript:
	jumptextfaceplayer GoldenrodCityLassText

GoldenrodCityGrampsScript:
	jumptextfaceplayer GoldenrodCityGrampsText

GoldenrodCityRocketScoutScript:
	opentext
	writetext GoldenrodCityRocketScoutText1
	promptbutton
	faceplayer
	writetext GoldenrodCityRocketScoutText2
	waitbutton
	closetext
	turnobject GOLDENRODCITY_ROCKETSCOUT, UP
	end

GoldenrodCityRocket1Script:
	jumptextfaceplayer GoldenrodCityRocket1Text

GoldenrodCityRocket2Script:
	jumptextfaceplayer GoldenrodCityRocket2Text

GoldenrodCityRocket3Script:
	jumptextfaceplayer GoldenrodCityRocket3Text

GoldenrodCityRocket4Script:
	jumptextfaceplayer GoldenrodCityRocket4Text

GoldenrodCityRocket5Script:
	jumptextfaceplayer GoldenrodCityRocket5Text

GoldenrodCityRocket6Script:
	jumptextfaceplayer GoldenrodCityRocket6Text

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokecenterSign:
	jumpstd PokecenterSignScript

GoldenrodCityFlowerShopSign:
	jumptext GoldenrodCityFlowerShopSignText

GoldenrodCityMoveTutorEnterGameCornerMovement:
	step RIGHT
	step RIGHT
	step UP
	step_end

GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

GoldenrodCityPokefanMText:
	text "Van construir la"
	line "nova TORRE RÀDIO"

	para "per substituir"
	line "l'antiga."
	done

GoldenrodCityYoungster1Text:
	text "Sé que hi ha una"
	line "nova BOTIGA DE"

	para "BICIS, però no la"
	line "trobo enlloc."
	done

GoldenrodCityCooltrainerF1Text:
	text "Aquell home de"
	line "negre va vestit"

	para "com un membre del"
	line "TEAM ROCKET?"

	para "Que ximple!"
	done

GoldenrodCityCooltrainerF1Text_ClearedRadioTower:
	text "Aquell home de"
	line "negre era part"

	para "del TEAM ROCKET?"
	line "No m'ho crec!"
	done

GoldenrodCityCooltrainerF2Text:
	text "La TORRE RÀDIO de"
	line "CIUTAT GOLDRADA"
	cont "és emblemàtica."

	para "Ara tenen una"
	line "campanya de"
	cont "promoció."

	para "Et modifiquen el"
	line "#GEAR perquè"

	para "també funcioni"
	line "com a ràdio."
	done

GoldenrodCityCooltrainerF2Text_GotRadioCard:
	text "Oh, el teu"
	line "#GEAR"
	cont "funciona com a"
	cont "ràdio!"
	done

GoldenrodCityYoungster2Text:
	text "Eh-he-he-he…"

	para "Em van renyar per"
	line "jugar al soterrani"

	para "dels GRANS"
	line "MAGATZEMS."
	done

GoldenrodCityLassText:
	text "L'home d'aquella"
	line "casa puntua els"
	cont "noms dels #MON."

	para "Fins i tot pot"
	line "canviar-los el nom"
	cont "als teus #MON."
	done

GoldenrodCityGrampsText:
	text "Uf! Aquesta ciutat"
	line "és enorme. No sé"

	para "on és res de"
	line "res."
	done

GoldenrodCityRocketScoutText1:
	text "Així que aquesta"
	line "és la TORRE"
	cont "RÀDIO…"
	done

GoldenrodCityRocketScoutText2:
	text "Què vols, ximple?"
	line "Fora d'aquí!"
	done

GoldenrodCityRocket1Text:
	text "No et fiquis pel"
	line "mig! Fora!"
	done

GoldenrodCityRocket2Text:
	text "Ocupar la TORRE"
	line "RÀDIO…"

	para "Què? No és cosa"
	line "teva!"
	done

GoldenrodCityRocket3Text:
	text "Els #MON? No"
	line "són més que eines"

	para "per fer diners!"
	done

GoldenrodCityRocket4Text:
	text "El nostre somni"
	line "aviat es farà"
	cont "realitat…"

	para "Ha estat una"
	line "lluita tan llarga…"
	done

GoldenrodCityRocket5Text:
	text "Ei, marrec! No"
	line "hauries de ser"
	cont "aquí! Marxa!"
	done

GoldenrodCityRocket6Text:
	text "Vine a tastar el"
	line "veritable terror"
	cont "del TEAM ROCKET!"
	done

GoldenrodCityStationSignText:
	text "CIUTAT GOLDRADA"
	line "ESTACIÓ"
	done

GoldenrodCityRadioTowerSignText:
	text "CIUTAT GOLDRADA"
	line "TORRE RÀDIO"
	done

GoldenrodDeptStoreSignText:
	text "Selecció completa"
	line "d'articles"
	cont "#MON!"

	para "GRANS MAGATZEMS"
	line "CIUTAT GOLDRADA"
	done

GoldenrodGymSignText:
	text "CIUTAT GOLDRADA"
	line "GIMNÀS #MON"
	cont "LÍDER: BLANCA"

	para "La noia increïble-"
	line "ment bonica!"
	done

GoldenrodCitySignText:
	text "CIUTAT GOLDRADA"

	para "La Ciutat Festiva"
	line "d'Encant Opulent"
	done

GoldenrodCityBikeShopSignText:
	text "El Món és un"
	line "Carril Bici!"
	cont "BOTIGA DE BICIS"
	done

GoldenrodCityGameCornerSignText:
	text "El teu Parquet!"

	para "SALA DE JOCS"
	line "CIUTAT GOLDRADA"
	done

GoldenrodCityNameRaterSignText:
	text "JUTGE DE NOMS"

	para "Fes que avaluïn"
	line "els sobrenoms dels"
	cont "teus #MON"
	done

GoldenrodCityUndergroundSignNorthText:
	text "ENTRADA AL"
	line "SOTERRANI"
	done

GoldenrodCityUndergroundSignSouthText:
	text "ENTRADA AL"
	line "SOTERRANI"
	done

GoldenrodCityPokeComCenterSignText: ; unreferenced
	text "Consells Mòbils!"
	line "CENTRE #COM"
	done

GoldenrodCityFlowerShopSignText:
	text "Bellesa Florida"
	line "BOTIGA DE FLORS"
	done

GoldenrodCityMoveTutorAskTeachAMoveText:
	text "Puc ensenyar als"
	line "teus #MON"

	para "moviments incre-"
	line "ïbles, si vols."

	para "Vols que ensenyi"
	line "un moviment nou?"
	done

GoldenrodCityMoveTutorAsk4000CoinsOkayText:
	text "Costarà 4000"
	line "monedes. D'acord?"
	done

GoldenrodCityMoveTutorAwwButTheyreAmazingText:
	text "Oh… Però són"
	line "increïbles…"
	done

GoldenrodCityMoveTutorWhichMoveShouldITeachText:
	text "Wahaha! No te'n"
	line "penediràs!"

	para "Quin moviment"
	line "vols que ensenyi?"
	done

GoldenrodCityMoveTutorHmTooBadText:
	text "Hm, quina llàsti-"
	line "ma. Hauré d'anar"
	cont "a buscar diners…"
	done

GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText:
	text "Si entens què té"
	line "d'increïble aquest"

	para "moviment, ja has"
	line "triomfat com a"
	cont "entrenador."
	done

GoldenrodCityMoveTutorFarewellKidText:
	text "Wahaha!"
	line "Adéu, marrec!"
	done

GoldenrodCityMoveTutorBButText:
	text "P-però…"
	done

GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText:
	text "…No tens prou"
	line "monedes aquí…"
	done

GoldenrodCityMoveTutorMoveText:
	text_start
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24,  7, GOLDENROD_GYM, 1
	warp_event 29, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 31, 21, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  5, 25, BILLS_FAMILYS_HOUSE, 1
	warp_event  9, 13, GOLDENROD_MAGNET_TRAIN_STATION, 2
	warp_event 29,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 33,  9, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 15,  7, GOLDENROD_NAME_RATER, 1
	warp_event 24, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 14, 21, GOLDENROD_GAME_CORNER, 1
	warp_event  5, 15, RADIO_TOWER_1F, 1
	warp_event 19,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event  9,  5, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 8
	warp_event 11, 29, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 5
	warp_event 15, 27, GOLDENROD_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 10, 14, BGEVENT_READ, GoldenrodCityStationSign
	bg_event  4, 17, BGEVENT_READ, GoldenrodCityRadioTowerSign
	bg_event 26, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 26,  9, BGEVENT_READ, GoldenrodGymSign
	bg_event 22, 18, BGEVENT_READ, GoldenrodCitySign
	bg_event 28, 30, BGEVENT_READ, GoldenrodCityBikeShopSign
	bg_event 16, 22, BGEVENT_READ, GoldenrodCityGameCornerSign
	bg_event 12,  7, BGEVENT_READ, GoldenrodCityNameRaterSign
	bg_event  8,  6, BGEVENT_READ, GoldenrodCityUndergroundSignNorth
	bg_event 12, 30, BGEVENT_READ, GoldenrodCityUndergroundSignSouth
	bg_event 16, 27, BGEVENT_UP, GoldenrodCityPokecenterSign
	bg_event 30,  6, BGEVENT_READ, GoldenrodCityFlowerShopSign

	def_object_events
	object_event  7, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanMScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 30, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 20, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 19, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 11, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  4, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event 28, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket1Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket2Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 16, 23, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 31, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, EVENT_GOLDENROD_CITY_MOVE_TUTOR
