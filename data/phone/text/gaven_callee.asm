GavenAnswerPhoneText:
	text "Hola, sóc en"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ei, <PLAY_G>!"
	line "Bon dia!"
	done

GavenAnswerPhoneDayText:
	text "Hola, sóc en"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ei, <PLAY_G>!"
	done

GavenAnswerPhoneNiteText:
	text "Hola, sóc en"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ei, <PLAY_G>!"
	line "Bona nit!"
	done

GavenGreetText:
	text "<PLAY_G>, bon dia!"

	para "Sóc en @"
	text_ram wStringBuffer3
	text "."
	line "Com estàs?"
	done

GavenGreetDayText:
	text "Ei, <PLAY_G>!"

	para "Sóc en @"
	text_ram wStringBuffer3
	text "."
	line "Com estàs?"
	done

GavenGreetNiteText:
	text "<PLAY_G>, bona nit!"

	para "Sóc en @"
	text_ram wStringBuffer3
	text "."
	line "Com estàs?"
	done

GavenGenericText:
	text "Com van els teus"
	line "#MON?"

	para "El meu @"
	text_ram wStringBuffer4
	text ""
	line "va tan bé com"
	cont "sempre."

	para "Continuem"
	line "entrenant"
	cont "i serem CAMPIONS"
	cont "de #MON!"
	done
