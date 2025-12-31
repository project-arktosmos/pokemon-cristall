WadeAnswerPhoneText:
	text "Hola? Soc en"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>!"
	line "Bon dia!"
	done

WadeAnswerPhoneDayText:
	text "Hola? Soc en"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, hola, <PLAY_G>!"
	done

WadeAnswerPhoneNiteText:
	text "Hola? Soc en"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, hola, <PLAY_G>!"
	line "Bona nit!"
	done

WadeGreetText:
	text "<PLAY_G>, bon dia!"

	para "Soc en @"
	text_ram wStringBuffer3
	text "."
	line "Quin bon temps,"
	cont "oi?"
	done

WadeGreetDayText:
	text "<PLAY_G>, ei!"

	para "Soc en @"
	text_ram wStringBuffer3
	text "."
	line "Quin bon temps,"
	cont "oi?"
	done

WadeGreetNiteText:
	text "Bona nit,"
	line "<PLAY_G>!"

	para "Soc en @"
	text_ram wStringBuffer3
	text "."
	line "Eres despert?"
	done

WadeGenericText:
	text "Com van els teus"
	line "#MON?"

	para "Els meus #MON"
	line "tenen massa"
	cont "energia"

	para "per cremar. A"
	line "vegades fa nosa."

	para "De tots, en"
	line "@"
	text_ram wStringBuffer4
	text " és el"
	cont "més difícil."

	para "Treballar amb ell"
	line "és esgotador."
	done
