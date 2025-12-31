object_const_def
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	def_scene_scripts
	scene_script MrPokemonsHouseMeetMrPokemonScene, SCENE_MRPOKEMONSHOUSE_MEET_MR_POKEMON
	scene_script MrPokemonsHouseNoopScene,          SCENE_MRPOKEMONSHOUSE_NOOP

	def_callbacks

MrPokemonsHouseMeetMrPokemonScene:
	sdefer MrPokemonsHouseMrPokemonEventScript
	end

MrPokemonsHouseNoopScene:
	end

MrPokemonsHouseMrPokemonEventScript:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInFromBlack
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_MRPOKEMONSHOUSE_NOOP
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "Hola, hola! Tu"
	line "deus ser <PLAY_G>."

	para "El PROF.ELM em va"
	line "dir que vindries."
	done

MrPokemonIntroText2:
	text "Això és el que"
	line "vull que el"
	cont "PROF.ELM examini."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> ha rebut"
	line "l'OU MISTERIÓS."
	done

MrPokemonIntroText3:
	text "Conec una parella"
	line "que tenen una"
	cont "GUARDERIA #MON."

	para "Em van donar"
	line "aquest OU."

	para "Em va intrigar,"
	line "així que vaig"
	cont "escriure al"
	cont "PROF.ELM."

	para "Pel que fa a"
	line "l'evolució dels"
	cont "#MON, el"
	cont "PROF.ELM n'és"
	cont "l'autoritat."
	done

MrPokemonIntroText4:
	text "Fins i tot el"
	line "PROF.OAK ho"
	cont "reconeix."
	done

MrPokemonIntroText5:
	text "Si la meva"
	line "suposició és"
	cont "correcta, el"
	cont "PROF.ELM ho sabrà."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "Tornes amb el"
	line "PROF.ELM?"

	para "Té. Els teus"
	line "#MON haurien de"
	cont "descansar."
	done

MrPokemonText_ImDependingOnYou:
	text "Confio en tu!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "La vida és"
	line "meravellosa!"

	para "Sempre hi ha nous"
	line "descobriments!"
	done

MrPokemonsHouse_OakText1:
	text "OAK: Ah! Així que"
	line "tu ets <PLAY_G>!"

	para "Sóc l'OAK! Un"
	line "investigador de"
	cont "#MON."

	para "Estava visitant"
	line "el meu vell amic,"
	cont "el SR.#MON."

	para "M'han dit que"
	line "feies un encàrrec"

	para "per al PROF.ELM,"
	line "i t'he esperat."

	para "Oh! Què és això?"
	line "Un #MON rar!"

	para "A veure…"

	para "Hm, ja veig!"

	para "Entenc per què"
	line "el PROF.ELM et va"

	para "donar un #MON"
	line "per a l'encàrrec."

	para "Per investigadors"
	line "com el PROF.ELM i"

	para "jo, els #MON"
	line "són els amics."

	para "Va veure que"
	line "cuidaries el teu"

	para "#MON amb amor"
	line "i dedicació."

	para "…Ah!"

	para "Sembla que ets"
	line "de fiar."

	para "Voldries ajudar-"
	line "me?"

	para "Mira! Aquesta és"
	line "la darrera versió"
	cont "de la #DEX."

	para "Registra les"
	line "dades dels #MON"

	para "que has vist o"
	line "capturat."

	para "És una enciclop-"
	line "èdia d'alta"
	cont "tecnologia!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> ha rebut"
	line "la #DEX!"
	done

MrPokemonsHouse_OakText2:
	text "Troba moltes"
	line "menes de #MON i"

	para "completa la"
	line "#DEX!"

	para "Però m'he quedat"
	line "massa estona."

	para "He d'anar a"
	line "GOLDENROD per al"
	cont "meu programa de"
	cont "ràdio habitual."

	para "<PLAY_G>, confio"
	line "en tu!"
	done

MrPokemonText_GimmeTheScale:
	text "Hm? Aquesta ESCATA"
	line "Què és això?"
	cont "Un GYARADOS roig?"

	para "Això és rar!"
	line "Jo, la vull…"

	para "<PLAY_G>, la"
	line "voldries bescanvi-"
	cont "ar?"

	para "Jo et puc oferir"
	line "aquest REPARTEXP"
	cont "que em va donar"
	cont "el PROF.OAK."
	done

MrPokemonText_Disappointed:
	text "Quina llàstima."
	line "Resulta que és"
	cont "molt rara."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "Està ple de"
	line "revistes"
	cont "estrangeres."

	para "Ni tan sols puc"
	line "llegir els"
	cont "títols…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "És un ordinador"
	line "gran. Hm. Està"
	cont "espatllat."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "Una pila de"
	line "monedes"
	cont "estranyes!"

	para "Potser són d'un"
	line "altre país…"
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	def_object_events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
