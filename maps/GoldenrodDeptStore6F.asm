DEF GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE EQU 200
DEF GOLDENRODDEPTSTORE6F_SODA_POP_PRICE    EQU 300
DEF GOLDENRODDEPTSTORE6F_LEMONADE_PRICE    EQU 350

	object_const_def
	const GOLDENRODDEPTSTORE6F_LASS
	const GOLDENRODDEPTSTORE6F_SUPER_NERD

GoldenrodDeptStore6F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodVendingMachine:
	opentext
	writetext GoldenrodVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext GoldenrodClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext GoldenrodVendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "AIGUA FRESCA ¥{d:GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE}@"
	db "REFRESC      ¥{d:GOLDENRODDEPTSTORE6F_SODA_POP_PRICE}@"
	db "LLIMONADA    ¥{d:GOLDENRODDEPTSTORE6F_LEMONADE_PRICE}@"
	db "CANCEL·LAR@"

GoldenrodDeptStore6FLassScript:
	jumptextfaceplayer GoldenrodDeptStore6FLassText

GoldenrodDeptStore6FSuperNerdScript:
	jumptextfaceplayer GoldenrodDeptStore6FSuperNerdText

GoldenrodDeptStore6FDirectory:
	jumptext GoldenrodDeptStore6FDirectoryText

GoldenrodDeptStore6FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodVendingText:
	text "Una màquina"
	line "expenedora!"
	cont "Vet aquí el menú."
	done

GoldenrodClangText:
	text "Clang! Una llauna"
	line "de @"
	text_ram wStringBuffer3
	text_start
	cont "ha sortit!"
	done

GoldenrodVendingNoMoneyText:
	text "No tens prou"
	line "diners."
	done

GoldenrodVendingNoSpaceText:
	text "No hi ha més lloc"
	line "per a res més."
	done

GoldenrodDeptStore6FLassText:
	text "Escoltes el CANAL"
	line "DE LA SORT?"

	para "Si vols guanyar,"
	line "intercanvia"
	cont "#MON"

	para "amb tanta gent"
	line "com puguis per"

	para "obtenir números"
	line "d'ID diferents."
	done

GoldenrodDeptStore6FSuperNerdText:
	text "Si estàs cansat,"
	line "prova les begudes"
	cont "de la màquina."

	para "Als teus #MON"
	line "també els"
	cont "encantaran."
	done

GoldenrodDeptStore6FDirectoryText:
	text "Fes un descans"
	line "de les compres!"

	para "6F PLAÇA TRANQUIL"
	done

GoldenrodDeptStore6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  0, GOLDENROD_DEPT_STORE_5F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 13,  0, GOLDENROD_DEPT_STORE_ROOF, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore6FElevatorButton
	bg_event  8,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event  9,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event 10,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event 11,  1, BGEVENT_UP, GoldenrodVendingMachine

	def_object_events
	object_event 10,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore6FLassScript, -1
	object_event  8,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore6FSuperNerdScript, -1
