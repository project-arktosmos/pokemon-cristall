	object_const_def
	const ROUTE35GOLDENRODGATE_RANDY
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER

Route35GoldenrodGate_MapScripts:
	def_scene_scripts

	def_callbacks

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftrue .gothpup
	checkevent EVENT_GAVE_KENYA
	iftrue .questcomplete
	checkevent EVENT_GOT_KENYA
	iftrue .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalse .refused
	writetext Route35GoldenrodGateRandyThanksText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, 10, NO_ITEM, GiftSpearowName, GiftSpearowOTName
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	writetext Route35GoldenrodGateRandyWeirdTreeBlockingRoadText
	waitbutton
	closetext
	end

.partyfull
	writetext Route35GoldenrodGateRandyCantCarryAnotherMonText
	waitbutton
	closetext
	end

.refused
	writetext Route35GoldenrodGateRandyOhNeverMindThenText
	waitbutton
	closetext
	end

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	closetext
	end

GiftSpearowMail:
	db FLOWER_MAIL
	db   "La COVA FOSCA"
	next "duu a altra ruta@"

GiftSpearowName:
	db "KENYA@"

GiftSpearowOTName:
	db "RANDY@"

	db 0 ; unused

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText
	waitbutton
	closetext
	end

.FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText_FoughtSudowoodo
	waitbutton
	closetext
	end

Route35GoldenrodGateFisherScript:
	jumptextfaceplayer Route35GoldenrodGateFisherText

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Ei, petit!"
	line "Em pots fer un"
	cont "favor?"

	para "Pots portar"
	line "aquest #MON amb"
	cont "CARTA a un amic?"

	para "És a la RUTA 31."
	done

Route35GoldenrodGateRandyThanksText:
	text "Ho faràs? Genial!"
	line "Gràcies, petit!"

	para "El meu amic és un"
	line "home grassonet que"
	cont "sempre dorm."

	para "El reconeixeràs"
	line "de seguida!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> ha rebut"
	line "un #MON amb"
	cont "CARTA."
	done

Route35GoldenrodGateRandyWeirdTreeBlockingRoadText:
	text "La pots llegir,"
	line "però no la perdis!"
	cont "RUTA 31!"

	para "Ah, sí. Hi havia"
	line "un arbre estrany"
	cont "bloquejant el camí"

	para "Em pregunto si ja"
	line "l'han tret?"
	done

Route35GoldenrodGateRandyCantCarryAnotherMonText:
	text "No pots portar"
	line "un altre #MON…"
	done

Route35GoldenrodGateRandyOhNeverMindThenText:
	text "Oh… No importa,"
	line "doncs…"
	done

Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "Gràcies, petit!"
	line "Has fet el"
	cont "lliurament per mi!"

	para "Aquí tens alguna"
	line "cosa per les teves"
	cont "molèsties!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "El meu amic estava"
	line "dormint, oi? Heh,"
	cont "què t'havia dit?"
	done

Route35GoldenrodGatePokefanFText:
	text "Un arbre estrany"
	line "bloqueja el camí."

	para "Es mou si li"
	line "parles."

	para "Diuen que es va"
	line "tornar boig quan"

	para "algú el va regar"
	line "amb una AMPOLLETA."
	done

Route35GoldenrodGatePokefanFText_FoughtSudowoodo:
	text "M'agrada la"
	line "cançó de bressol"
	cont "#MON de la"
	cont "ràdio."
	done

Route35GoldenrodGateFisherText:
	text "Em pregunto quants"
	line "tipus de #MON"

	para "hi ha al món."

	para "Fa tres anys, el"
	line "PROF.OAK va dir"

	para "que n'hi havia 150"
	line "de diferents."
	done

Route35GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGateFisherScript, -1
