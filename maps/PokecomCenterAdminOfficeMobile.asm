object_const_def
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3

PokecomCenterAdminOfficeMobile_MapScripts:
	def_scene_scripts

	def_callbacks

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text

PokecomCenterAdminOfficeMobileComputer1:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text
	waitbutton
.loop:
	refreshmap
	loadmenu .Computer1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeComClub
	ifequal 2, .MobileCenter
	sjump .Quit

.PokeComClub:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub
	waitbutton
	sjump .loop

.MobileCenter:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "CLUB #COM@"
	db "CENTRE MÒBIL@"
	db "SORTIR@"

PokecomCenterAdminOfficeMobileComputer2:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text
	waitbutton
.loop:
	refreshmap
	loadmenu .Computer2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UsePhone
	ifequal 2, .DontUsePhone
	sjump .Quit

.UsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_UsePhone
	waitbutton
	sjump .loop

.DontUsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Usar el telèfon@"
	db "No puc connectar@"
	db "SORTIR@"

PokecomCenterAdminOfficeMobileComputer3:
	jumptext PokecomCenterAdminOfficeMobileComputer3Text

PokecomCenterAdminOfficeMobileScientist1Text:
	text "El CENTRE #COM"
	line "i"
	cont "el CENTRE MÒBIL"

	para "es van construir"
	line "per satisfer la"

	para "demanda d'interc."
	line "i combats amb"

	para "entrenadors"
	line "llunyans i amb"
	cont "desconeguts."
	done

PokecomCenterAdminOfficeMobileScientist2Text:
	text "Quan et vas"
	line "connectar amb algú"

	para "per telèfon mòbil"
	line "per primera vegada"

	para "no et va"
	line "impressionar?"

	para "Quan el meu primer"
	line "intent va funcio-"

	para "nar, em vaig"
	line "emocionar tant que"
	cont "em van tremolar!"
	done

PokecomCenterAdminOfficeMobileScientist3Text:
	text "Van poder"
	line "construir"
	cont "aquestes grans"

	para "instal·lacions"
	line "gràcies als aven-"
	cont "ços sense fils."
	done

PokecomCenterAdminOfficeMobileComputer1Text:
	text "És un avís sobre"
	line "on s'han d'usar"

	para "els ADAPTADORS"
	line "MÒBILS…"
	done

PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub:
	text "Hi ha un CLUB"
	line "#COM al pis de"

	para "dalt de qualsevol"
	line "CENTRE #MON."

	para "Allà pots comba-"
	line "tre o intercanviar"

	para "amb un amic llunyà"
	line "usant un ADAPTADOR"
	cont "MÒBIL."

	para "Per connectar-te,"
	line "el teu amic ha de"

	para "tenir el mateix"
	line "tipus d'ADAPTADOR"
	cont "MÒBIL que tu."
	done

PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter:
	text "Per usar el RACÓ"
	line "D'INTERCANVI o"

	para "llegir NOTÍCIES"
	line "#MON, has de"
	cont "trucar al CENTRE"
	cont "MÒBIL."

	para "T'has de registrar"
	line "al CENTRE MÒBIL"

	para "abans de"
	line "connectar-t'hi."
	done

PokecomCenterAdminOfficeMobileComputer2Text:
	text "És un avís sobre"
	line "l'ús del"
	cont "telèfon…"
	done

PokecomCenterAdminOfficeMobileComputer2Text_UsePhone:
	text "Assegura't que el"
	line "telèfon i"

	para "l'ADAPTADOR MÒBIL"
	line "estiguin ben"
	cont "connectats."

	para "Assegura't que el"
	line "senyal del telèfon"
	cont "sigui fort."

	para "No toquis ni"
	line "pengis el telèfon"
	cont "mentre connectes."
	done

PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone:
	text "Si el servidor"
	line "està ocupat, pot"

	para "ser que no puguis"
	line "connectar-te."

	para "Si és així, torna"
	line "a trucar més tard."

	para "Si no pots"
	line "connectar-te o no"

	para "entens els"
	line "missatges d'error,"

	para "truca a un centre"
	line "d'assistència o"
	cont "llegeix el manual."
	done

PokecomCenterAdminOfficeMobileComputer3Text:
	text "L'OFICINA"
	line "D'ADMINISTRACIÓ ha"
	cont "rebut un e-mail…"

	para "<……> <……> <……>"

	para "Al personal del"
	line "CENTRE #COM…"

	para "La comunicació"
	line "sense fils ha"

	para "permès que els"
	line "entrenadors de"

	para "#MON interac-"
	line "tuïn arreu del"

	para "país. Continuem"
	line "treballant pel dia"

	para "en què tots els"
	line "entrenadors del"

	para "món es puguin"
	line "connectar sense"
	cont "barreres!"

	para "<……> <……> <……>"
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0, 31, GOLDENROD_POKECENTER_1F, 3
	warp_event  1, 31, GOLDENROD_POKECENTER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  6, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer1
	bg_event  6, 28, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer2
	bg_event  3, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer3

	def_object_events
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
