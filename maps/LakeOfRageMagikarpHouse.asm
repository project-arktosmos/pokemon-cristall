object_const_def
const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign: ; unreferenced
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

MagikarpLengthRaterText_LakeOfRageHistory:
	text "El LLAC FÚRIA és"
	line "de fet un cràter"

	para "creat per GYARADOS"
	line "enfurismats."

	para "El cràter es va"
	line "omplir d'aigua de"

	para "pluja i així es"
	line "va formar el LLAC."

	para "Aquesta és la"
	line "història que ens"

	para "va transmetre el"
	line "besavi del meu"
	cont "avi."

	para "Abans s'hi podien"
	line "pescar MAGIKARP"

	para "ben vivaços,"
	line "però…"

	para "No entenc què està"
	line "passant."
	done

MagikarpLengthRaterText_MenInBlack:
	text "El LLAC no és"
	line "normal des que van"

	para "arribar aquells"
	line "homes de negre."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "El LLAC FÚRIA ha"
	line "tornat a la"
	cont "normalitat."

	para "Els MAGIKARP han"
	line "tornat."

	para "Potser encara puc"
	line "complir el meu"
	cont "somni de veure el"
	cont "MAGIKARP més gran"
	cont "del món."

	para "Tens una CANYA?"
	line "Si en tens, si us"
	cont "plau, ajuda'm."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Oh, tens un"
	line "MAGIKARP! A veure"

	para "com n'és de gran"
	line "aquest petitó."
	done

MagikarpLengthRaterText_Memento:
	text "Uau! Aquest és"
	line "excepcional!"

	para "Em trec el barret"
	line "davant teu!"

	para "Pren això com a"
	line "record!"
	done

MagikarpLengthRaterText_Bonus:
	text "El rècord és el"
	line "que importa."

	para "Considera-ho un"
	line "extra!"
	done

MagikarpLengthRaterText_TooShort:
	text "Uau! Aquest és"
	line "excepcional!"

	para "…M'agradaria"
	line "poder dir-ho, però"

	para "n'he vist un de"
	line "més gran abans."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Què? Això no és"
	line "un MAGIKARP!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh… Així que no"
	line "n'has pescat cap"

	para "prou bo per"
	line "ensenyar-me'l?"
	cont "Potser un altre"
	cont "cop."
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "RÈCORD ACTUAL"

	para "@"
	text_ram wStringBuffer3
	text " capturat per"
	line "@"
	text_ram wStringBuffer4
	text_end

LakeOfRageMagikarpHouseUnusedDummyText: ; unreferenced
	text_end

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
