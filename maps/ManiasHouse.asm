	object_const_def
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckle
	yesorno
	iffalse .refusetotakeshuckie
	special GiveShuckle
	iffalse .partyfull
	writetext ManiaText_TakeCareOfShuckle
	promptbutton
	waitsfx
	writetext ManiaText_GotShuckle
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_GOT_SHUCKIE
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfShuckle
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnShuckie
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
; BUG: Mania uses wrong dialogue for trying to return Shuckie with no other Pokémon (see docs/bugs_and_glitches.md)
	ifequal SHUCKIE_FAINTED, .default_postevent
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_ShuckleNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_ShuckleLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft ; unreferenced
	writetext ManiaText_ShuckleIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

ManiaText_AskLookAfterShuckle:
	text "Estic en xoc!"

	para "Un noi de la teva"
	line "edat, amb ulls"

	para "penetrants i"
	line "cabells llargs,"
	cont "ha entrat."

	para "M'ha obligat a"
	line "donar-li el meu"
	cont "# preferit!"

	para "Encara en tinc"
	line "un, però què faré"
	cont "si torna?"

	para "Tu sembla que ets"
	line "fort. Podries"

	para "cuidar el meu #"
	line "una estona?"
	done

ManiaText_TakeCareOfShuckle:
	text "Oh, gràcies!"

	para "Cuida'l bé,"
	line "si us plau!"
	done

ManiaText_GotShuckle:
	text "<PLAYER> ha rebut"
	line "un #."
	done

ManiaText_PartyFull:
	text "El teu equip de"
	line "# és ple."
	done

ManiaText_IfHeComesBack:
	text "Oh, no… Què faré"
	line "si torna?"
	done

ManiaText_CanIHaveMyMonBack:
	text "Hola! Com està el"
	line "meu #?"

	para "Crec que ja estic"
	line "fora de perill."

	para "Me'l pots"
	line "tornar?"
	done

ManiaText_ThankYou:
	text "Gràcies!"
	done

ManiaText_ShuckleNotThere:
	text "Ei, no portes el"
	line "meu # amb tu."
	done

ManiaText_ShuckleLikesYou:
	text "El meu # ha"
	line "agafat afecte"
	cont "per tu."

	para "D'acord, queda-"
	line "te'l."

	para "Però promet que"
	line "el tractaràs bé!"
	done

ManiaText_SameAsBeingRobbed:
	text "Oh, no, no… Això"
	line "és com si em"
	cont "robessis."
	done

ManiaText_HappinessSpeech:
	text "Pels #, la"
	line "felicitat és"

	para "estar amb algú"
	line "que els tracti bé."
	done

ManiaText_ShuckleIsYourLastMon:
	text "Si et prenc el"
	line "meu #, què"

	para "faràs servir en"
	line "combat?"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
