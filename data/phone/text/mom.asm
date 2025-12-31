MomPhoneGreetingText:
	text "Hola?"

	para "Oh, hola, <PLAYER>!"
	line "Treballes dur?"
	done

MomPhoneLandmarkText:
	text "Oh, ets a"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "No és on hi ha"
	line "@"
	text_ram wStringBuffer4
	text_start
	para "? Hi has anat"
	line "a fer un cop"
	cont "d'ull?"
	done

MomPhoneGenericAreaText:
	text "De veritat ets a"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Mai hi he anat."
	line "Això és genial,"
	cont "<PLAYER>."
	done

MomPhoneNewBarkText:
	text "Què? Ets a"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Vine a veure la"
	line "MARE de tant en"
	cont "tant!"
	done

MomPhoneCherrygroveText:
	text "Ets de visita a"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Per què no véns"
	line "a casa una estona?"
	done

MomOtherAreaText:
	text "Uau, ets a"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Bona sort amb la"
	line "cerca de #MON!"
	done

MomDeterminedText:
	text "Això sembla molt"
	line "difícil."

	para "Però, <PLAYER>, sé"
	line "que tens molta"

	para "determinació."
	line "Aniràs bé, oi?"
	done

MomCheckBalanceText:
	text "Per cert, tens"
	line "estalviats ¥@"
	text_ram wStringBuffer3
	text "."

	para "Vols continuar"
	line "estalviant?"
	done

MomImportantToSaveText:
	text "És important"
	line "estalviar diners."
	done

MomYoureNotSavingText:
	text "Oh, <PLAYER>,"
	line "no estàs"

	para "estalviant diners."
	line "Vols estalviar?"
	done

MomYouveSavedText:
	text "Per cert, tens"
	line "estalviats ¥@"
	text_ram wStringBuffer3
	text "."

	para "Vols tornar a"
	line "estalviar?"
	done

MomOKIllSaveText:
	text "D'acord."
	line "T'estalviaré"
	cont "els diners."
	done

MomPhoneWontSaveMoneyText:
	text "D'acord. No"
	line "t'estalviaré"
	cont "els diners."
	done

MomPhoneHangUpText:
	text "<PLAYER>, continua"
	line "així! T'animo,"
	cont "fill meu!"
	done

MomPhoneNoPokemonText:
	text "Hola?"

	para "Oh, hola, <PLAYER>!"
	line "El PROF. OM no"
	cont "t'estava esperant?"
	done

MomPhoneNoPokedexText:
	text "Hola?"

	para "Oh, hola, <PLAYER>!"
	line "Tens una gran"

	para "missió del PROF."
	line "OM? Porta't bé!"
	done

MomPhoneNoGymQuestText:
	text "Hola?"

	para "Hola, <PLAYER>! Si"
	line "has acabat"

	para "l'encàrrec, torna"
	line "a casa, fill."
	done

MomPhoneLectureText:
	text "Hola?"

	para "…… <PLAYER>?"
	line "El PROF. OM m'ha"

	para "dit que has anat"
	line "a fer un viatge."

	para "M'ho podries"
	line "haver dit…"

	para "I els diners?"
	line "T'els estalvio?"
	done
