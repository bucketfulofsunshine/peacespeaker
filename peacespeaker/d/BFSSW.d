BEGIN BFSSW

IF ~Global("BFSEmelinaIntro", "GLOBAL", 0)~ THEN BEGIN BFSEM.introductory
SAY ~May I know the name of my wielder?~
++ ~I am <CHARNAME>.~ + BFSEM.nameknown
++ ~Hah! So the sword actually speaks!~ + BFSEM.talkingweaponisfunny
+ ~Class(Player1,BARD)~ + ~As a bard, I must say, a talking weapon suits me well. Fancy a contest of wits?~ + BFSEM.talkingcontest
++ ~I have no interest in a talking weapon. Stay quiet or else.~ + BFSEM.donttalkrude
END

IF ~~ BFSEM.nameknown
SAY ~It is a pleasure, <CHARNAME>. My name is Emelina and in life I was a druid. One of the faithful of Eldath. Though my previous wielder has taken to calling me Peacespeaker.~
+ ~Class(Player1,DRUID_ALL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + ~Eldath, the Goddess of Singing Waters, if my knowledge does not fail me.~ + BFSEM.smartypants
++ ~Who is Eldath?~ + BFSEM.eldathwho
END

IF ~~ BFSEM.talkingweaponisfunny
SAY ~I have been capable of speech for many years. Even being forged into a blade hasn't robbed me of the ability.~ 
= ~*sigh* My name is Emelina and in life I was a druid. One of the faithful of Eldath. Though my previous wielder has taken to calling me Peacespeaker.~ 
+ ~Class(Player1,DRUID_ALL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + ~Eldath, the Goddess of Singing Waters, if my knowledge does not fail me.~ + BFSEM.smartypants
++ ~Who is Eldath?~ + BFSEM.eldathwho
END

IF ~~ BFSEM.talkingcontest
SAY ~I would prefer to avoid conflict altogether. Even the kind waged with words.~
= ~*sigh* My name is Emelina and in life I was a druid. One of the faithful of Eldath. Though my previous wielder has taken to calling me Peacespeaker.~ 
+ ~Class(Player1,DRUID_ALL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + ~Eldath, the Goddess of Singing Waters, if my knowledge does not fail me.~ + BFSEM.smartypants
++ ~Who is Eldath?~ + BFSEM.eldathwho
END

IF  ~~ BFSEM.smartypants
SAY ~It does not.~
= ~To those who follow her, she is the gentle mist that follows a warm summer day. The melodic rustle of leaves accompanying a calm breeze. When your heart knows peace then you are close to Eldath.~
++ ~How were you pulled into a blade?~ + BFSEM.CruxoftheMatter
END

IF ~~ BFSEM.eldathwho
SAY ~Are you asking for a formal overview? Eldath is known as the Guardian of Groves, the Goddess of Singing Waters. She embodies peace, even in the face of conflict, and chooses to retreat rather than fight.~
= ~To those who follow her, she is the gentle mist that follows a warm summer day. The melodic rustle of leaves accompanying a calm breeze. When your heart knows peace then you are close to Eldath.~ 
++ ~How were you pulled into a blade?~ + BFSEM.CruxoftheMatter
END

IF ~~ BFSEM.CruxoftheMatter
SAY ~I cannot say for certain. I was slipping away, worn down by time and age, my soul on the precipice of shattering... But I felt a faint tug, then a violent pull, and suddenly my consciousness was imprisoned within this shell.~ 
= ~One of the young apprentices responsible seemed most distressed. I admit to feeling rather distressed myself.~ 
++ ~Wait. You simply *forgive* the apprentice who got you into this predicament?~ + BFSEM.Forgiveness
+ ~Class(Player1,PALADIN)~ + ~I vow that we will free you from this cursed bondage, Emelina.~ + BFSEM.FreedomOath
++ ~You were dying? Is it not preferable to exist as you are now, rather than face the uncertainty of death?~ + BFSEM.CurrentState
++ ~Then how do we revert the spell?~ + BFSEM.RevertSpell
END

IF ~~ BFSEM.CurrentState
SAY ~To remain in this state, bound to steel and without life's natural cycle, goes against everything I believed as a druid. No. I would not cling to this form out of fear. There is no terror in passing beyond. Only peace.~ 
IF ~~ + BFSEM.RevertSpell
END

IF ~~ BFSEM.FreedomOath
SAY ~There is power in your words. There is strength. I thank you for it. Your resolve bolsters my own spirit.~ 
IF ~~ + BFSEM.RevertSpell
END

IF ~~ BFSEM.Forgiveness
SAY ~What other course should I take? She did not intend this - and vindictiveness brings me no closer to freedom.~ 
IF ~~ + BFSEM.RevertSpell
END

IF ~~ BFSEM.RevertSpell
SAY ~I have given some thought to the matter. Any harm that befalls me is within my goddess' power to undo. Yet my connection to her is faint... weakened. I cannot commune with Eldath. Not within the confines of this city - steeped in violence and unrest. And, within this form, my reach is further limited.~
= ~There is a small town, known as Imnesvale, held sacred by rangers and druids alike. Eldath's presence is strong there. If you would guide me there, I may call upon my goddess, and she will hear my prayers.~
++ ~I will do as you suggest.~ + BFSEM.ImnesvaleAccepted
++ ~I have no intention of taking you anywhere. The Cowled Wizards must learn of this deception.~ + BFSEM.CowledRatty
// the option that lets you speak with Brega and investigate
// aka version 2.0 of peacespeaker
++ ~While I sympathise with your plight, this injustice cannot go unanswered. If the Cowled Wizards are not held to account for their actions, others may suffer the same fate. We have to report this to Amn's authorities.~ + BFSEM.LawfulPath
++ ~I require a weapon but I have no interest in conversing with you further.~ + BFSEM.EldathTrial
END

IF ~~ BFSEM.ImnesvaleAccepted
SAY ~I cannot begin to express the depths of my gratitude.~
~There is another matter. As a druid of Eldath, I have taken vows to avoid violence. Yet a sheathed blade may not serve *you*. It may even lead to your death. I ask that, if you must draw me, do so only in moments of great need.~
IF ~~ DO ~SetGlobal("BFSEmelinaIntro","GLOBAL",1)~ EXIT
END

IF ~~ BFSEM.CowledRatty
SAY ~I only ask that you consider my solution.~
IF ~~ DO ~SetGlobal("BFSEmelinaIntro","GLOBAL",1)~ EXIT
END

IF ~~ BFSEM.LawfulPath
SAY ~I would not wish this fate upon another. If you believe this to be the best course...~
= ~Then I will aid you as best I can.~ 
IF ~~ DO ~SetGlobal("BFSEmelinaIntro","GLOBAL",1)~ EXIT
END

// she goes quiet for good. hoping she might find a peaceful solution WAY down the line with someone else
IF ~~ BFSEM.EldathTrial
SAY ~Then I will bide my time. Perhaps I may exchange hands with another wielder yet.~ 
= ~I accept your trial, Eldath, and I will endure as long as I must.~
IF ~~ DO ~SetGlobal("BFSEmelinaQuiet","GLOBAL",1) SetGlobal("BFSEmelinaIntro","GLOBAL",1) TakePartyItem("BFSSW") GiveItemCreate("BFSS2",Player1,1,0,0)~ EXIT
END

// change to normal longsword, no longer conversable 
IF ~~ BFSEM.donttalkrude
SAY ~As you command.~
IF ~~ DO ~SetGlobal("BFSEmelinaQuiet","GLOBAL",1) SetGlobal("BFSEmelinaIntro","GLOBAL",1) TakePartyItem("BFSSW") GiveItemCreate("BFSS2",Player1,1,0,0)~ EXIT
END

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// this is emelina's main DIALOGUE HUB
IF ~Global("BFSEmelinaIntro", "GLOBAL", 1)~ THEN BEGIN BFSEM.mainhub
SAY ~Ah, <CHARNAME>, it brings me great joy to speak with you.~
++ ~May I ask a few questions?~ + BFSEM.questionhub
+ ~Global("BFSLineageKnown", "GLOBAL", 0)~ + ~I have a confession to make... I am a Bhaalspawn, a child of the Lord of Murder.~ + BFSEM.bhaalspawn
// ++ ~Emelina, do you know where I can start my investigation?~ + BFSEM.investigationapproach
// + ~AreaCheck("AR1100")~ + ~We've arrived in Imnesvale. What is our next step?~ + BFSEM.imnesvaleapproach
++ ~That is all for now.~ + BFSEM.convoexit
END

IF ~~ BFSEM.convoexit
SAY ~May compassion guide your hand.~
IF ~~ EXIT
END

IF ~~ BFSEM.bhaalspawn
SAY ~That must be a heavy burden to carry. If I may ask, how has your lineage affected you?~
++ ~I don't allow it control me. As long as I act with my own free will, I will oppose Bhaal's plans.~ + BFSEM.Bhaal1
++ ~I embrace the power it offers me.~ + BFSEM.Bhaal2
++ ~I don't want to dwell on it. I wanted you to know, and now you do, so let's leave it at that.~ + BFSEM.Bhaal3
END

IF ~~ BFSEM.Bhaal1
SAY ~To choose peace is a noble path. But doing so when violence is woven into your very nature... that is a rare strength.~
= ~You inspire me, <CHARNAME>. Eldath must have guided our paths to cross, even under these grim circumstances.~
= ~If the burden ever grows too heavy and you require a friendly ear - or sword - I am at your disposal. Thank you for trusting me.~
IF ~~ DO ~SetGlobal("BFSLineageKnown","GLOBAL",1)~ EXIT
END

IF ~~ BFSEM.Bhaal2
SAY ~That is troubling. Though I am in no position to oppose you. Nor is doing so in my nature.~
= ~I will keep your lineage in mind as I observe your actions. Thank you for telling me.~
IF ~~ DO ~SetGlobal("BFSLineageKnown","GLOBAL",1)~ EXIT
END

IF ~~ BFSEM.Bhaal3
SAY ~I don't know why you felt the need to share your secret but I am grateful you did.~
= ~Choosing peace is never easy, especially when one's core nature leans toward violence.~
= ~But, as Eldath teaches, even that can be overcome.~
IF ~~ DO ~SetGlobal("BFSLineageKnown","GLOBAL",1)~ EXIT
END

IF ~~ BFSEM.questionhub
SAY ~Of course. I prefer conversation over conflict.~
+ ~Global("BFSPastLife", "GLOBAL", 0)~ + ~What was your life like before all this?~ + BFSEM.pastlife
++ ~I have no further questions.~ + BFSEM.convoexit
END

IF ~~ BFSEM.pastlife
SAY ~Quiet and serene. My days began in peaceful meditation, and when the sun shone high, we would tend to the needs of the land. By nightfall we would gather around a campfire, sharing stories, laughter, and a drink among friends.~
~It was a life full of contentment. One I look back on with warmth.~
IF ~~ DO ~SetGlobal("BFSPastLife","GLOBAL",1)~ EXIT
END

/* cutscene to near water
 finish dialogue there
IF ~~ BFSEM.imnesvaleapproach
SAY ~What I'm about to suggest may sound unusual. But I ask that you escort me to a river and lower me into its waters.~
IF ~~ EXIT
END */ 

// IF ~~ BFSEM.investigationapproach
// SAY ~In my current form I perceive only vague impressions. But I recall the sound of waves breaking against stone. Wood creaking under its own weight, carried across a vast body of water. Perhaps we seek a harbour of sorts?~
// ++ ~We'll start searching around the docks then.~ + 
// END
