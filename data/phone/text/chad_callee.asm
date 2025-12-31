ChadAnswerPhoneText:
	text "Hola, sóc"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Hola, <PLAY_G>!"
	line "Bon dia!"
	done

ChadAnswerPhoneDayText:
	text "Hola, sóc"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Hola, <PLAY_G>,"
	line "bona tarda!"
	done

ChadAnswerPhoneNiteText:
	text "Hola, sóc"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Hola, <PLAY_G>,"
	line "bona nit!"
	done

ChadGreetText:
	text "Hola, <PLAY_G>,"
	line "bon dia!"

	para "Sóc @"
	text_ram wStringBuffer3
	text "."
	line "Com estàs?"
	done

ChadGreetDayText:
	text "Hola, <PLAY_G>,"
	line "bona tarda!"

	para "Sóc @"
	text_ram wStringBuffer3
	text "."
	line "Com estàs?"
	done

ChadGreetNiteText:
	text "Hola, <PLAY_G>,"
	line "bona nit!"

	para "Sóc @"
	text_ram wStringBuffer3
	text "."
	line "Com estàs?"
	done

ChadGenericText:
	text "Com estan els teus"
	line "#MON?"

	para "Coneixes el PROF."
	line "OAK, així que"

	para "segur que estan"
	line "bé!"

	para "Els meus #MON"
	line "també estan bé."

	para "Però clar, vull"
	line "ser professor de"

	para "#MON, així que"
	line "no és cap"
	cont "sorpresa."
	done
