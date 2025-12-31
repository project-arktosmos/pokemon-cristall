_NoPhotoText::
	text "Oh, cap foto?"
	line "Torna aviat, va?"
	done

_EggPhotoText::
	text "Un OU? El meu"
	line "talent val més…"
	done

_NameRaterHelloText::
	text "Hola, hola! Sóc"
	line "el JUTGE DE NOMS."

	para "Avaluo els noms"
	line "dels #MON."

	para "Vols que avaluï"
	line "els teus noms?"
	done

_NameRaterWhichMonText::
	text "Quin sobrenom de"
	line "#MON vols que"
	cont "avaluï?"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "És un nom força"
	cont "acceptable."

	para "Però, què et"
	line "sembla un sobrenom"
	cont "una mica millor?"

	para "Vols que li posi"
	line "un nom millor?"
	done

_NameRaterWhatNameText::
	text "D'acord. Quin nom"
	line "li posem, doncs?"
	prompt

_NameRaterFinishedText::
	text "Aquest nom és"
	line "millor que abans!"

	para "Ben fet!"
	done

_NameRaterComeAgainText::
	text "D'acord. Torna"
	line "quan vulguis."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "Quin gran nom!"
	cont "És perfecte."

	para "Tracta @"
	text_ram wStringBuffer1
	text_start
	line "amb molt d'amor."
	done

_NameRaterEggText::
	text "Ei… Això només"
	line "és un OU."
	done

_NameRaterSameNameText::
	text "Pot semblar igual"
	line "que abans,"

	para "però aquest nom"
	line "és molt millor!"

	para "Ben fet!"
	done

_NameRaterNamedText::
	text "D'acord. Ara"
	line "aquest #MON"
	cont "es diu @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " ha guanyat@"
	text_end

_BoostedExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "un extra de"
	cont "@"
	text_decimal wStringBuffer2, 2, 4
	text " punts EXP.!"
	prompt

_ExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " punts EXP.!"
	prompt

_GoMonText::
	text "Endavant! @"
	text_end

_DoItMonText::
	text "Fes-ho! @"
	text_end

_GoForItMonText::
	text "A per ells,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "El rival és feble!"
	line "Acaba'l, @"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNickname
	text "!"
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " ja n'hi"
	line "ha prou! Torna!@"
	text_end

_OKComeBackText::
	text " D'acord!"
	line "Torna!@"
	text_end

_GoodComeBackText::
	text " molt bé!"
	line "Torna!@"
	text_end

_ComeBackText::
	text " torna"
	line "enrere!"
	done

_BootedTMText::
	text "Has carregat una"
	line "MT."
	prompt

_BootedHMText::
	text "Has carregat una"
	line "MO."
	prompt

_ContainedMoveText::
	text "Conté"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Ensenyar @"
	text_ram wStringBuffer2
	text_start
	line "a un #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " no"
	line "és compatible"
	cont "amb @"
	text_ram wStringBuffer1
	text "."

	para "No pot aprendre"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "No tens espai per"
	line "a més"
	cont "@"
	text_ram wStringBuffer1
	text "S."
	prompt

_ReceivedTMHMText::
	text "Has rebut"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "S'ha cancel·lat"
	line "la connexió."
	prompt

_MysteryGiftCommErrorText::
	text "Error de"
	line "comunicació."
	prompt

_RetrieveMysteryGiftText::
	text "Recull el REGAL"
	line "al CENTRE #MON."
	prompt

_YourFriendIsNotReadyText::
	text "El teu amic no"
	line "està a punt."
	prompt

_MysteryGiftFiveADayText::
	text "Només cinc REGALS"
	line "al dia."
	prompt

_MysteryGiftOneADayText::
	text "Un REGAL al dia"
	line "per persona."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " ha"
	line "enviat @"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " ha"
	line "enviat @"
	text_ram wStringBuffer1
	text_start
	cont "a casa de @"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

_NameCardReceivedCardText::
	text "Has rebut la"
	line "TARGETA de @"
	text_ram wMysteryGiftCardHolderName
	text "."
	prompt

_NameCardListedCardText::
	text "La TARGETA de @"
	text_ram wMysteryGiftCardHolderName
	text_start
	line "és al núm.@"
	text_decimal wTextDecimalByte, 1, 2
	text "."
	prompt

_NameCardNotRegisteredCardText::
	text "La TARGETA no"
	line "s'ha registrat."
	prompt

_NameCardLinkCancelledText::
	text "S'ha cancel·lat"
	line "la connexió."
	prompt

_NameCardLinkCommErrorText::
	text "Error de"
	line "comunicació."
	prompt

