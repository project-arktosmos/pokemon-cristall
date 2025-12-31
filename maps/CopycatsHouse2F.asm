object_const_def
const COPYCATSHOUSE2F_COPYCAT1 ; if player is male
const COPYCATSHOUSE2F_DODRIO
const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
const COPYCATSHOUSE2F_MONSTERDOLL
const COPYCATSHOUSE2F_BIRDDOLL
const COPYCATSHOUSE2F_COPYCAT2 ; if player is female

CopycatsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CopycatsHouse2FWhichGenderCallback

CopycatsHouse2FWhichGenderCallback:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	disappear COPYCATSHOUSE2F_COPYCAT2
	appear COPYCATSHOUSE2F_COPYCAT1
	sjump .Done
.Female:
	disappear COPYCATSHOUSE2F_COPYCAT1
	appear COPYCATSHOUSE2F_COPYCAT2
.Done:
	endcallback

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	sjump .Default_Merge_1

.Default_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.Default_Merge_1:
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2a
	writetext CopycatText_Male_1
	sjump .Default_Merge_2a

.Default_Female_2a:
	writetext CopycatText_Female_1
.Default_Merge_2a:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3a
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .Default_Merge_3a

.Default_Female_3a:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3a:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2b
	writetext CopycatText_Male_2
	sjump .Default_Merge_2b

.Default_Female_2b:
	writetext CopycatText_Female_2
.Default_Merge_2b:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3b
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .Default_Merge_3b

.Default_Female_3b:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3b:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	promptbutton
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	promptbutton
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	sjump .GotPass_Merge_1

.GotPass_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.GotPass_Merge_1:
	special LoadUsedSpritesGFX
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_2
	writetext CopycatText_Male_3
	sjump .GotPass_Merge_2

.GotPass_Female_2:
	writetext CopycatText_Female_3
.GotPass_Merge_2:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_3
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .GotPass_Merge_3

.GotPass_Female_3:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.GotPass_Merge_3:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	promptbutton
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd PictureBookshelfScript

CopycatSpinAroundMovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

CopycatText_Male_1:
	text "<PLAYER>: Hola!"
	line "T'agraden els"
	cont "#?"

	para "<PLAYER>: Eh, no,"
	line "t'ho pregunto jo."

	para "<PLAYER>: Què?"
	line "Ets estranya!"
	done

CopycatText_QuickMimicking:
	text "IMITADORA: Hmm?"
	line "Que deixi"
	cont "d'imitar?"

	para "Però és el meu"
	line "passatemps"
	cont "preferit!"
	done

CopycatText_Male_2:
	text "<PLAYER>: Hola!"
	line "M'han dit que has"

	para "perdut la teva"
	line "NINA #"
	cont "preferida."

	para "<PLAYER>: Si la"
	line "trobo, em donaràs"
	cont "un ABONAMENT?"

	para "<PLAYER>: Aniré"
	line "a buscar-la."

	para "Creus que la vas"
	line "perdre quan vas"
	cont "anar a VERMILION?"
	done

CopycatText_Worried:
	text "IMITADORA:"
	line "Perdona?"

	para "No hauria de dir"
	line "què has de fer?"

	para "Però estic molt"
	line "preocupada… I si"
	cont "algú la troba?"
	done

CopycatText_GiveDoll:
	text "IMITADORA: Bé!"
	line "És la meva NINA"
	cont "# de CLEFAIRY!"

	para "Veus l'esquinç on"
	line "està cosida la"

	para "cama dreta? Això"
	line "ho demostra!"
	done

CopycatText_GivePass:
	text "Bé. Aquí tens"
	line "l'ABONAMENT del"
	cont "TREN MAGNÈTIC!"
	done

CopycatText_ExplainPass:
	text "IMITADORA: Aquest"
	line "és l'ABONAMENT"
	cont "del TREN MAGNÈTIC."

	para "L'home de la"
	line "companyia me'l va"

	para "donar quan van"
	line "enderrocar casa"
	cont "per a l'ESTACIÓ."
	done

CopycatText_Male_3:
	text "<PLAYER>: Hola!"
	line "Moltes gràcies"
	cont "per l'ABONAMENT!"

	para "<PLAYER>: Perdona?"

	para "<PLAYER>: És tan"
	line "divertit imitar"
	cont "tot el que faig?"
	done

CopycatText_ItsAScream:
	text "IMITADORA: I tant!"
	line "És molt divertit!"
	done

CopycatText_Female_1:
	text "<PLAYER>: Hola."
	line "T'agraden els"
	cont "#."

	para "<PLAYER>: No, jo"
	line "no. T'ho pregunto."

	para "<PLAYER>: Perdona?"
	line "Ets estranya!"
	done

CopycatText_Female_2:
	text "<PLAYER>: Hola. De"
	line "veritat has perdut"
	cont "la teva NINA #?"

	para "<PLAYER>: De"
	line "veritat em donaràs"

	para "un ABONAMENT si"
	line "la trobo?"

	para "<PLAYER>: D'acord,"
	line "la buscaré!"

	para "Creus que la vas"
	line "perdre quan eres"
	cont "a VERMILION?"
	done

CopycatText_Female_3:
	text "<PLAYER>: Gràcies"
	line "per l'ABONAMENT!"

	para "<PLAYER>: …Perdona?"

	para "<PLAYER>: De"
	line "veritat és tan"

	para "divertit copiar el"
	line "que dic i faig?"
	done

CopycatsDodrioText1:
	text "DODRIO: Gii giii!"
	done

CopycatsDodrioText2:
	text "MIRALLET, MIRALLET"
	line "DE LA PARET, QUI"

	para "ÉS LA MÉS BONICA"
	line "DEL MÓN?"
	done

CopycatsHouse2FDollText:
	text "Això és un #MON"
	line "rar! Eh?"

	para "Només és una nina…"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_2
