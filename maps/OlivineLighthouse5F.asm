object_const_def
const OLIVINELIGHTHOUSE5F_SAILOR
const OLIVINELIGHTHOUSE5F_YOUNGSTER
const OLIVINELIGHTHOUSE5F_POKE_BALL1
const OLIVINELIGHTHOUSE5F_POKE_BALL2
const OLIVINELIGHTHOUSE5F_POKE_BALL3

OlivineLighthouse5F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperDenis:
	trainer BIRD_KEEPER, DENIS, EVENT_BEAT_BIRD_KEEPER_DENIS, BirdKeeperDenisSeenText, BirdKeeperDenisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperDenisAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorErnest:
	trainer SAILOR, ERNEST, EVENT_BEAT_SAILOR_ERNEST, SailorErnestSeenText, SailorErnestBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorErnestAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse5FRareCandy:
	itemball RARE_CANDY

OlivineLighthouse5FSuperRepel:
	itemball SUPER_REPEL

OlivineLighthouse5FTMSwagger:
	itemball TM_SWAGGER

OlivineLighthouse5FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_OLIVINE_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION

SailorErnestSeenText:
	text "Volia lluitar amb"
	line "JASMINE, però ara"

	para "no està en forma."
	line "I tu, què tal?"
	done

SailorErnestBeatenText:
	text "Ui, ui! Ets massa"
	line "fort!"
	done

SailorErnestAfterBattleText:
	text "Un LÍDER DE GIMNÀS"
	line "no només ha de ser"

	para "fort. Un LÍDER"
	line "també ha de tenir"
	cont "compassió."
	done

BirdKeeperDenisSeenText:
	text "Som molt amunt."
	line "Els meus #MON"

	para "ocell estan en"
	line "plena forma."
	done

BirdKeeperDenisBeatenText:
	text "Oi! Han caigut…"
	done

BirdKeeperDenisAfterBattleText:
	text "Els meus #MON"
	line "van aprendre a"
	cont "fer FLY a"
	cont "CIANWOOD."

	para "Bé, com que he"
	line "perdut, volaré"
	cont "cap al mar…"
	done

OlivineLighthouse5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_6F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_4F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_4F, 3
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_4F, 9
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_4F, 10
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_6F, 2
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_6F, 3

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_ITEM, OlivineLighthouse5FHiddenHyperPotion

	def_object_events
	object_event  8, 11, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorErnest, -1
	object_event  8,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperDenis, -1
	object_event 15, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FRareCandy, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY
	object_event  6, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FSuperRepel, EVENT_OLIVINE_LIGHTHOUSE_5F_SUPER_REPEL
	object_event  2, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FTMSwagger, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_SWAGGER
