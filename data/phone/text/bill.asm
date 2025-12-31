BillPhoneMornGreetingText:
	text "Bon dia!"

	para "Aquí el SERVEI"
	line "D'ADMINISTRACIÓ"

	para "del SISTEMA"
	line "D'EMMAGATZEMATGE."
	done

BillPhoneDayGreetingText:
	text "Bona tarda!"

	para "Aquí el SERVEI"
	line "D'ADMINISTRACIÓ"

	para "del SISTEMA"
	line "D'EMMAGATZEMATGE."
	done

BillPhoneNiteGreetingText:
	text "Bona nit!"

	para "Aquí el SERVEI"
	line "D'ADMINISTRACIÓ"

	para "del SISTEMA"
	line "D'EMMAGATZEMATGE."
	done

BillPhoneGenericText:
	text "Qui truca?"

	para "<PLAY_G>, oi?"
	line "Espera un moment…"

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText:
	text "Gràcies per"
	line "esperar!"

	para "<PLAY_G>, la teva"
	line "CAPSA té espai"
	cont "per a @"
	text_ram wStringBuffer3
	text " #MON"
	cont "més."

	para "Surt i omple-la!"
	done

BillPhoneNearlyFullText:
	text "Gràcies per"
	line "esperar!"

	para "<PLAY_G>, la teva"
	line "CAPSA només té"
	cont "espai per a @"
	text_ram wStringBuffer3
	text_start
	cont "#MON més."

	para "Potser hauries de"
	line "canviar de CAPSA."
	done

BillPhoneFullText:
	text "Gràcies per"
	line "esperar!"

	para "<PLAY_G>, la teva"
	line "CAPSA és plena!"

	para "Hauràs de canviar"
	line "de CAPSA si vols"

	para "atrapar més"
	line "#MON."
	done

BillPhoneNewlyFullText:
	text "Hola, <PLAY_G>?"
	line "Soc en BILL!"

	para "Gràcies per fer"
	line "el meu SISTEMA"
	cont "D'EMMAGATZEMATGE."

	para "L'últim #MON"
	line "que has enviat ha"
	cont "omplert la CAPSA."

	para "Hauràs de canviar"
	line "de CAPSA si vols"

	para "atrapar més"
	line "#MON."

	para "Adéu!"
	done
