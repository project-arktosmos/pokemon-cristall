	object_const_def
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_ROCKET1
	const TEAMROCKETBASEB3F_MOLTRES
	const TEAMROCKETBASEB3F_ROCKET_GIRL
	const TEAMROCKETBASEB3F_ROCKET2
	const TEAMROCKETBASEB3F_SCIENTIST1
	const TEAMROCKETBASEB3F_SCIENTIST2
	const TEAMROCKETBASEB3F_ROCKET3
	const TEAMROCKETBASEB3F_RIVAL
	const TEAMROCKETBASEB3F_POKE_BALL1
	const TEAMROCKETBASEB3F_POKE_BALL2
	const TEAMROCKETBASEB3F_POKE_BALL3
	const TEAMROCKETBASEB3F_POKE_BALL4
	const TEAMROCKETBASEB3F_POKE_BALL5

TeamRocketBaseB3F_MapScripts:
	def_scene_scripts
	scene_script TeamRocketBaseB3FLanceGetsPasswordScene, SCENE_TEAMROCKETBASEB3F_LANCE_GETS_PASSWORD
	scene_script TeamRocketBaseB3FNoop1Scene,             SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_script TeamRocketBaseB3FNoop2Scene,             SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_script TeamRocketBaseB3FNoop3Scene,             SCENE_TEAMROCKETBASEB3F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TeamRocketBaseB3FCheckGiovanniDoorCallback

TeamRocketBaseB3FLanceGetsPasswordScene:
	sdefer LanceGetPasswordScript
	end

TeamRocketBaseB3FNoop1Scene:
	end

TeamRocketBaseB3FNoop2Scene:
	end

TeamRocketBaseB3FNoop3Scene:
	end

TeamRocketBaseB3FCheckGiovanniDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftrue .OpenSesame
	endcallback

.OpenSesame:
	changeblock 10, 8, $07 ; floor
	endcallback

LanceGetPasswordScript:
	turnobject PLAYER, LEFT
	pause 5
	turnobject TEAMROCKETBASEB3F_MOLTRES, RIGHT
	pause 20
	applymovement TEAMROCKETBASEB3F_LANCE, RocketBaseLanceApproachesPlayerMovement
	opentext
	writetext LanceGetPasswordText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_LANCE, RocketBaseLanceLeavesMovement
	disappear TEAMROCKETBASEB3F_LANCE
	setscene SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	end

RocketBaseRival:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	appear TEAMROCKETBASEB3F_RIVAL
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalEnterMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext RocketBaseRivalText
	waitbutton
	closetext
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalLeavesMovement
	disappear TEAMROCKETBASEB3F_RIVAL
	setscene SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	special RestartMapMusic
	end

TeamRocketBaseB3FRocketScript:
	jumptextfaceplayer TeamRocketBaseB3FRocketText

RocketBaseBossLeft:
	applymovement PLAYER, RocketBasePlayerApproachesBossLeftMovement
	sjump RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, RocketBasePlayerApproachesBossRightMovement
RocketBaseBoss:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_ROCKET1, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_ROCKET1, DOWN
	opentext
	writetext ExecutiveM4BeforeText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, RocketBaseBossApproachesPlayerMovement
	winlosstext ExecutiveM4BeatenText, 0
	setlasttalked TEAMROCKETBASEB3F_ROCKET1
	loadtrainer EXECUTIVEM, EXECUTIVEM_4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_4
	opentext
	writetext ExecutiveM4AfterText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, RocketBaseBossHitsTableMovement
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_ROCKET1, RocketBaseBossLeavesMovement
	disappear TEAMROCKETBASEB3F_ROCKET1
	setscene SCENE_TEAMROCKETBASEB3F_NOOP
	end

RocketBaseMurkrow:
	opentext
	writetext RocketBaseMurkrowText
	waitbutton
	closetext
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	endifjustbattled
	opentext
	writetext GruntF5AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer GRUNTM, GRUNTM_28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	endifjustbattled
	opentext
	writetext GruntM28AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

TrainerScientistRoss:
	trainer SCIENTIST, ROSS, EVENT_BEAT_SCIENTIST_ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRossAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer SCIENTIST, MITCH, EVENT_BEAT_SCIENTIST_MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMitchAfterBattleText
	waitbutton
	closetext
	end

TeamRocketBaseB3FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	sjump .OpenSesame

.NeedsPassword:
	writetext TeamRocketBaseB3FLockedDoorNeedsPasswordText
	waitbutton
	closetext
	end

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $07 ; floor
	refreshmap
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

TeamRocketBaseB3FOathScript:
	jumpstd TeamRocketOathScript

TeamRocketBaseB3FProtein:
	itemball PROTEIN

TeamRocketBaseB3FXSpecial:
	itemball X_SPECIAL

TeamRocketBaseB3FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB3FIceHeal:
	itemball ICE_HEAL

TeamRocketBaseB3FUltraBall:
	itemball ULTRA_BALL

RocketBaseLanceApproachesPlayerMovement:
	step RIGHT
	step_end

RocketBaseLanceLeavesMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBasePlayerApproachesBossLeftMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

RocketBasePlayerApproachesBossRightMovement:
	step UP
	step UP
	step LEFT
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

RocketBaseBossApproachesPlayerMovement:
	step DOWN
	step_end

RocketBaseBossHitsTableMovement:
	big_step RIGHT
	big_step RIGHT
	step_end

RocketBaseBossLeavesMovement:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	slow_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseRivalEnterMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseRivalLeavesMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "LANCE: Calen dues"
	line "contrasenyes per"

	para "entrar al"
	line "quarter del cap."

	para "Aquestes contrase-"
	line "nyes només les"
	cont "saben uns ROCKETS."

	para "Aquell ROCKET d'a-"
	line "llà m'ho ha dit"
	cont "molt amablement."

	para "<PLAY_G>, anem a"
	line "buscar-les."
	done

