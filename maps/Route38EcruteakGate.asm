	object_const_def
	const ROUTE38ECRUTEAKGATE_OFFICER

Route38EcruteakGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route38EcruteakGateOfficerScript:
	jumptextfaceplayer Route38EcruteakGateOfficerText

Route38EcruteakGateOfficerText:
	text "D'on has dit"
	line "que ets?"

	para "NEW BARK TOWN?"

	para "El PROF.ELM viu"
	line "allà, oi?"

	para "Has fet un llarg"
	line "camí per arribar."
	done

Route38EcruteakGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_38, 1
	warp_event  0,  5, ROUTE_38, 2
	warp_event  9,  4, ECRUTEAK_CITY, 14
	warp_event  9,  5, ECRUTEAK_CITY, 15

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateOfficerScript, -1
