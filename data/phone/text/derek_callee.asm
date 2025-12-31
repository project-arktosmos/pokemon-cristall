DerekAnswerPhoneText:
	text "Hola, <PLAY_G>?"

	para "Bon dia pika."
	line "Què hi ha pika?"
	done

DerekAnswerPhoneDayText:
	text "Hola, <PLAY_G>?"

	para "Bon dia pika,"
	line "què hi ha pika?"
	done

DerekAnswerPhoneNiteText:
	text "Hola, <PLAY_G>?"

	para "Bona nit pika,"
	line "què hi ha pika?"
	done

DerekGreetText:
	text "<PLAY_G> pika, bon"
	line "dia!"

	para "Soc @"
	text_ram wStringBuffer3
	text ", com"
	line "pika estàs?"
	done

DerekGreetDayText:
	text "<PLAY_G> pika, bon"
	line "pika dia!"

	para "Soc @"
	text_ram wStringBuffer3
	text ", com"
	line "pika estàs?"
	done

DerekGreetNiteText:
	text "<PLAY_G> pika, bona"
	line "nit!"

	para "Soc @"
	text_ram wStringBuffer3
	text ". Eres"
	line "pika despert?"
	done

DerekGenericText:
	text "Has de sentir"
	line "això! El meu"

	para "@"
	text_ram wStringBuffer4
	text " m'ha"
	line "mirat i ha somrís!"

	para "Deu ser perquè"
	line "els nostres cors"
	cont "bateguen com un!"
	done