_BadgeRequiredText::
	text "Cal una nova"
	line "MEDALLA."
	prompt

_CantUseItemText::
	text "Aquí no pots fer"
	line "servir això."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text " ha"
	line "fet servir TALL!"
	prompt

_CutNothingText::
	text "Aquí no hi ha res"
	line "per TALLAR."
	prompt

_BlindingFlashText::
	text "Un FLAIX encegador"
	line "il·lumina la zona!@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_UsedSurfText::
	text_ram wStringBuffer2
	text " ha"
	line "fet servir SURF!"
	done

_CantSurfText::
	text "Aquí no pots fer"
	line "SURF."
	prompt

_AlreadySurfingText::
	text "Ja estàs fent"
	line "SURF."
	prompt

_AskSurfText::
	text "L'aigua és calma."
	line "Vols fer SURF?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " ha fet"
	line "servir CASCADA!"
	done

_HugeWaterfallText::
	text "Uau, és una"
	line "cascada enorme."
	done

_AskWaterfallText::
	text "Vols fer servir"
	line "CASCADA?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " ha"
	line "fet servir"
	cont "EXCAVAR!"
	done

_UseEscapeRopeText::
	text "<PLAYER> ha fet"
	line "servir CORDA FUGA."
	done

_CantUseDigText::
	text "Aquí no pots fer"
	line "servir això."
	done

_TeleportReturnText::
	text "Torna a l'últim"
	line "CENTRE #MON."
	done

_CantUseTeleportText::
	text "Aquí no pots fer"
	line "servir això."

	para ""
	done

_AlreadyUsingStrengthText::
	text "Un #MON ja usa"
	line "FORÇA."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " ha"
	line "fet servir FORÇA!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " pot"
	line "moure roques."
	prompt

_AskStrengthText::
	text "Un #MON podria"
	line "moure això."

	para "Vols fer servir"
	line "FORÇA?"
	done

_BouldersMoveText::
	text "Ara pots moure"
	line "les roques!"
	done

_BouldersMayMoveText::
	text "Un #MON podria"
	line "moure això."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " ha"
	line "fet servir REMOLÍ!"
	prompt

_MayPassWhirlpoolText::
	text "És un remolí"
	line "ferotge!"

	para "Un #MON podria"
	line "passar-lo."
	done

_AskWhirlpoolText::
	text "Hi ha un remolí"
	line "al pas."

	para "Vols fer servir"
	line "REMOLÍ?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " ha"
	line "fet un COP DE CAP!"
	prompt

_HeadbuttNothingText::
	text "No. Res de res…"
	done

_AskHeadbuttText::
	text "Podria haver un"
	line "#MON en"
	cont "l'arbre."

	para "Fer-li un"
	line "COP DE CAP?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " ha fet"
	line "servir DESTROSSA!"
	prompt

_MaySmashText::
	text "Potser un #MON"
	line "pot trencar això."
	done

_AskRockSmashText::
	text "Aquesta roca"
	line "sembla trencable."

	para "Vols fer servir"
	line "DESTROSSA?"
	done

_RodBiteText::
	text "Oh!"
	line "Pica!"
	prompt

_RodNothingText::
	text "Ni una mossegada!"
	prompt

_UnusedNothingHereText::
	text "Sembla que aquí"
	line "no hi ha res."
	prompt

_CantGetOffBikeText::
	text "Aquí no pots"
	line "baixar!"
	done

_GotOnBikeText::
	text "<PLAYER> ha pujat"
	line "a la @"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> ha baixat"
	line "de la @"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "Es pot TALLAR"
	line "aquest arbre!"

	para "Vols fer TALLAR?"
	done

_CanCutText::
	text "Es pot TALLAR"
	line "aquest arbre!"
	done

_FoundItemText::
	text "<PLAYER> ha trobat"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "Però <PLAYER> no"
	line "pot portar més"
	cont "objectes."
	done

_WhitedOutText::
	text "<PLAYER> no té"
	line "#MON aptes!"

	para "<PLAYER> ha"
	line "perdut el combat!"
	done

_ItemfinderItemNearbyText::
	text "Sí! El BUSCADOR"
	line "indica que hi ha"
	cont "un objecte a prop."
	prompt

_ItemfinderNopeText::
	text "No! El BUSCADOR"
	line "no respon."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "s'ha desmaiat!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> no té"
	line "#MON aptes!"

	para "<PLAYER> ha"
	line "perdut el combat!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text " ha fet"
	line "servir AROMA DOLÇ!"
	done

