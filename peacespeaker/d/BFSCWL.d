/* 2024.10.20 Dialogue Completed.
2024.10.21 Rewrite / Proofreading completed. */

/* she is young & clearly inexperienced. this is the first outside person she approached about her situation. she wants to give the blade away so they might revert the binding.
the main choice here is whether to clue the authorities in - knowing their justice is flawed - or letting her escape justice for her actions altogether.
there is a third option, inspector brega, but that shouldn't be clear from the start - as that's the TRUE ENDING path */
BEGIN BFSCWL

IF ~Global("BFSApprenticeMet","GLOBAL",0)~ THEN BFSCWL.intro
SAY @640 /*~That was quite the entrance you made.~*/
+ ~!Class(Player1,THIEF_ALL)~ + @641 /*~Subtlety has never been among my strengths.~*/ + BFSCWL.notsubtle
++ @642 /*~I usually pass unnoticed.~*/ + BFSCWL.sneakthief
+ ~Class(Player1,BARD)~ + @643 /*~Anything less and I'd be a disgrace to my craft.~*/ + BFSCWL.okaynarcissus
+ ~Class(Player1,BARD)~ + @644 /*~If that impressed you, just wait until you see my exit.~*/ + BFSCWL.notinterested
++ @645 /*~I had no choice in the matter.~*/ + BFSCWL.desperationsucks
++ @646 /*~Whatever you have to say, I'm not interested.~*/ + BFSCWL.notinterested
END

IF ~~ BFSCWL.notsubtle
SAY @647 /*~I hoped for a bit more discretion...but it's your other talents I require. Will you hear me out?~*/
+ ~OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + @648 /*~You seem uneasy.~*/ + BFSCWL.twitchymuch
++ @649 /*~I will listen.~*/ + BFSCWL.quest
++ @650 /*~Speak then and be done with it.~*/ + BFSCWL.quest
++ @651 /*~On second thought, I'm not interested.~*/ + BFSCWL.notinterested
END

IF ~~ BFSCWL.sneakthief
SAY @652 /*~There is a certain subtlety to your movements. That's precisely the talent that I need. Will you hear me out?~*/
+ ~OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + @648 /*~You seem uneasy.~*/ + BFSCWL.twitchymuch
++ @649 /*~I will listen.~*/ + BFSCWL.quest
++ @650 /*~Speak then and be done with it.~*/ + BFSCWL.quest
++ @651 /*~On second thought, I'm not interested.~*/ + BFSCWL.notinterested
END

IF ~~ BFSCWL.okaynarcissus
SAY @655 /*~You're a performer? I hoped our dealings would remain out of the ears of the public...~*/
+ ~OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + @648 /*~You seem uneasy.~*/ + BFSCWL.twitchymuch
++ @649 /*~I will listen.~*/ + BFSCWL.quest
++ @653 /*~Speak then and be done with it.~*/ + BFSCWL.quest
++ @654 /*~On second thought, I'm not interested.~*/ + BFSCWL.notinterested
END

IF ~~ BFSCWL.desperationsucks
SAY @656 /*~Then you may understand the urgency of my plight. Will you hear me out?~*/
+ ~OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + @648 /*~You seem uneasy.~*/ + BFSCWL.twitchymuch
++ @649 /*~I will listen.~*/ + BFSCWL.quest
++ @653 /*~Speak then and be done with it.~*/ + BFSCWL.quest
++ @654 /*~On second thought, I'm not interested.~*/ + BFSCWL.notinterested
END

/* peacespeaker.exe has been uninstalled
she YEETS herself out of there */
IF ~~ BFSCWL.notinterested
SAY @657 /*~...Oh. Well, uh, then we never had this conversation.~*/
IF ~~ DO ~SetGlobal("BFSApprenticeMet","GLOBAL",1) ActionOverride("BFSCWL",EscapeArea())~ EXIT
END

IF ~~ BFSCWL.twitchymuch
SAY @658 /*~Nervous? Me? No, no, it's nothing. Truly.~*/
++ @649 /*~I will listen.~*/ + BFSCWL.quest
++ @653 /*~Speak then and be done with it.~*/ + BFSCWL.quest
++ @654 /*~On second thought, I'm not interested.~*/ + BFSCWL.notinterested
END

/* she done goofed and offers up a quest */
IF ~~ BFSCWL.quest
SAY @659 /*~Thank you. Until recently, I was apprenticed to one of the Cowled Wizards, charged with crafting a magical weapon...~*/
++ @660 /*~My sister, Imoen, was taken by them! Tell me where she is!~*/ + BFSCWL.gimmedeets
++ @661 /*~My dealings with them have left a sour taste.~*/ + BFSCWL.firstimpressions
++ @662 /*~I've no desire to cross them further. I want no part in this.~*/ + BFSCWL.notinterested
END

IF ~~ BFSCWL.firstimpressions
SAY @663 /*~Your opinion won't improve with prolonged exposure if I'm honest. Forget I said that!~*/
= @664 /*~Where was I...?~*/
IF ~~ + BFSCWL.questcont
END

