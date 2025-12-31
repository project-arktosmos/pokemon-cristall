	object_const_def
	const GOLDENRODHAPPINESSRATER_TEACHER
	const GOLDENRODHAPPINESSRATER_POKEFAN_M
	const GOLDENRODHAPPINESSRATER_TWIN

GoldenrodHappinessRater_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	promptbutton
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	sjump .LooksMean

.LovesYouALot:
	writetext GoldenrodHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext GoldenrodHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext GoldenrodHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext GoldenrodHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext GoldenrodHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext GoldenrodHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

GoldenrodHappinessRaterPokefanMScript:
	jumptextfaceplayer GoldenrodHappinessRaterPokefanMText

GoldenrodHappinessRaterTwinScript:
	jumptextfaceplayer GoldenrodHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd DifficultBookshelfScript

HappinessRatersHouseRadio:
	jumpstd Radio2Script

GoldenrodHappinessRaterTeacherText:
	text "Si tractes bé els"
	line "teus #MON,"

	para "t'estimaran a"
	line "canvi."

	para "Oh? Deixa'm veure"
	line "el teu @"
	text_ram wStringBuffer3
	text "…"
	done

GoldenrodHappinessRatingText_LovesYouALot:
	text "Sembla molt feliç!"
	line "T'ha d'estimar"
	cont "moltíssim."
	done

GoldenrodHappinessRatingText_ReallyTrustsYou:
	text "Tinc la sensació"
	line "que confia molt"
	cont "en tu."
	done

GoldenrodHappinessRatingText_SortOfHappy:
	text "És amistós amb"
	line "tu. Sembla força"
	cont "content."
	done

GoldenrodHappinessRatingText_QuiteCute:
	text "És força bufó."
	done

GoldenrodHappinessRatingText_NotUsedToYou:
	text "Hauries de"
	line "tractar-lo millor."
	cont "No s'hi avesa."
	done

GoldenrodHappinessRatingText_LooksMean:
	text "No sembla que li"
	line "agradi gens."
	cont "Fa mala cara."
	done

GoldenrodHappinessRaterPokefanMText:
	text "No paro de perdre"
	line "batalles, i els"

	para "meus #MON"
	line "s'esvaeixen…"

	para "Potser per això"
	line "els meus #MON"
	cont "no m'estimen…"
	done

GoldenrodHappinessRaterTwinText:
	text "Quan uso un"
	line "objecte amb el"

	para "meu #MON, es"
	line "posa molt content!"
	done

GoldenrodHappinessRater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 3
	warp_event  3,  7, GOLDENROD_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, HappinessRatersHouseRadio

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterPokefanMScript, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTwinScript, -1