_SweetScentNothingText::
	text "Sembla que aquí"
	line "no hi ha res…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> ha ruixat"
	line "amb aigua."

	para "Però no ha passat"
	line "res…"
	done

_UseSacredAshText::
	text "Els #MON de"
	line "<PLAYER> s'han"
	cont "curat!"
	done

_AnEggCantHoldAnItemText::
	text "Un OU no pot"
	line "portar objectes."
	prompt

_PackNoItemText::
	text "Cap objecte."
	done

_AskThrowAwayText::
	text "Quants en vols"
	line "llençar?"
	done

_AskQuantityThrowAwayText::
	text "Llençar @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ThrewAwayText::
	text "Has llençat"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: <PLAYER>!"
	line "Ara no és moment"
	cont "de fer servir"
	cont "això!"
	prompt

_YouDontHaveAMonText::
	text "No tens cap"
	line "#MON!"
	prompt

_RegisteredItemText::
	text "S'ha registrat"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_CantRegisterText::
	text "No pots registrar"
	line "aquest objecte."
	prompt

_AskItemMoveText::
	text "On vols moure"
	line "això?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "No pots usar-lo"
	line "en combat."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Ets un noi?"
	line "O ets una noia?"
	done

Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>ha pujat molt!"
	prompt

_BattleStatWentUpText::
	text " ha pujat!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>ha baixat molt!"
	prompt

_BattleStatFellText::
	text " ha baixat!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "ha fet un tornado!"
	prompt

_BattleTookSunlightText::
	text_start
	line "absorbeix la llum!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "ha abaixat el cap!"
	prompt

_BattleGlowingText::
	text_start
	line "està brillant!"
	prompt

_BattleFlewText::
	text_start
	line "ha volat amunt!"
	prompt

_BattleDugText::
	text_start
	line "ha excavat un"
	cont "forat!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "ha usat @"
	text_end

_UsedMove2Text::
	text_start
	line "ha usat @"
	text_end

_UsedInsteadText::
	text "en canvi,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BreedHuh::
	text "Eh?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " ha"
	line "sortit de l'OU!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Posar sobrenom a"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "És @"
	text_ram wBreedMon2Nickname
	text_start
	line "que es va deixar"
	cont "amb la GUARDERIA."
	done

_LeftWithDayCareManText::
	text "És @"
	text_ram wBreedMon1Nickname
	text_start
	line "que es va deixar"
	cont "amb la GUARDERIA."
	done

_BreedBrimmingWithEnergyText::
	text "Està ple"
	line "d'energia."
	prompt

_BreedNoInterestText::
	text "No té interès en"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "Sembla estimar"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "S'entén bé amb"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "Mostra interès en"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Aquí no hi ha"
	line "CORREU."
	prompt

_MailClearedPutAwayText::
	text "S'ha desat el"
	line "CORREU netejat."
	prompt

_MailPackFullText::
	text "La MOTXILLA és"
	line "plena."
	prompt

_MailMessageLostText::
	text "El missatge del"
	line "CORREU es perdrà."
	cont "D'acord?"
	done

_MailAlreadyHoldingItemText::
	text "Ja porta un"
	line "objecte."
	prompt

_MailEggText::
	text "Un OU no pot"
	line "portar CORREU."
	prompt

_MailMovedFromBoxText::
	text "S'ha mogut el"
	line "CORREU de BÚSTIA."
	prompt

_YesPromptText:: ; unreferenced
	text "Sí"
	prompt

_NoPromptText:: ; unreferenced
	text "No"
	prompt

_AnimationTypeText:: ; unreferenced
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Tipus animació @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_MonNumberText:: ; unreferenced
	text "Número #MON?"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " s'ha"
	line "enviat al PC BILL."
	prompt

_PCGottaHavePokemonText::
	text "Cal tenir #MON"
	line "per a trucar!"
	prompt

_PCWhatText::
	text "Què?"
	done

_PCMonHoldingMailText::
	text "Hi ha un #MON"
	line "amb CORREU."

	para "Sisplau, treu"
	line "el CORREU."
	prompt

_PCNoSingleMonText::
	text "No tens ni un sol"
	line "#MON!"
	prompt

_PCCantDepositLastMonText::
	text "No pots dipositar"
	line "l'últim #MON!"
	prompt

_PCCantTakeText::
	text "No pots agafar"
	line "més #MON."
	prompt

_ContestCaughtMonText::
	text "Has capturat @"
	text_ram wStringBuffer1
	text "!"
	prompt

_ContestAskSwitchText::
	text "Canviar #MON?"
	done

_ContestAlreadyCaughtText::
	text "Ja has capturat"
	line "un @"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "El guanyador del"
	line "Concurs Captura és@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "que ha capturat"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "La puntuació"
	line "guanyadora és @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text "!"
	prompt

