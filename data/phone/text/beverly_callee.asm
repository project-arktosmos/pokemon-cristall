BeverlyAnswerPhoneText:
	text "Hola, soc la"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Bon dia,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneDayText:
	text "Hola, soc la"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Bon dia,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneNiteText:
	text "Hola, soc la"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Bona nit,"
	line "<PLAYER>."
	done

BeverlyGreetText:
	text "Hola, <PLAYER>."
	line "Bon dia."

	para "Soc la @"
	text_ram wStringBuffer3
	text "."
	line "Estaves dormint?"
	done

BeverlyGreetDayText:
	text "Ei, <PLAYER>."
	line "Soc la @"
	text_ram wStringBuffer3
	text "."

	para "Com estàs?"
	done

BeverlyGreetNiteText:
	text "Ei, <PLAYER>."
	line "Soc la @"
	text_ram wStringBuffer3
	text "."

	para "Estaves despert?"
	done

BeverlyGenericText:
	text "Tens els #MON"
	line "contents?"

	para "El meu @"
	text_ram wStringBuffer4
	text " està"
	line "sa. Menja molt"
	cont "cada dia."
	done
