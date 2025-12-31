DEF ROUTE39FARMHOUSE_MILK_PRICE EQU 500

	object_const_def
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	def_scene_scripts

	def_callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegiveitem TM_SNORE
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd PictureBookshelfScript

FarmerMText_SickCow:
	text "La meva MILTANK"
	line "ja no em dóna"
	cont "llet."

	para "La GRANJA és"
	line "famosa per la"
	cont "seva llet."

	para "Tothom en vol"
	line "tastar."

	para "Em farà molta"
	line "llet si li dono"

	para "moltes BAIES,"
	line "crec jo."
	done

FarmerMText_BuyMilk:
	text "Vols LLET MUMUUU?"

	para "N'estic molt"
	line "orgullós."

	para "Dóna-la a un"
	line "#MON per curar"
	cont "els seus PS!"

	para "Te la deixo per"
	line "només ¥{d:ROUTE39FARMHOUSE_MILK_PRICE}."
	done

FarmerMText_GotMilk:
	text "Aquí tens!"
	line "Que l'aprofitis!"
	done

FarmerMText_NoMoney:
	text "Ho sento."
	line "Sense diners, res!"
	done

FarmerMText_NoRoom:
	text "Em sembla que la"
	line "MOTXILLA és plena."
	done

FarmerMText_NoSale:
	text "No en vols?"
	line "Torna quan"
	cont "vulguis!"
	done

FarmerMText_Milking:
	text "Millor que vagi a"
	line "munyir."
	done

FarmerFText_InTrouble:
	text "La nostra llet"
	line "arriba fins a"
	cont "KANTO."

	para "Així que si la"
	line "nostra MILTANK no"

	para "ens dóna llet,"
	line "tenim un problema."
	done

FarmerFText_HealedMiltank:
	text "Has curat la"
	line "nostra MILTANK."

	para "Ara ja torna a"
	line "donar LLET MUMUUU."

	para "Aquí tens una"
	line "cosa per les"
	cont "molèsties."
	done

Text_ReceivedTM13: ; unreferenced
	text "<PLAYER> ha rebut"
	line "la MT13."
	done

FarmerFText_SnoreSpeech:
	text "Això és SNORE."

	para "És un moviment"
	line "rar que només"

	para "funciona quan el"
	line "#MON dorm."

	para "Pensa bé com"
	line "l'hauries de fer"
	cont "servir."
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
