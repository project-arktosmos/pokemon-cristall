	object_const_def
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext CeladonMansionRoofHousePharmacistIntroText
	promptbutton
	checktime NITE
	iftrue .Night
	writetext CeladonMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext CeladonMansionRoofHousePharmacistStoryText
	promptbutton
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext CeladonMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

CeladonMansionRoofHousePharmacistIntroText:
	text "Deixa'm explicar"
	line "un conte de por…"
	done

CeladonMansionRoofHousePharmacistNotNightText:
	text "Bé, però no fa"
	line "tanta por mentre"

	para "encara hi ha llum"
	line "a fora."

	para "Torna després de"
	line "la posta, d'acord?"
	done

CeladonMansionRoofHousePharmacistStoryText:
	text "Vet aquí que una"
	line "vegada, hi havia"

	para "un nen a qui van"
	line "regalar una BICI…"

	para "Volia provar-la"
	line "de seguida…"

	para "S'ho passava tan"
	line "bé que no es va"

	para "adonar que el sol"
	line "s'havia post…"

	para "Mentre tornava a"
	line "casa en la foscor"

	para "de la nit, la bici"
	line "va frenar de cop!"

	para "Els pedals es van"
	line "fer pesants!"

	para "Quan va deixar de"
	line "pedalar, la bici"

	para "va començar a anar"
	line "enrere!"

	para "Era com si la bici"
	line "estigués malëida"

	para "i volgués arrosse-"
	line "gar-lo a l'oblit!"

	para "…"

	para "…"

	para "AAAAHHH!"

	para "El nen havia anat"
	line "costa amunt per la"
	cont "RUTA CICLISTA!"

	para "…"
	line "Bum-bum, bum-bum!"

	para "Per escoltar amb"
	line "tanta paciència,"

	para "et regalo això:"
	line "la MT03!"
	done

CeladonMansionRoofHousePharmacistCurseText:
	text "La MT03 conté"
	line "CURSE."

	para "És un moviment"
	line "terrorífic que"

	para "va reduint els PS"
	line "de la víctima."
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1
