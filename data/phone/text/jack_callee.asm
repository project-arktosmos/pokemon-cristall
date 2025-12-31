JackAnswerPhoneText:
	text "Hola! Sóc en"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Bon dia,"
	line "<PLAY_G>!"
	done

JackAnswerPhoneDayText:
	text "Hola! Sóc en"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Com va tot,"
	line "<PLAY_G>?"
	done

JackAnswerPhoneNiteText:
	text "Hola! Sóc en"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Bona nit,"
	line "<PLAY_G>!"
	done

JackGreetText:
	text "<PLAY_G>, bon dia!"

	para "Sóc en @"
	text_ram wStringBuffer3
	text "."
	line "Com estàs?"
	done

JackGreetDayText:
	text "<PLAY_G>, ei!"

	para "Sóc en @"
	text_ram wStringBuffer3
	text "."
	line "Quin dia tan"
	cont "bonic!"
	done

JackGreetNiteText:
	text "<PLAY_G>, bona nit!"

	para "Sóc en @"
	text_ram wStringBuffer3
	text "."
	line "Tens un moment?"
	done

JackGenericText:
	text "Com van els teus"
	line "#MON?"

	para "El meu @"
	text_ram wStringBuffer4
	text " és"
	line "tan curiós que"

	para "em dóna problemes."
	line "Potser s'assembla"
	cont "a mi…"
	done