_ContestJudging_SecondPlaceText::
	text "En segon lloc"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "que ha capturat"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "La puntuació és"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " punts!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "En tercer lloc"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "que ha capturat"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "La puntuació és"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " punts!"
	prompt

_MagikarpGuruMeasureText::
	text "Deixa'm mesurar"
	line "aquest MAGIKARP."

	para "…Hm, fa"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_KarpGuruRecordText::
	text "RÈCORD ACTUAL"

	para "@"
	text_ram wStringBuffer1
	text " capturat"
	line "per @"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Felicitats!"

	para "Coincideix amb"
	line "el número ID"

	para "de @"
	text_ram wStringBuffer1
	text " al"
	line "teu equip."
	prompt

_LuckyNumberMatchPCText::
	text "Felicitats!"

	para "Coincideix amb"
	line "el número ID"

	para "de @"
	text_ram wStringBuffer1
	text " a"
	line "la teva CAIXA PC."
	prompt

_CaughtAskNicknameText::
	text "Posar sobrenom al"
	line "@"
	text_ram wStringBuffer1
	text " que"
	cont "has rebut?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! Has de"
	line "tenir un #MON"
	cont "per usar això!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> ha engegat"
	line "el PC."
	prompt

_PlayersPCAskWhatDoText::
	text "Què vols fer?"
	done

_PlayersPCHowManyWithdrawText::
	text "Quants en vols"
	line "retirar?"
	done

_PlayersPCWithdrewItemsText::
	text "Has retirat @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "No hi ha espai"
	line "per més objectes."
	prompt

_PlayersPCNoItemsText::
	text "Aquí no hi ha res!"
	prompt

_PlayersPCHowManyDepositText::
	text "Quants en vols"
	line "dipositar?"
	done

_PlayersPCDepositItemsText::
	text "Has dipositat @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomDepositText::
	text "No hi ha espai per"
	line "desar objectes."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> ha engegat"
	line "el PC."
	prompt

_PokecenterPCWhoseText::
	text "El PC de qui?"
	done

_PokecenterBillsPCText::
	text "Has accedit al"
	line "PC de BILL."

	para "Sistema de"
	line "magatzem obert."
	prompt

_PokecenterPlayersPCText::
	text "Has accedit al"
	line "teu PC."

	para "Sistema de"
	line "magatzem obert."
	prompt

_PokecenterOaksPCText::
	text "Has accedit al"
	line "PC del PROF.OAK."

	para "Sistema #DEX"
	line "obert."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Connexió tancada…"
	done

_OakPCText1::
	text "Vols una avaluació"
	line "de la #DEX?"
	done

_OakPCText2::
	text "Nivell actual de"
	line "la #DEX:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #MON vistos"
	line "@"
	text_ram wStringBuffer4
	text " #MON tinguts"

	para "Avaluació del"
	line "PROF.OAK:"
	done

_OakRating01::
	text "Busca #MON a"
	line "les zones d'herba!"
	done

_OakRating02::
	text "Bé. Veig que saps"
	line "com fer servir"
	cont "# BALLS."
	done

_OakRating03::
	text "T'hi estàs fent"
	line "bo."

	para "Però encara et"
	line "queda molt."
	done

_OakRating04::
	text "Has d'omplir"
	line "la #DEX."

	para "Captura diferents"
	line "tipus de #MON!"
	done

_OakRating05::
	text "Ho estàs intentant"
	line "veig."

	para "La teva #DEX"
	line "va prenent forma."
	done

_OakRating06::
	text "Per evolucionar,"
	line "uns #MON"
	cont "creixen,"

	para "altres fan servir"
	line "PEDRES."
	done

_OakRating07::
	text "Tens una canya de"
	line "pescar? Pots"

	para "capturar #MON"
	line "pescant."
	done

_OakRating08::
	text "Excel·lent!"
	line "T'agrada"
	cont "col·leccionar!"
	done

_OakRating09::
	text "Alguns #MON"
	line "només apareixen"

	para "a certes hores"
	line "del dia."
	done

_OakRating10::
	text "La teva #DEX"
	line "s'omple. Continua"
	cont "així!"
	done

_OakRating11::
	text "Impressionant."
	line "No només captures"

	para "#MON, també"
	line "els evoluciones."
	done

_OakRating12::
	text "Has conegut KURT?"
	line "Les seves BALLS"
	cont "t'ajudaran."
	done

_OakRating13::
	text "Uau. Has trobat"
	line "més #MON que"

	para "l'últim projecte"
	line "de recerca."
	done

