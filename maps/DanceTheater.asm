	object_const_def
	const DANCETHEATER_KIMONO_GIRL1
	const DANCETHEATER_KIMONO_GIRL2
	const DANCETHEATER_KIMONO_GIRL3
	const DANCETHEATER_KIMONO_GIRL4
	const DANCETHEATER_KIMONO_GIRL5
	const DANCETHEATER_GENTLEMAN
	const DANCETHEATER_RHYDON
	const DANCETHEATER_COOLTRAINER_M
	const DANCETHEATER_GRANNY

DanceTheater_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerKimonoGirlNaoko:
	trainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaokoSeenText, KimonoGirlNaokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	sjump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end

DanceTheaterCooltrainerMScript:
	jumptextfaceplayer DanceTheaterCooltrainerMText

DanceTheaterGrannyScript:
	jumptextfaceplayer DanceTheaterGrannyText

DanceTheaterFancyPanel:
	jumptext DanceTheaterFancyPanelText

KimonoGirlNaokoSeenText:
	text "Tens uns #MON"
	line "preciosos. Puc"
	cont "veure'ls lluitar?"
	done

KimonoGirlNaokoBeatenText:
	text "Oh, ets molt"
	line "fort."
	done

KimonoGirlNaokoAfterBattleText:
	text "He gaudit del"
	line "combat. M'agra-"
	cont "daria veure't més."
	done

KimonoGirlSayoSeenText:
	text "Sempre ballo amb"
	line "els meus #MON."

	para "És clar, també"
	line "els entreno."
	done

KimonoGirlSayoBeatenText:
	text "Oh, per poc!"
	line "Quasi t'he guanyat"
	done

KimonoGirlSayoAfterBattleText:
	text "El ritme és impor-"
	line "tant tant per al"

	para "ball com pels"
	line "#MON."
	done

KimonoGirlZukiSeenText:
	text "No és bonica la"
	line "meva agulla?"

	para "Oh. Un combat"
	line "#MON?"
	done

KimonoGirlZukiBeatenText:
	text "No em queden més"
	line "#MON…"
	done

KimonoGirlZukiAfterBattleText:
	text "Poso una flor"
	line "diferent a la me-"
	cont "va agulla cada mes"
	done

KimonoGirlKuniSeenText:
	text "Oh, ets un entre-"
	line "nador molt maco."
	cont "Vols lluitar?"
	done

KimonoGirlKuniBeatenText:
	text "Ets més fort del"
	line "que sembles."
	done

KimonoGirlKuniAfterBattleText:
	text "He entrenat molt,"
	line "així que pensava"

	para "que era capaç."
	line "Veig que no."
	done

KimonoGirlMikiSeenText:
	text "T'agrada com"
	line "ballo? També sóc"
	cont "bona amb #MON."
	done

KimonoGirlMikiBeatenText:
	text "Uau, tu també ets"
	line "bo amb #MON."
	done

KimonoGirlMikiAfterBattleText:
	text "Puc seguir ballant"
	line "perquè hi ha gent"

	para "que gaudeix del"
	line "que faig."

	para "Els meus #MON"
	line "també m'animen."
	done

SurfGuyNeverLeftAScratchText:
	text "Les NOIES QUIMONO"
	line "no només ballen"

	para "bé, també són"
	line "molt bones amb"
	cont "els #MON."

	para "Sempre les repte,"
	line "però no els he"

	para "fet ni un"
	line "rasguny…"
	done

SurfGuyLadGiftText:
	text "Noi! Si pots"
	line "derrotar totes"

	para "les NOIES QUIMONO,"
	line "et faré un regal."
	done

SurfGuyLassieGiftText:
	text "Noia! Si pots"
	line "derrotar totes"

	para "les NOIES QUIMONO,"
	line "et faré un regal."
	done

SurfGuyLikeADanceText:
	text "La manera com has"
	line "lluitat, era com"
	cont "veure un ball."

	para "Ha estat tot un"
	line "plaer de veure!"

	para "Vull que tinguis"
	line "això. No pateixis,"
	cont "agafa-ho!"
	done

SurfGuySurfExplanationText:
	text "Això és SURF."

	para "És un moviment"
	line "que deixa als"

	para "#MON nedar per"
	line "l'aigua."
	done

SurfGuyElegantKimonoGirlsText:
	text "M'agradaria que"
	line "els meus #MON"

	para "fossin tan ele-"
	line "gants com les"
	cont "NOIES QUIMONO…"
	done

RhydonText:
	text "RHYDON: Gugooh"
	line "gugogooh!"
	done

DanceTheaterCooltrainerMText:
	text "Aquell home sempre"
	line "va amb el RHYDON."

	para "Diu que vol un"
	line "#MON que pugui"
	cont "fer SURF i ballar."

	para "Està intentant"
	line "fer un #MON de"
	cont "natació sincro-"
	cont "nitzada?"
	done

DanceTheaterGrannyText:
	text "Les NOIES QUIMONO"
	line "són tan boniques…"

	para "Però han de passar"
	line "per un entrena-"
	cont "ment rigorós."

	para "I han d'aprendre"
	line "a seguir les"

	para "tradicions abans"
	line "de sortir en"
	cont "públic."

	para "Però si estimes"
	line "alguna cosa, tot"
	cont "és possible."
	done

DanceTheaterFancyPanelText:
	text "És un plafó ele-"
	line "gant decorat amb"
	cont "flors."
	done

DanceTheater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, DanceTheaterFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheaterFancyPanel

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheaterCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterGrannyScript, -1
