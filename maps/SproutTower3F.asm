	object_const_def
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_RIVAL

SproutTower3F_MapScripts:
	def_scene_scripts
	scene_script SproutTower3FNoop1Scene, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER
	scene_script SproutTower3FNoop2Scene, SCENE_SPROUTTOWER3F_NOOP

	def_callbacks

SproutTower3FNoop1Scene:
	end

SproutTower3FNoop2Scene:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, SproutTower3FPlayerApproachesRivalMovement
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalApproachesElderMovement
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_RIVAL, 15
	turnobject SPROUTTOWER3F_RIVAL, DOWN
	pause 15
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalLeavesElderMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_RIVAL, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_RIVAL
	waitsfx
	special FadeInFromBlack
	setscene SCENE_SPROUTTOWER3F_NOOP
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	promptbutton
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

SproutTower3FPlayerApproachesRivalMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SproutTower3FRivalApproachesElderMovement:
	step UP
	step_end

SproutTower3FRivalLeavesElderMovement:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "ANCIÀ: Ets un"
	line "entrenador molt"
	cont "hàbil, certament."

	para "Com vaig prometre,"
	line "aquí tens la teva"
	cont "MO."

	para "Però deixa'm dir-"
	line "te una cosa:"
	cont "hauri-"
	cont "es tractar millor"
	cont "els teus #MON."

	para "La manera com"
	line "lluites és massa"
	cont "dura."

	para "Els #MON no són"
	line "eines de guerra…"
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…"
	line "…Bah!"

	para "Diu que és"
	line "l'ANCIÀ però"
	cont "és feble."

	para "Era d'esperar."

	para "Mai perdria contra"
	line "ximples que xerren"

	para "sobre tractar bé"
	line "els #MON."

	para "Només m'importen"
	line "els #MON forts"
	cont "que poden guanyar."

	para "Els #MON febles"
	line "m'importen ben"
	cont "poc."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> ha usat"
	line "una CORDA FUITA!"
	done

SageLiSeenText:
	text "Molt bé que hagis"
	line "vingut!"

	para "La TORRE"
	line "BELLSPROUT"
	cont "és un lloc"
	cont "d'entrenament."

	para "Persones i #MON"
	line "posen a prova els"
	cont "seus vincles"

	para "per construir un"
	line "futur brillant"
	cont "junts."

	para "Jo sóc la prova"
	line "final."

	para "Deixa'm comprovar"
	line "els llaços entre"

	para "tu i els teus"
	line "#MON!"
	done

SageLiBeatenText:
	text "Ah, excel·lent!"
	done

SageLiTakeThisFlashText:
	text "Tu i els teus"
	line "#MON no hauríeu"

	para "de tenir cap"
	line "problema usant"
	cont "aquest moviment."

	para "Pren aquesta MO"
	line "FLASH."
	done

SageLiFlashExplanationText:
	text "FLASH il·lumina"
	line "fins i tot els"
	cont "llocs més foscos."

	para "Però per usar-lo"
	line "fora de combat,"

	para "necessites la"
	line "MEDALLA del GIM"
	cont "de VIOLETA."
	done

SageLiAfterBattleText:
	text "Espero que"
	line "aprenguis"
	cont "i creixis amb el"
	cont "teu viatge."
	done

SageJinSeenText:
	text "Entreno per trobar"
	line "la il·luminació"
	cont "en els #MON!"
	done

SageJinBeatenText:
	text "El meu entrena-"
	line "ment és incomplet…"
	done

SageJinAfterBattleText:
	text "Quan els #MON"
	line "es"
	cont "fan més forts,"
	cont "l'entrenador"
	cont "també."

	para "No, espera. Quan"
	line "l'entrenador es"

	para "fa més fort, els"
	line "#MON també."
	done

SageTroySeenText:
	text "Deixa'm veure"
	line "quant"
	cont "confies en els"
	cont "teus #MON."
	done

SageTroyBeatenText:
	text "Sí, la teva"
	line "confiança és real!"
	done

SageTroyAfterBattleText:
	text "L'ANCIÀ no és"
	line "gaire lluny."
	done

SageNealSeenText:
	text "La MO de l'ANCIÀ"
	line "il·lumina fins i"
	cont "tot la foscor més"
	cont "negra."
	done

SageNealBeatenText:
	text "És el meu cap el"
	line "que brilla!"
	done

SageNealAfterBattleText:
	text "Que hi hagi llum"
	line "en el teu viatge."
	done

SproutTower3FPaintingText:
	text "És una pintura"
	line "poderosa d'un"
	cont "BELLSPROUT."
	done

SproutTower3FStatueText:
	text "Una estàtua de"
	line "#MON…"

	para "Sembla molt"
	line "distingida."
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	def_coord_events
	coord_event 11,  9, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER, SproutTower3FRivalScene

	def_bg_events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	def_object_events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
