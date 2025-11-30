BEGIN BFSCWL2

IF ~Global("BFSBregaInformed","GLOBAL",1)~ THEN BFSCWL2.intro
SAY @700 /*~Oh! Oh no! What are you doing here? How did you find me?~*/
++ @701 /*~Simple. I followed the sound of complete and utter incompetence.~*/ + BFSDOC.StillATerribleMage
++ @702 /*~I had some help from a mutual friend.~*/ + BFSDOC.EmelinaHelp
++ @703 /*~You think too highly of yourself. I'm not here for you.~*/ + BFSDOC.CannotSneakForShit
++ @704 /*~Truthfully, I didn't expect to find you here.~*/ + BFSDOC.CannotSneakForShit
++ @705 /*~I'm here to gather evidence against your mentor.~*/ + BFSDOC.Evidence
END

IF ~~ BFSDOC.EmelinaHelp
SAY @706 /*~Emelina put you up to this? But… why? She didn't desire revenge when last we spoke.~*/
++ @707 /*~And she still doesn't. I'm here to gather evidence against your mentor.~*/ + BFSDOC.Evidence
END

IF ~~ BFSDOC.StillATerribleMage
SAY @708 /*~You're beginning to sound just like my mentor. For the record I *am* trying.~*/
= @709 /*~And you're avoiding the question. Why are you here?~*/
++ @705 /*~I'm here to gather evidence against your mentor.~*/ + BFSDOC.Evidence
END

IF ~~ BFSDOC.CannotSneakForShit
SAY @711 /*~You found me by accident? I'm terrible at this stealth aspect then.~*/
= @712 /*~But not quite so hopeless as to miss an obvious clue. You want something. What is it?~*/
++ @705 /*~I'm here to gather evidence against your mentor.~*/ + BFSDOC.Evidence
END

IF ~~ BFSDOC.Evidence
SAY @714 /*~Someone's actually willing to stand against the Cowled Wizards? That's… hard to fathom. If bringing them to task was easy, I'd have done it myself.~*/
= @715 /*~I'd also have been killed for the attempt. But that's part of the not-easy part.~*/
++ @716 /*~Inspector Brega has offered his assistance - but he needs solid proof of your mentor's involvement.~*/ + BFSDOC.BregaIsABro
++ @717 /*~You'd be aiming a little above your skillset.~*/ + BFSDOC.InsultingApprenticesForFunAndProfit
END

IF ~~ BFSDOC.InsultingApprenticesForFunAndProfit
SAY @718 /*~You… You are the absolute worst. Just tell me what you need and leave me alone!~*/
++ @716 /*~Inspector Brega has offered his assistance - but he needs solid proof of your mentor's involvement.~*/ + BFSDOC.BregaIsABro
END

IF ~~ BFSDOC.BregaIsABro
SAY @720 /*~I assume Emelina's existence, and her word, wasn't enough? …It was never going to be.~*/
IF ~~ + BFSDOC.ApprenticeJournal
END

IF ~~ BFSDOC.ApprenticeJournal
SAY @721 /*~There is something I can offer. Something I haven't considered before. When I… *sob* When I buried Liefred's body I found his journal. I couldn't bring myself to read it. But he was paranoid. He always kept notes of his studies. Of the things that might be denied to him if they were common knowledge.~*/
= @722 /*~Here. Take it. His family were better regarded than mine. If they learn of his death… They may demand justice for it. Or deny any connection due to his actions.~*/
++ @723 /*~Thank you. I'll put this to good use.~*/ + BFSDOC.ReluctantAcceptance
++ @724 /*~That's not good enough. I'll need you to testify against your mentor. To explain the task you were given and your part in it.~*/ + BFSDOC.TestifyDanger
END

IF ~~ BFSDOC.ReluctantAcceptance
SAY @725 /*~And I… will testify. Too many lives have been ruined because of this. I've heard good things about Brega. If he will protect my family from harm, then I'll share what I can.~*/
++ @726 /*~The Investigator can be found in the Government Building. Seek him out there.~*/ + BFSDOC.End
END

IF ~~ BFSDOC.TestifyDanger
SAY @727 /*~Even if it places my life in danger?~*/
= @728 /*~I… will testify. Too many lives have been ruined because of this. And I've heard good things about Brega. If he will protect my family from harm, then I'll share what I can.~*/
++ @726 /*~The Investigator can be found in the Government Building. Seek him out there.~*/ + BFSDOC.End
END

IF ~~ BFSDOC.End
SAY @729 /*~I didn't tell you before. I was too scared of being tracked. Or known. But my name is Velanna. I want you to know it - want someone to know it - should this prove my end.~*/
IF ~~ DO ~SetGlobal("BFSBregaInformed","GLOBAL",2) GiveItemCreate("BFSJNL",Player1,1,0,0) EraseJournalEntry(@100008) AddJournalEntry(@100009, QUEST) DestroySelf()~ EXIT
END