_OakRating14::
	text "Intercanvies els"
	line "teus #MON?"

	para "És difícil fer-ho"
	line "sol!"
	done

_OakRating15::
	text "Uau! Has arribat"
	line "a 200! La #DEX"
	cont "està genial!"
	done

_OakRating16::
	text "Has trobat tants"
	line "#MON!"

	para "M'has ajudat molt"
	line "amb els estudis!"
	done

_OakRating17::
	text "Magnífic! Podries"
	line "ser professor"

	para "de #MON"
	line "ara mateix!"
	done

_OakRating18::
	text "La teva #DEX"
	line "és increïble!"

	para "Estàs a punt de"
	line "ser professional!"
	done

_OakRating19::
	text "Uau! Una #DEX"
	line "perfecta!"

	para "Ho havia somiat!"
	line "Felicitats!"
	done

_OakPCText4::
	text "S'ha tancat la"
	line "connexió al PC"
	cont "del PROF.OAK."
	done

_TrainerRankingExplanationText:: ; unreferenced
	text "Rànquing triple"
	line "d'entrenadors!"

	para "L'arxiu GUARDAR"
	line "que has enviat"
	cont "pot entrar-hi!"

	para ""
	done

_TrainerRankingNoDataText:: ; unreferenced
	text "No hi ha dades"
	line "de rànquing."

	para "Connecta per"
	line "obtenir-les."

	para ""
	done

_MemoryGameYeahText::
	text " , sí!"
	done

_MemoryGameDarnText::
	text "Vaja…"
	done

_StartMenuContestEndText::
	text "Vols acabar"
	line "el Concurs?"
	done

_ItemsTossOutHowManyText::
	text "Quants @"
	text_ram wStringBuffer2
	text_start
	line "vols llençar?"
	done

_ItemsThrowAwayText::
	text "Llençar @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ItemsDiscardedText::
	text "Has llençat"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ItemsTooImportantText::
	text "Això és massa"
	line "important!"
	prompt

_ItemsOakWarningText::
	text "OAK: <PLAYER>!"
	line "Ara no és moment"
	cont "de fer servir"
	cont "això!"
	done

_PokemonSwapItemText::
	text "Has agafat"
	line "@"
	text_ram wStringBuffer1
	text " de"

	para "@"
	text_ram wMonOrItemNameBuffer
	text " i li"
	line "has donat @"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Has fet que @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "porti @"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Sisplau, treu"
	line "el CORREU primer."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " no"
	line "porta res."
	prompt

_ItemStorageFullText::
	text "El magatzem"
	line "d'objectes és ple."
	prompt

_PokemonTookItemText::
	text "Has agafat"
	line "@"
	text_ram wStringBuffer1
	text " de"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " ja"
	line "porta"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Canviar objectes?"
	done

_ItemCantHeldText::
	text "No es pot portar"
	line "aquest objecte."
	prompt

_MailLoseMessageText::
	text "El CORREU perdrà"
	line "el missatge."
	cont "D'acord?"
	done

_MailDetachedText::
	text "CORREU separat de"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "No hi ha espai per"
	line "treure el CORREU."
	prompt

_MailAskSendToPCText::
	text "Enviar el CORREU"
	line "tret al teu PC?"
	done

_MailboxFullText::
	text "La BÚSTIA del PC"
	line "és plena."
	prompt

_MailSentToPCText::
	text "S'ha enviat el"
	line "CORREU al teu PC."
	prompt

_PokemonNotEnoughHPText::
	text "No té prou PS!"
	prompt

_MayRegisterItemText::
	text "Pots registrar un"
	line "objecte de la"

	para "MOTXILLA per usar"
	line "amb SELECT."
	done

_OakText1::
	text "Hola! Perdona per"
	line "fer-te esperar!"

	para "Benvingut al món"
	line "dels #MON!"

	para "Em dic OAK."

	para "La gent em diu el"
	line "PROF. #MON."
	prompt

_OakText2::
	text "Aquest món està"
	line "habitat per unes"
	cont "criatures que"
	cont "anomenem #MON.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

	text_end ; unreferenced

_OakText4::
	text "Persones i #MON"
	line "convivim donant-"

	para "nos suport"
	line "mútuament."

	para "Alguns juguen amb"
	line "#MON, altres"
	cont "hi lluiten."
	prompt

_OakText5::
	text "Però encara no ho"
	line "sabem tot sobre"
	cont "els #MON."

	para "Encara hi ha"
	line "molts misteris"
	cont "per resoldre."

	para "Per això estudio"
	line "#MON cada dia."
	prompt
