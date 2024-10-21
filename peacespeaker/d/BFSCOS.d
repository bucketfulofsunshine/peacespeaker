/* 2024.10.20 Dialogue completed - outside of Brega investigation options. No proofreading / rewrites started yet. */ 

BEGIN BFSCOS

// The quest hasn't been started
IF ~!Global("BFSEmelinaTaskAccepted","GLOBAL",1)~ THEN BFSCOS.notime
SAY ~Do I look like someone who has time to spare?~
IF ~~ EXIT
END

IF ~Global("BFSEmelinaTaskAccepted","GLOBAL",1) !PartyHasItem("BFSSW")~ THEN BFSCOS.notime
SAY ~Do I look like someone who has time to spare?~
IF ~~ EXIT
END

// The quest is started, PC wants to inform the Cowled Wizards of Emelina's existence
IF ~Global("BFSEmelinaTaskAccepted","GLOBAL",1) PartyHasItem("BFSSW")~ THEN BFSCOS.theniliedlikealiar
SAY ~We are tasked with maintaining the lawful practice of magic. Such vigilance is the only means to safeguard Amn and its people. Your... concerns are of the utmost annoya— ah, importance to us. What is it you wish to report?~
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
++ ~She never told me her name. She merely spoke of a task her mentor set her and her fellow apprentice. To enchant a simple longsword. I have the blade in my possession.~ + BFSCOS.ohnoes
END

IF ~~ BFSCOS.ohnoes
SAY ~*Two* apprentices. An enchanted longsword. ...She would not dare! Hand over the blade at once!~
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
IF ~~ DO ~AddJournalEntry(@100003, QUEST_DONE) TakePartyItem("BFSSW") DestroyItem("BFSSW") SetGlobal("BFSEmelinaTaskAccepted","GLOBAL",2) GiveGoldForce(2000) AddXPObject(Player1,1000) AddXPObject(Player2,1000) AddXPObject(Player3,1000) AddXPObject(Player4,1000) AddXPObject(Player5,1000) AddXPObject(Player6,1000) ActionOverride("BFSCOS",EscapeArea())~ EXIT
END 

// Try to inform Brega instead
// You sweet summer child, he wants to help, but his hands are tied
// In a future version of the quest I will expand on this and allow *him* to offer a true version of justice
EXTEND_BOTTOM HABREGA 0
+ ~Global("BFSEmelinaTaskAccepted","GLOBAL",1) Global("BFSBregaInformed","GLOBAL",0)~ + ~I want to report an act of magical misconduct.~ DO ~SetGlobal("BFSBregaInformed","GLOBAL",1)~ + BFS.Brega
END

CHAIN HABREGA BFS.Brega
~Magical misconduct, you say? *sigh* Such matters fall beyond my jurisdiction. Regrettably. If you seek justice, or some warped version of it, speak with the Cowled Wizards. There are several present within this hall.~
END
IF ~~ EXIT
