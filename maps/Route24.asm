	object_const_def
	const ROUTE24_ROCKET

Route24_MapScripts:
	def_scene_scripts

	def_callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInFromBlack
	playmapmusic
	end

Route24RocketSeenText:
	text "Ei, nen! Jo ser un"
	line "TEAM ROCKET membre"
	cont "tipus de noi!"

	para "Venir d'un altre"
	line "país, un"
	cont "entrenador"
	cont "número u, jo!"

	para "Pensar jo vaig, si"
	line "aturar l'energia,"

	para "ser gran pànic per"
	line "aquí gent!"

	para "Secret és la meva"
	line "missió, així dir"
	cont "a tu jo no!"

	para "Però! Si guanyar"
	line "tu fas contra mi,"

	para "un home jo ser i"
	line "secret a tu dir."

	para "Ei, nen! Batalla"
	line "començar"
	cont "nosaltres!"
	done

Route24RocketBeatenText:
	text "Aiiieee! No, no,"
	line "no, creure-ho jo"
	cont "no puc!"

	para "Fort molt molt"
	line "ser tu! Rival jo"
	cont "no ser per tu!"
	done

Route24RocketAfterBattleText:
	text "D'acord. Dir a tu"
	line "secret meu jo"
	cont "faré."

	para "PEÇA MÀQUINA robar"
	line "per mi, amagar-la"

	para "jo vaig al GIMNÀS"
	line "de CERULEAN."

	para "Dins aigua posar"
	line "jo vaig. Buscar tu"

	para "a l'aigua centre"
	line "del GIMNÀS."

	para "Però tu oblidar a"
	line "mi no!"

	para "Derrotar a tu de"
	line "segur TEAM ROCKET."

	para "Venir de JOHTO"
	line "ells, els meus"

	para "amics, sí."
	line "Venjança"
	cont "fer ells."
	done

Route24RocketDisappearsText:
	text "…"

	para "Tu dir què? TEAM"
	line "ROCKET adéu-siau"

	para "marxar? Trencat"
	line "estar dius tu?"

	para "Oh, no! Haver jo"
	line "fer què ara a"
	cont "partir de, jo?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
