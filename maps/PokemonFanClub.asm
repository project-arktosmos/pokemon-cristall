object_const_def
const POKEMONFANCLUB_CHAIRMAN
const POKEMONFANCLUB_RECEPTIONIST
const POKEMONFANCLUB_CLEFAIRY_GUY
const POKEMONFANCLUB_TEACHER
const POKEMONFANCLUB_FAIRY
const POKEMONFANCLUB_ODDISH

PokemonFanClub_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonFanClubChairmanScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue .HeardSpeech
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue .HeardSpeechButBagFull
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse .NotListening
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeechButBagFull:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext PokemonFanClubChairmanItsARareCandyText
	waitbutton
	closetext
	end

.HeardSpeech:
	writetext PokemonFanClubChairmanMoreTalesToTellText
	waitbutton
	closetext
	end

.NotListening:
	writetext PokemonFanClubChairmanHowDisappointingText
	waitbutton
.BagFull:
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

PokemonFanClubClefairyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue .GotLostItem
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .FoundClefairyDoll
	writetext PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	waitbutton
	closetext
	end

.FoundClefairyDoll:
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue .MetCopycat
	waitbutton
	closetext
	end

.MetCopycat:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	giveitem LOST_ITEM
	iffalse .NoRoom
	disappear POKEMONFANCLUB_FAIRY
	writetext PokemonFanClubPlayerReceivedDollText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	closetext
	end

.GotLostItem:
	writetext PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PokemonFanClubClefairyGuyPackIsJammedFullText
	waitbutton
	closetext
	end

PokemonFanClubTeacherScript:
	jumptextfaceplayer PokemonFanClubTeacherText

PokemonFanClubClefairyDollScript:
	jumptext PokemonFanClubClefairyDollText

PokemonFanClubBayleefScript:
	opentext
	writetext PokemonFanClubBayleefText
	cry BAYLEEF
	waitbutton
	closetext
	end

PokemonFanClubListenSign:
	jumptext PokemonFanClubListenSignText

PokemonFanClubBraggingSign:
	jumptext PokemonFanClubBraggingSignText

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Sóc el PRESIDENT"
	line "del CLUB de FANS"
	cont "de #MON."

	para "He criat més de"
	line "150 #MON."

	para "Sóc molt exigent"
	line "quan es tracta de"
	cont "#MON."

	para "Has vingut només"
	line "per sentir parlar"
	cont "dels meus #MON?"
	done

PokemonFanClubChairmanRapidashText:
	text "Bé!"
	line "Doncs escolta!"

	para "Bé… el meu"
	line "RAPIDASH favorit…"

	para "És… bonic… dolç…"
	line "llest… increïble…"
	cont "a més… genial…"
	cont "no trobes?…"
	cont "Massa… salvatge…"
	cont "preciós… amable…"
	cont "l'estimo!"

	para "L'abraço… quan…"
	line "dorm… càlid i"
	cont "tendre… Ah, i…"
	cont "espectacular…"
	cont "fascinant…"
	cont "diví…"
	cont "Vaja! Mira quina"
	cont "hora és! T'he"
	cont "entretingut massa!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "Gràcies per"
	line "escoltar-me. Vull"
	cont "donar-te això!"
	done

PokemonFanClubChairmanItsARareCandyText:
	text "És un CARAMEL RAR"
	line "que fa més forts"
	cont "els #MON."

	para "Prefereixo fer"
	line "els meus #MON"

	para "més forts en"
	line "combat, així que"
	cont "te'l pots quedar."
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "Hola, <PLAY_G>!"

	para "Has vingut a"
	line "veure'm pels meus"
	cont "#MON?"

	para "No? Ah… Tenia més"
	line "coses a explicar…"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Quina decepció…"

	para "Torna si vols"
	line "escoltar."
	done

PokemonFanClubReceptionistText:
	text "El nostre"
	line "PRESIDENT és molt"
	cont "parlador quan es"
	cont "tracta de #MON…"
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "M'encanta com"
	line "CLEFAIRY mou el"

	para "dit quan intenta"
	line "fer servir"

	para "METRONOME."
	line "És tan adorable!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "M'encanta"
	line "CLEFAIRY, però no"

	para "n'he pogut atrapar"
	line "cap. Així que em"

	para "conformo amb una"
	line "NINA # trobada."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Ah, ja ho entenc."
	line "La noia que va"

	para "perdre la NINA"
	line "#"
	cont "està trista…"

	para "D'acord. Podries"
	line "portar aquesta"

	para "NINA # a la"
	line "pobra noia?"

	para "Algun dia faré"
	line "amistat amb un"

	para "CLEFAIRY de bo."
	line "No pateixis!"
	done

PokemonFanClubPlayerReceivedDollText:
	text "<PLAYER> ha rebut"
	line "la NINA #."
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "Ja ho veuràs."
	line "Aconseguiré un"

	para "CLEFAIRY de"
	line "veritat"
	cont "com a amic."
	done

PokemonFanClubClefairyGuyPackIsJammedFullText:
	text "La teva MOTXILLA"
	line "és ben plena."
	done

PokemonFanClubTeacherText:
	text "Mira el meu"
	line "estimat BAYLEEF!"

	para "La fulla del seu"
	line "cap és tan mona!"
	done

PokemonFanClubClefairyDollText:
	text "És un CLEFAIRY!"
	line "Eh?"

	para "Ah, és clar. És"
	line "una NINA #"
	cont "CLEFAIRY."
	done

PokemonFanClubBayleefText:
	text "BAYLEEF: Li liif!"
	done

PokemonFanClubListenSignText:
	text "Escoltem amb"
	line "educació els"
	cont "altres entrenadors"
	done

PokemonFanClubBraggingSignText:
	text "Si algú presumeix,"
	line "presumeix tu més!"
	done

PokemonFanClub_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 3
	warp_event  3,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, PokemonFanClubListenSign
	bg_event  9,  0, BGEVENT_READ, PokemonFanClubBraggingSign

	def_object_events
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubTeacherScript, -1
	object_event  2,  4, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  7,  3, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubBayleefScript, -1
