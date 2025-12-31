	object_const_def
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText_BeforeEcruteak
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText_AfterEcruteak
	waitbutton
	closetext
	end

BillsYoungerSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsYoungerSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetext BillsYoungerSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsYoungerSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsYoungerSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd PictureBookshelfScript

BillsHouseBookshelf2:
	jumpstd MagazineBookshelfScript

BillsHouseRadio:
	jumpstd Radio2Script

BillTakeThisEeveeText:
	text "BILL: Ei, <PLAYER>!"
	line "Fes-nos un favor i"
	cont "queda't EEVEE."

	para "Va venir quan"
	line "ajustava la"
	cont "CÀPSULA TEMPORAL."

	para "Algú n'ha de tenir"
	line "cura, però no"

	para "m'agrada sortir"
	line "de casa."

	para "Puc comptar amb"
	line "tu per jugar-hi,"
	cont "<PLAYER>?"
	done

BillImCountingOnYouText:
	text "BILL: Sabia que no"
	line "em fallaries!"

	para "Molt bé! Ets un"
	line "crack!"

	para "D'acord, compto"
	line "amb tu."

	para "Cuida'l bé!"
	done

ReceivedEeveeText:
	text "<PLAYER> ha rebut"
	line "EEVEE!"
	done

BillEeveeMayEvolveText:
	text "BILL: El PROF.ELM"
	line "diu que EEVEE pot"

	para "evolucionar de"
	line "maneres noves."
	done

BillPartyFullText:
	text "Espera! No pots"
	line "portar més #MON"
	cont "a sobre."
	done

BillNoEeveeText:
	text "Oh… I ara què"
	line "faig?"
	done

BillPopWontWorkText:
	text "BILL: El meu pare"
	line "no treballa. Només"

	para "fa el gandul tot"
	line "el sant dia."

	para "Comença a ser un"
	line "maldecap…"
	done

BillsMomText_BeforeEcruteak:
	text "Oh, col·lecciones"
	line "#MON? El meu"
	cont "fill BILL n'és"
	cont "un expert."

	para "L'acaben de cridar"
	line "al CENTRE #MON"

	para "de CIUTAT"
	line "ECRUTEAK."

	para "El meu marit ha"
	line "anat al CASINO"

	para "sense que ningú"
	line "el cridés…"
	done

BillsMomText_AfterEcruteak:
	text "El meu marit era"
	line "conegut com un"

	para "#MANÍAC."
	line "En BILL deu haver"

	para "sortit al seu"
	line "pare."
	done

BillsYoungerSisterUsefulNumberText:
	text "Ets entrenador?"

	para "Tinc un número de"
	line "telèfon útil per"
	cont "a tu."
	done

RecordedBillsNumberText:
	text "<PLAYER> ha anotat"
	line "el núm. d'en BILL."
	done

BillsYoungerSisterRefusedNumberText:
	text "El meu germà va"
	line "fer el sistema"
	cont "d'emmagatzem de"
	cont "#MON del PC."

	para "T'anava a donar"
	line "el número d'en"
	cont "BILL…"
	done

BillsYoungerSisterPhoneFullText:
	text "No pots anotar"
	line "més números."
	done

BillsYoungerSisterStorageSystemText:
	text "El meu germà gran"
	line "BILL va crear el"

	para "sistema d'emmagat-"
	line "zematge de"
	cont "#MON."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsYoungerSisterScript, -1
