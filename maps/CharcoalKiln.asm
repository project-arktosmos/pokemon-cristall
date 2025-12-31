	object_const_def
	const CHARCOALKILN_BLACK_BELT
	const CHARCOALKILN_YOUNGSTER
	const CHARCOALKILN_MOLTRES

CharcoalKiln_MapScripts:
	def_scene_scripts

	def_callbacks

CharcoalKilnBoss:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SavedSlowpoke
	writetext CharcoalKilnBossText1
	waitbutton
	closetext
	end

.SavedSlowpoke:
	writetext CharcoalKilnBossText2
	waitbutton
	closetext
	end

.GotCut:
	writetext CharcoalKilnBossText3
	waitbutton
	closetext
	end

CharcoalKilnApprentice:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue .YoureTheCoolest
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Thanks
	writetext CharcoalKilnApprenticeText1
	waitbutton
	closetext
	end

.Thanks:
	writetext CharcoalKilnApprenticeText2
	promptbutton
	verbosegiveitem CHARCOAL
	iffalse .Done
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	closetext
	end

.YoureTheCoolest:
	writetext CharcoalKilnApprenticeText3
	waitbutton
.Done:
	closetext
	end

CharcoalKilnFarfetchd:
	faceplayer
	opentext
	writetext FarfetchdText
	cry FARFETCH_D
	waitbutton
	closetext
	end

CharcoalKilnBookshelf:
	jumpstd MagazineBookshelfScript

CharcoalKilnRadio:
	jumpstd Radio2Script

CharcoalKilnBossText1:
	text "Tots els SLOWPOKE"
	line "han desaparegut"
	cont "del poble."

	para "El protector del"
	line "bosc pot estar"
	cont "enfadat amb nós…"

	para "Pot ser un mal"
	line "presagi. Hauríem"
	cont "de quedar-nos."
	done

CharcoalKilnBossText2:
	text "Els SLOWPOKE han"
	line "tornat…"

	para "Però el meu APRE-"
	line "NENT no ha tornat"
	cont "del BOSC POKEMON."

	para "On dimonis deu"
	line "ser aquest dropo?"
	done

CharcoalKilnBossText3:
	text "Has foragitat el"
	line "TEAM ROCKET i"

	para "has anat al BOSC"
	line "POKEMON tu sol?"

	para "Tens valor! M'a-"
	line "grada. Vine a"
	cont "entrenar amb nós."
	done

CharcoalKilnApprenticeText1:
	text "On han anat tots"
	line "els SLOWPOKE?"

	para "Deuen estar jugant"
	line "per algun lloc?"
	done

CharcoalKilnApprenticeText2:
	text "Perdona, m'havia"
	line "oblidat de donar-"
	cont "te les gràcies."

	para "Aquest és CARBÓ"
	line "que he fet jo."

	para "Els #MON de foc"
	line "estaran contents"
	cont "de portar-lo."
	done

CharcoalKilnApprenticeText3:
	text "Els SLOWPOKE han"
	line "tornat, i fins i"
	cont "tot has trobat el"
	cont "FARFETCH'D."

	para "Ets el més guai,"
	line "tio!"
	done

FarfetchdText:
	text "FARFETCH'D: Kwaa!"
	done

CharcoalKiln_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 2
	warp_event  3,  7, AZALEA_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  1,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  7,  1, BGEVENT_READ, CharcoalKilnRadio

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  5,  6, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchd, EVENT_CHARCOAL_KILN_FARFETCH_D
