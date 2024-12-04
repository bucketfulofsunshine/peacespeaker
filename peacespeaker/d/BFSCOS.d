/* 2024.10.20 Dialogue completed - outside of Brega investigation options. No proofreading / rewrites started yet. */ 

BEGIN BFSCOS
/* Grumpy Wizard is grumpy. */ 

// The quest hasn't been started
IF ~!Global("BFSEmelinaTaskAccepted","GLOBAL",1)~ THEN BFSCOS.notime
SAY ~Do I look like someone who has time to spare?~ [bfsblank]
IF ~~ EXIT
END

IF ~Global("BFSEmelinaTaskAccepted","GLOBAL",1) !PartyHasItem("BFSSW")~ THEN BFSCOS.notime
SAY ~Do I look like someone who has time to spare?~ [bfsblank]
IF ~~ EXIT
END

// The quest is started, PC wants to inform the Cowled Wizards of Emelina's existence
IF ~Global("BFSEmelinaTaskAccepted","GLOBAL",1) PartyHasItem("BFSSW")~ THEN BFSCOS.theniliedlikealiar
SAY ~We are tasked with maintaining the lawful practice of magic. Such vigilance is the only means to safeguard Amn and its people. Your... concerns are of the utmost annoya— ah, importance to us. What is it you wish to report?~ [bfsblank]
++ ~You don't seem particularly fond of your duties.~ + BFSCOS.deathandtaxes
++ ~An apprentice gave me a magical weapon and specifically bade me not to inform the Cowled Wizards.~ + BFSCOS.rattedout
++ ~I have nothing to report.~ + BFSCOS.secondthoughts
END

IF ~~ BFSCOS.secondthoughts
SAY ~Then do not waste my time.~
IF ~~ EXIT
END

IF ~~ BFSCOS.deathandtaxes
SAY ~Would you be? Dealing with the laity is a tedious chore. But we all have our roles to play, especially if one hopes to rise further up the ranks. Not that it concerns someone outside our organization, of course.~
= ~Do you have something to report or not?~
++ ~An apprentice gave me a magical weapon and specifically bade me not to inform the Cowled Wizards.~ + BFSCOS.rattedout
++ ~I have nothing to report.~ + BFSCOS.secondthoughts
END

IF ~~ BFSCOS.rattedout
SAY ~Yet more proof that taking on apprentices is a fool's errand. Another *requirement* for those of us with any ambition. One I will speak against once I hold more sway.~ 
= ~But this matter, unlike so many others I hear, warrants further investigation. Let me summon my quill and write down the particulars. Where to begin...? Perhaps with the name of this apprentice?~
++ ~She never told me her name. She merely spoke of a task her mentor set her and her fellow apprentice. To enchant a simple scimitar. I have the blade in my possession.~ + BFSCOS.ohnoes
END

IF ~~ BFSCOS.ohnoes
SAY ~*Two* apprentices. An enchanted scimitar. ...She would not dare! Hand over the blade at once!~
++ ~Here you go.~ + BFSCOS.cont
++ ~Very well. But I expect a reward for my cooperation.~ + BFSCOS.cont
END

IF ~~ BFSCOS.cont
SAY ~...~
= ~Velanna thought she could deceive me? Inconceivable.~
= ~I shall resolve your complaint personally. Your part is over. Accept this offering of coin as a sign of my esteem. The Cowled Wizards thank you for your service.~
++ ~Since I've helped you, I want to ask where I can find someone taken by--~ + BFSCOS.end
++ ~You're really worked up about this.~ + BFSCOS.end
END

IF ~~ BFSCOS.end
SAY ~I must be off. Excuse me.~
IF ~~ DO ~AddJournalEntry(@100003, QUEST_DONE) TakePartyItem("BFSSW") DestroyItem("BFSSW") SetGlobal("BFSEmelinaTaskAccepted","GLOBAL",2) GiveGoldForce(2000) AddXPObject(Player1,1000) AddXPObject(Player2,1000) AddXPObject(Player3,1000) AddXPObject(Player4,1000) AddXPObject(Player5,1000) AddXPObject(Player6,1000) DestroySelf()~ EXIT
END 

// Try to inform Brega instead
// You sweet summer child, he wants to help, but his hands are tied
EXTEND_BOTTOM HABREGA 0
+ ~Global("BFSEmelinaTaskAccepted","GLOBAL",1) Global("BFSBregaInformed","GLOBAL",0)~ + ~I want to report an act of magical misconduct.~ DO ~SetGlobal("BFSBregaInformed","GLOBAL",1)~ + BFS.Brega
END

CHAIN HABREGA BFS.Brega
~Magical misconduct, you say? *sigh* Such matters fall beyond my jurisdiction. Regrettably.~
= ~You are not the first to report Cowled Wizard negligence. I cannot take these claims further - without proof my hands are tied. If you possess - or find - some form of evidence, I may be able to force the matter.~ 
= ~Otherwise, if you seek quick justice - some warped version of it - speak with the Cowled Wizards themselves. There are several present within this hall.~
END
IF ~~ DO ~EraseJournalEntry(@100002) AddJournalEntry(@100007, QUEST)~ EXIT

// You have the receipts though 
EXTEND_BOTTOM HABREGA 0
+ ~Global("BFSBregaInformed","GLOBAL",2)~ + ~Has Velanna spoken with you yet?~ DO ~SetGlobal("BFSBregaInformed","GLOBAL",3)~ + BFS.BregaEvidence
END

CHAIN HABREGA BFS.BregaEvidence
~She has. A rather sordid affair, I must say. Miss Velanna mentioned that you'd hand over a journal along with the magical sword in question.~ 
END
++ ~From my hands safely to yours.~ EXTERN HABREGA BFS.BregaEvidenceEnd

CHAIN HABREGA BFS.BregaEvidenceEnd
~Thank you, citizen. Corruption within the Cowled Wizard ranks is rampant but, with this, we'll take a small step towards ending it.~
= ~Once the trial is over, I will personally see to freeing the soul from the sword. For now, as a token of the city's esteem and my personal thanks, I'd like to offer you a reward.~
DO ~AddJournalEntry(@100010, QUEST_DONE) TakePartyItem("BFSSW") DestroyItem("BFSSW") TakePartyItem("BFSJNL") DestroyItem("BFSJNL") GiveGoldForce(10000) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ 
EXIT