TeamRocketBaseB3FRocketText:
	text "Urrggh… El de la"
	line "capa és increïble-"
	cont "ment dur…"
	done

RocketBaseRivalText:
	text "…"

	para "No t'havia dit que"
	line "destruiria l'EQUIP"

	para "ROCKET?"

	para "…Digues-me, qui"
	line "era el de la capa"

	para "que usava #MON"
	line "de tipus drac?"

	para "Els meus #MON"
	line "no"
	cont "van poder fer res."

	para "M'és igual haver"
	line "perdut. El puc"

	para "guanyar amb"
	line "#MON"
	cont "més forts."

	para "El que em molesta"
	line "és el que va dir…"

	para "Em va dir que no"
	line "estimo ni confio"

	para "prou en els meus"
	line "#MON."

	para "M'enfurisma haver"
	line "perdut contra un"
	cont "cor tendre com ell"

	para "…Bah! No tinc"
	line "temps per gent"
	cont "com tu!"
	done

ExecutiveM4BeforeText:
	text "Què? Qui ets tu?"
	line "Aquesta és l'ofi-"

	para "cina del líder,"
	line "GIOVANNI."

	para "Des que va disol-"
	line "dre l'EQUIP ROCKET"

	para "fa tres anys, ha"
	line "estat entrenant."

	para "Però estem segurs"
	line "que tornarà algun"

	para "dia per assumir el"
	line "comandament."

	para "Per això fem"
	line "guàrdia."

	para "No deixaré que"
	line "ningú molesti"
	cont "aquest lloc!"
	done

ExecutiveM4BeatenText:
	text "Jo… No he pogut"
	line "fer res…"

	para "GIOVANNI, si us"
	line "plau perdona'm…"
	done

ExecutiveM4AfterText:
	text "No, no deixaré que"
	line "això m'afecti."

	para "He d'informar els"
	line "altres…"
	done

RocketBaseMurkrowText:
	text "MURKROW: La"
	line "contrasenya és…"

	para "VISCA GIOVANNI."
	done

GruntF5SeenText:
	text "Que si sé la"
	line "contrasenya?"

	para "Potser."

	para "Però cap dèbil me"
	line "la traurà!"
	done

GruntF5BeatenText:
	text "D'acord. Para."
	line "T'ho diré."
	done

GruntF5AfterBattleText:
	text "La contrasenya de"
	line "la sala del cap és"

	para "CUASLOWPOKE."

	para "Però no et servirà"
	line "si no tens les"
	cont "dues contrasenyes."
	done

GruntM28SeenText:
	text "Nyac-nyac-nyac!"

	para "Em reptes a una"
	line "batalla?"

	para "Ha! Ets boig, però"
	line "tens coratge!"

	para "M'agrada!"

	para "Si em guanyes, et"
	line "diré la contrasen-"

	para "ya de la sala del"
	line "cap!"
	done

GruntM28BeatenText:
	text "Nyac-nyac-nyac!"
	line "Ets bo!"
	done

GruntM28AfterBattleText:
	text "Nyac-nyac-nyac!"

	para "La contrasenya de"
	line "la sala del cap…"

	para "Eh…, crec que és"
	line "CUA DE RATICATE."
	done

ScientistRossSeenText:
	text "Abans treballava"
	line "per SILPH, però"

	para "ara dirigeixo la"
	line "recerca de l'EQUIP"
	cont "ROCKET."

	para "Un nen entremetut"
	line "com tu mereix un"
	cont "càstig."
	done

ScientistRossBeatenText:
	text "Un simple error"
	line "tàctic m'ha costat"
	cont "la victòria…"
	done

ScientistRossAfterBattleText:
	text "Un senyal de ràdio"
	line "que torna els"
	cont "#-"
	cont "MON bojos…"

	para "El meu experiment"
	line "és un èxit total."

	para "El meu ascens és"
	line "segur. Perdre no"

	para "significa absolu-"
	line "tament res."
	done

ScientistMitchSeenText:
	text "No m'importa que"
	line "els #MON"
	cont "pateixin"
	cont "pel nostre experi-"
	cont "ment."
	done

ScientistMitchBeatenText:
	text "Pensar és el meu"
	line "punt fort, no pas"
	cont "lluitar."
	done

ScientistMitchAfterBattleText:
	text "Si augmentem la"
	line "potència del nos-"

	para "tre senyal per"
	line "emetre-la arreu…"

	para "Només pensar-ho"
	line "m'emociona!"
	done

TeamRocketBaseB3FLockedDoorNeedsPasswordText:
	text "La porta és"
	line "tancada…"

	para "Calen dues"
	line "contrasenyes per"
	cont "obrir-la."
	done

TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "La porta és"
	line "tancada…"

	para "<PLAYER> ha entrat"
	line "les contrasenyes."

	para "La porta s'ha"
	line "obert!"
	done

TeamRocketBaseB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	def_coord_events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossLeft
	coord_event 11,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossRight
	coord_event  8, 10, SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER, RocketBaseRival

	def_bg_events
	bg_event 10,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 10,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 11,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 12,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 13,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  4, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  5, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  6, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  7, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript

	def_object_events
	object_event 25, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	object_event  8,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_EXECUTIVE
	object_event  7,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 23, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3FRocketScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event  1, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FProtein, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	object_event  3, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FXSpecial, EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	object_event 28,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FFullHeal, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FIceHeal, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FUltraBall, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL
