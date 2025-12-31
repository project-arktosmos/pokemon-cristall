ErinAnswerPhoneText:
	text "Sí, parla l'"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh. Hola, <PLAY_G>!"
	line "Bon dia!"
	done

ErinAnswerPhoneDayText:
	text "Sí, parla l'"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, hola, <PLAY_G>!"
	line "Visca!"
	done

ErinAnswerPhoneNiteText:
	text "Sí, parla l'"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, hola, <PLAY_G>!"
	done

ErinGreetText:
	text "<PLAY_G>!"

	para "Soc l'"
	text_ram wStringBuffer3
	text "!"
	line "Bon dia!"
	done

ErinGreetDayText:
	text "<PLAY_G>!"

	para "Soc l'"
	text_ram wStringBuffer3
	text "!"
	line "Treballes dur?"
	done

ErinGreetNiteText:
	text "<PLAY_G>!"

	para "Soc l'"
	text_ram wStringBuffer3
	text "!"
	line "Eres despert?"
	done

ErinGenericText:
	text "Estàs entrenant"
	line "els teus #MON?"

	para "Ei, el @"
	text_ram wStringBuffer4
	text ""
	line "de l'"
	text_ram wStringBuffer3
	text " té"
	cont "bona pinta!"
	done