IF ~~ BFSCWL.gimmedeets
SAY @665 /*~I wish I had the answers you seek...but I am no more part of their inner circle than you are. And, before you ask, no, I wasn't given the opportunity to learn anything of note.~*/
= @666 /*~But there are rumours, horrible rumours, of what happens to those they deem magical deviants. I am sorry to hear about your sister. I hope you can find her.~*/
= @667 /*~But perhaps you can save me from a similar fate? Please.~*/
IF ~~ + BFSCWL.questcont
END

IF ~~ BFSCWL.questcont
SAY @668 /*~I wasn't entirely honest when I said I was recently apprenticed. I *am* still apprenticed to them. My family, though from Amn, have always lived in poverty. When my magical skill manifested...my parents thought joining the Cowled Wizards would change our fortunes. But the task my mentor set has gone terribly, terribly wrong and I don't know where else to turn.~*/
= @669 /*~We were to enchant a weapon, a simple enough task, or so I thought. I've always been deft at enchantment. What I didn't realize was that my fellow apprentice held little talent in this school. He prefered to study necromancy instead. And, well, during the imbuing process a soul was bound to the blade.~*/
++ @670 /*~A soul? That's monstrous!~*/ + BFSCWL.amends
++ @671 /*~How could you mess up this badly?~*/ + BFSCWL.amends
+ ~OR(2) Class(Player1,SORCERER) Class(Player1,MAGE_ALL)~ + @672 /*~A competent mage would have avoided such a disaster.~*/ + BFSCWL.apprenticesucks
++ @673 /*~I see no issue thus far.~*/ + BFSCWL.urnasty
END

IF ~~ BFSCWL.urnasty
SAY @674 /*~You...don't? That's a little unsettling.~*/
IF ~~ + BFSCWL.amends
END

IF ~~ BFSCWL.apprenticesucks
SAY @675 /*~Are you saying you've never had a spell misfire? Never scorched a robe or...or caused a cantrip to go awry?~*/
++ @676 /*~Never. Trust me.~*/ + BFSCWL.shittyexcuseforamage
+ ~Class(Player1,MAGE_ALL) !Kit(Player1,WILDMAGE) !Class(Player1,SORCERER)~ + @677 /*~My mentor taught me control. Yours, clearly, did not.~*/ + BFSCWL.shittyexcuseforamage
+ ~Class(Player1,SORCERER)~ + @678 /*~Magic is in my blood. If I couldn't control it, I'd be long dead.~*/ + BFSCWL.shittyexcuseforamage
+ ~Kit(Player1,WILDMAGE)~ + @679 /*~...Let's just say it's been an adventure.~*/ + BFSCWL.shittyexcuseforamage
END

IF ~~ BFSCWL.shittyexcuseforamage
SAY @680 /*~Fine! I'm terrible at this. At magic. But I'm trying to leave it all behind. And that's why I need your help.~*/
IF ~~ + BFSCWL.amends
END

IF ~~ BFSCWL.amends
SAY @681 /*~My fellow apprentice died during the process. The decision on how to proceed now rests with me. I cannot hand the sword over to my mentor. He'll never release her - the soul - from this bondage.~*/
= @682 /*~But I lack the power to undo the binding myself, and I cannot leave the city without raising suspicion.~*/
++ @683 /*~What exactly are you asking of me?~*/ + BFSCWL.gettothepoint
END

IF ~~ BFSCWL.gettothepoint
SAY @684 /*~My request is twofold. Take the sword from me and heed the soul's counsel. Help her as best you can.~*/
= @6840 /*And secondly... breathe not a word of this to anyone. Especially not the Cowled Wizards. If they find out what I've done, I will be punished. Or worse my family will suffer. I cannot risk either.~*/
++ @685 /*~Why would you entrust a stranger with this task?~*/ + BFSCWL.butmanamibadatmath
++ @686 /*~You are guilty. Justice demands that you atone for the soul you've ruined.~*/ + BFSCWL.guilt
++ @687 /*~I will see the task done. And I won't say a word.~*/ + BFSCWL.loot
++ @688 /*~As amusing as this conversation was. Or wasn't in this case. I don't intend to take on this task.~*/ + BFSCWL.notinterested
END

IF ~~ BFSCWL.butmanamibadatmath
SAY @689 /*~Because I just saw your altercation with the Cowled Wizards. I believe you hate them as much as I do. It's a risk but it's one I decided to take.~*/
IF ~~ + BFSCWL.loot
END

IF ~~ BFSCWL.guilt
SAY @690 /*~If... if you believe that is what must be done. I will not try stop you. I only ask that you consider all your options beforehand.~*/
IF ~~ + BFSCWL.loot
END

/* good job CHARNAME you are now an accomplice unless you tell the Cowled Wizards
you won't do that, will you? */
IF ~~ BFSCWL.loot
SAY @691 /*~I have taken to calling her Peacespeaker - though I suspect she would prefer to speak for herself. Thank you. I might yet have a chance at a normal life after this.~*/
IF ~~ DO ~SetGlobal("BFSApprenticeMet","GLOBAL",1) SetGlobal("BFSEmelinaTaskAccepted","GLOBAL",1) GiveItemCreate("BFSSW",Player1,1,0,0) AddJournalEntry(@100001, QUEST) EscapeArea()~ EXIT
END

