	object_const_def
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_GENTLEMAN
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F
	const CELADONPOKECENTER1F_EUSINE

CeladonPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CeladonPokecenter1FGentlemanScript:
	jumpstd HappinessCheckScript

CeladonPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerFText

CeladonPokecenter1FPharmacistScript:
	jumptextfaceplayer CeladonPokecenter1FPharmacistText

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	promptbutton
	setval SUICUNE
	special MonCheck
	iffalse .NoSuicune
	special BeastsCheck
	iftrue .HoOh
	writetext NoBeastsText
	waitbutton
.NoSuicune:
	closetext
	end

.HoOh:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .Location1
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement1
	sjump .Continue

.Location1:
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement2
.Continue:
	disappear CELADONPOKECENTER1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.Movement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.Movement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

CeladonPokecenter1FCooltrainerFText:
	text "L'ERIKA és una"
	line "mestra dels"
	cont "#MON"
	cont "de tipus planta."

	para "Et farà pagar si"
	line "no vas amb compte."
	done

CeladonPokecenter1FPharmacistText:
	text "L'amagatall de"
	line "l'EQUIP ROCKET"

	para "era al soterrani"
	line "del CASINO."

	para "Ai, espera. Això"
	line "va ser fa 3 anys."
	done

CeladonEusineText1:
	text "EUSINE: Hola!"

	para "He tornat a"
	line "visitar el meu"
	cont "poble natal."

	para "Feia força temps"
	line "que no hi venia."
	done

EusineLeavesCeladonText:
	text "<PLAYER>, n'has"
	line "sentit a parlar?"

	para "Corren rumors"
	line "recents sobre un"

	para "#MON de colors"
	line "de l'arc de Sant"
	cont "Martí a TORRE DE"
	cont "LLAUNA."

	para "Acabo de curar el"
	line "meu equip, així"

	para "que ara me'n vaig"
	line "cap a ECRUTEAK."

	para "Ja ens veurem,"
	line "<PLAYER>!"
	done

NoBeastsText:
	text "Per cert,"
	line "<PLAYER>."

	para "Has capturat els"
	line "#MON"
	cont "llegendaris"
	cont "RAIKOU i ENTEI?"

	para "<……><……><……>"

	para "D'acord…"

	para "Si en captures"
	line "almenys un, espero"
	cont "que m'ho diguis."

	para "Confio en tu,"
	line "<PLAYER>!"
	done

CeladonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CELADON_CITY, 5
	warp_event  4,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FGentlemanScript, -1
	object_event  0,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPharmacistScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerFScript, -1
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_SET_WHEN_FOUGHT_HO_OH
