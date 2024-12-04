BEGIN BFSCWL2

IF ~Global("BFSBregaInformed","GLOBAL",1)~ THEN BFSCWL2.intro
SAY ~Oh! Oh no! What are you doing here? How did you find me?~
++ ~Simple. I followed the sound of complete and utter incompetence.~ + BFSDOC.StillATerribleMage
++ ~I had some help from a mutual friend.~ + BFSDOC.EmelinaHelp
++ ~You think too highly of yourself. I'm not here for you.~ + BFSDOC.CannotSneakForShit
++ ~Truthfully, I didn't expect to find you here.~ + BFSDOC.CannotSneakForShit
++ ~I'm here to gather evidence against your mentor.~ + BFSDOC.Evidence
END

IF ~~ BFSDOC.EmelinaHelp
SAY ~Emelina put you up to this? But… why? She didn't desire revenge when last we spoke.~
++ ~And she still doesn't. I'm here to gather evidence against your mentor.~ + BFSDOC.Evidence
END

IF ~~ BFSDOC.StillATerribleMage
SAY ~You're beginning to sound just like my mentor. For the record I *am* trying.~ 
= ~And you're avoiding the question. Why are you here?~
++ ~I'm here to gather evidence against your mentor.~ + BFSDOC.Evidence
END

IF ~~ BFSDOC.CannotSneakForShit
SAY ~You found me by accident? I'm terrible at this stealth aspect then.~ 
= ~But not quite so hopeless as to miss an obvious clue. You want something. What is it?~ 
++ ~I'm here to gather evidence against your mentor.~ + BFSDOC.Evidence
END

IF ~~ BFSDOC.Evidence
SAY ~Someone's actually willing to stand against the Cowled Wizards? That's… hard to fathom. If bringing them to task was easy, I'd have done it myself.~
= ~I'd also have been killed for the attempt. But that's part of the not-easy aspect.~
++ ~Inspector Brega has offered his assistance - but he needs solid proof of your mentor's involvement.~ + BFSDOC.BregaIsABro
++ ~You'd be aiming a little above your skillset.~ + BFSDOC.InsultingApprenticesForFunAndProfit
END

IF ~~ BFSDOC.InsultingApprenticesForFunAndProfit
SAY ~You… You are the absolute worst. Just tell me what you need and leave me alone!~ 
++ ~Inspector Brega has offered his assistance - but he needs solid proof of your mentor's involvement.~ + BFSDOC.BregaIsABro
END

IF ~~ BFSDOC.BregaIsABro
SAY ~I assume Emelina's existence, and her word, wasn't enough? …It was never going to be.~ 
IF ~~ + BFSDOC.ApprenticeJournal
END

IF ~~ BFSDOC.ApprenticeJournal
SAY ~There is something I can offer. Something I haven't considered before. When I… *sob* When I buried Liefred's body I found his journal. I couldn't bring myself to read it. But he was paranoid. He always kept notes of his studies. Of the things that might be denied to him if they were common knowledge.~
= ~Here. Take it. His family were better regarded than mine. If they learn of his death… They may demand justice for it. Or deny any connection due to his actions.~
++ ~Thank you. I'll put this to good use.~ + BFSDOC.ReluctantAcceptance
++ ~That's not good enough. I'll need you to testify against your mentor. To explain the task you were given and your part in it.~ + BFSDOC.TestifyDanger
END

IF ~~ BFSDOC.ReluctantAcceptance
SAY ~And I… will testify. Too many lives have been ruined because of this. I've heard good things about Brega. If he will protect my family from harm, then I'll share what I can.~ 
++ ~The Investigator can be found in the Government Building. Seek him out there.~ + BFSDOC.End
END

IF ~~ BFSDOC.TestifyDanger
SAY ~Even if it places my life in danger?~
= ~I… will testify. Too many lives have been ruined because of this. And I've heard good things about Brega. If he will protect my family from harm, then I'll share what I can.~ 
++ ~The Investigator can be found in the Government Building. Seek him out there.~ + BFSDOC.End
END

IF ~~ BFSDOC.End
SAY ~I didn't tell you before. I was too scared of being tracked. Or known. But my name is Velanna. I want you to know it - want someone to know it - should this prove my end.~ 
IF ~~ DO ~SetGlobal("BFSBregaInformed","GLOBAL",2) GiveItemCreate("BFSJNL",Player1,1,0,0) EraseJournalEntry(@100008) AddJournalEntry(@100009, QUEST) DestroySelf()~ EXIT
END

