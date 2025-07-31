/* 2024.10.20 Dialogue completed - outside of Brega investigation options. No proofreading / rewrites started yet. */

BEGIN BFSCOS
/* Grumpy Wizard is grumpy. */

// The quest hasn't been started
IF ~!Global("BFSEmelinaTaskAccepted","GLOBAL",1)~ THEN BFSCOS.notime
SAY @500  /*Do I look like someone who has time to spare?*/
IF ~~ EXIT
END

IF ~Global("BFSEmelinaTaskAccepted","GLOBAL",1) !PartyHasItem("BFSSW")~ THEN BFSCOS.notime
SAY @500 /*Do I look like someone who has time to spare?*/
IF ~~ EXIT
END

// The quest is started, PC wants to inform the Cowled Wizards of Emelina's existence
IF ~Global("BFSEmelinaTaskAccepted","GLOBAL",1) PartyHasItem("BFSSW")~ THEN BFSCOS.theniliedlikealiar
SAY @501 /*We are tasked with maintaining the lawful practice of magic. Such vigilance is the only means to safeguard Amn and its people. Your... concerns are of the utmost annoya— ah, importance to us. What is it you wish to report?*/
++ @502 /*You don't seem particularly fond of your duties.*/ + BFSCOS.deathandtaxes
++ @503 /*An apprentice gave me a magical weapon and specifically bade me not to inform the Cowled Wizards.*/ + BFSCOS.rattedout
++ @506 /*I have nothing to report.*/ + BFSCOS.secondthoughts
END

IF ~~ BFSCOS.secondthoughts
SAY @525 /*Then do not waste my time.*/
IF ~~ EXIT
END

IF ~~ BFSCOS.deathandtaxes
SAY @504 /*Would you be? Dealing with the laity is a tedious chore. But we all have our roles to play, especially if one hopes to rise further up the ranks. Not that it concerns someone outside our organization, of course.*/
= @505 /*Do you have something to report or not?*/
++ @503 /*An apprentice gave me a magical weapon and specifically bade me not to inform the Cowled Wizards.*/ + BFSCOS.rattedout
++ @506 /*I have nothing to report.*/ + BFSCOS.secondthoughts
END

IF ~~ BFSCOS.rattedout
SAY @507 /*Yet more proof that taking on apprentices is a fool's errand. Another *requirement* for those of us with any ambition. One I will speak against once I hold more sway.*/
= @508 /*But this matter, unlike so many others I hear, warrants further investigation. Let me summon my quill and write down the particulars. Where to begin...? Perhaps with the name of this apprentice?*/
++ @509 /*She never told me her name. She merely spoke of a task her mentor set her and her fellow apprentice. To enchant a simple scimitar. I have the blade in my possession.*/ + BFSCOS.ohnoes
END

IF ~~ BFSCOS.ohnoes
SAY @510 /**Two* apprentices. An enchanted scimitar. ...She would not dare! Hand over the blade at once!*/
++ @511 /*Here you go.*/ + BFSCOS.cont
++ @512 /*Very well. But I expect a reward for my cooperation.*/ + BFSCOS.cont
END

IF ~~ BFSCOS.cont
SAY ~...~
= @513 /*Velanna thought she could deceive me? Inconceivable*/
= @514 /*~I shall resolve your complaint personally. Your part is over. Accept this offering of coin as a sign of my esteem. The Cowled Wizards thank you for your service.~*/
++ @515 /*Since I've helped you, I want to ask where I can find someone taken by—*/ + BFSCOS.end
++ @516 /*You are really worked up about this.*/ + BFSCOS.end
END

IF ~~ BFSCOS.end
SAY @517 /*I must be off. Excuse me.*/
IF ~~ DO ~AddJournalEntry(@100003, QUEST_DONE) TakePartyItem("BFSSW") DestroyItem("BFSSW") SetGlobal("BFSEmelinaTaskAccepted","GLOBAL",2) GiveGoldForce(2000) AddExperienceParty(6000) DestroySelf()~ EXIT
END

// Try to inform Brega instead
// You sweet summer child, he wants to help, but his hands are tied
EXTEND_BOTTOM HABREGA 0
+ ~Global("BFSEmelinaTaskAccepted","GLOBAL",1) Global("BFSBregaInformed","GLOBAL",0)~ + @526 /*~I want to report an act of magical misconduct.~*/ DO ~SetGlobal("BFSBregaInformed","GLOBAL",1)~ + BFS.Brega
END

CHAIN HABREGA BFS.Brega
@518 /*Magical misconduct, you say? *sigh* Such matters fall beyond my jurisdiction. Regrettably.*/
= @519 /*~You are not the first to report Cowled Wizard negligence. I cannot take these claims further. Without proof my hands are tied. If you possess, or find, some form of evidence, I may be able to force the matter.~*/
= @520 /*~Otherwise, if you seek quick justice - some warped version of it - speak with the Cowled Wizards themselves. There are several present within this hall.~*/
END
IF ~~ DO ~EraseJournalEntry(@100002) AddJournalEntry(@100007, QUEST)~ EXIT

// You have the receipts though
EXTEND_BOTTOM HABREGA 0
+ ~Global("BFSBregaInformed","GLOBAL",2)~ + @527 /*~Has Velanna spoken with you yet?~*/ DO ~SetGlobal("BFSBregaInformed","GLOBAL",3)~ + BFS.BregaEvidence
END

CHAIN HABREGA BFS.BregaEvidence
@521 /*She has. A rather sordid affair, I must say. Miss Velanna mentioned that you'd hand over a journal along with the magical sword in question.*/
END
++ @522 /*From my hands safely to yours.*/ EXTERN HABREGA BFS.BregaEvidenceEnd

CHAIN HABREGA BFS.BregaEvidenceEnd
@523 /*~Thank you, citizen. Corruption within the Cowled Wizard ranks is rampant but, with this, we'll take a small step towards ending it.~*/
= @524 /*Once the trial is over, I will personally see to freeing the soul from the sword. For now, as a token of the city's esteem and my personal thanks, I'd like to offer you a reward.*/
DO ~AddJournalEntry(@100010, QUEST_DONE) TakePartyItem("BFSSW") DestroyItem("BFSSW") TakePartyItem("BFSJNL") DestroyItem("BFSJNL") GiveGoldForce(10000) AddExperienceParty(15000)~
EXIT
