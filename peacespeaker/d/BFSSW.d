/* 2024.10.21 Dialogue completed outside of the Brega investigation options. Rewrite / Proofreading not started. */ 

BEGIN BFSSW // This weapon is full of it.

/* Emelina introduces herself and offers a possible solution */
IF ~Global("BFSEmelinaIntro", "GLOBAL", 0)~ THEN BEGIN BFSEM.introductory
SAY ~May I know the name of my wielder?~
++ ~I am <CHARNAME>.~ + BFSEM.hellocharnameiamsword
++ ~Hah! So the sword actually speaks!~ + BFSEM.thetrickisgettingittoshutup
+ ~Class(Player1,BARD)~ + ~As a bard, I must say, a talking weapon suits me well. Fancy a contest of wits?~ + BFSEM.contestofwits
++ ~I have no interest in a talking weapon. Stay quiet or else.~ + BFSEM.donttalkrude
END

IF ~~ BFSEM.hellocharnameiamsword
SAY ~It is a pleasure to meet you, <CHARNAME>. My name is Emelina and in life I was a druid. One of the faithful of Eldath. Though my previous wielder has taken to calling me Peacespeaker.~
+ ~Class(Player1,DRUID_ALL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + ~Eldath, the Goddess of Singing Waters, if memory serves.~ + BFSEM.smartypants
++ ~Who is Eldath?~ + BFSEM.eldathwho
END

IF ~~ BFSEM.thetrickisgettingittoshutup
SAY ~I have been capable of speech for many years. Even being forged into a blade hasn't robbed me of the ability.~ 
= ~*sigh* My name is Emelina and in life I was a druid. One of the faithful of Eldath. Though my previous wielder has taken to calling me Peacespeaker.~ 
+ ~Class(Player1,DRUID_ALL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + ~Eldath, the Goddess of Singing Waters, if memory serves.~ + BFSEM.smartypants
++ ~Who is Eldath?~ + BFSEM.eldathwho
END

IF ~~ BFSEM.contestofwits
SAY ~I would prefer to avoid conflict altogether. Even the kind waged with words.~
= ~*sigh* My name is Emelina and in life I was a druid. One of the faithful of Eldath. Though my previous wielder has taken to calling me Peacespeaker.~ 
+ ~Class(Player1,DRUID_ALL) OR(2) CheckStatGT(Player1,14,WIS) CheckStatGT(Player1,14,INT)~ + ~Eldath, the Goddess of Singing Waters, if memory serves.~ + BFSEM.smartypants
++ ~Who is Eldath?~ + BFSEM.eldathwho
END

IF  ~~ BFSEM.smartypants
SAY ~Your knowledge does not fail you.~
= ~To those who follow her, Eldath is the gentle mist that follows a warm summer day. The melodic rustle of leaves accompanying a calm breeze. When your heart knows peace then you are close to Eldath.~
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
++ ~Then how do we undo the spell?~ + BFSEM.RevertSpell
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
SAY ~I have given some thought to the matter. Any harm that befalls me is within my goddess' power to revert. Yet my connection to her is faint... weakened. I cannot commune with Eldath. Not within the confines of this city - steeped in violence and unrest. And, within this form, my reach is further limited.~
= ~There is a small town, known as Imnesvale, held sacred by rangers and druids alike. Eldath's presence is strong there. If you would guide me there, I may call upon my goddess, and she will hear my prayers.~
++ ~I will do as you suggest.~ + BFSEM.ImnesvaleAccepted
++ ~I have no intention of taking you anywhere. The Cowled Wizards must learn of this deception.~ + BFSEM.CowledRatty
/* The option that lets you speak with Brega and investigate aka version 2.0 of Peacespeaker. */
// ++ ~While I sympathise with your plight, this injustice cannot go unanswered. If the Cowled Wizards are not held to account for their actions, others may suffer the same fate. We have to report this to Amn's authorities.~ + BFSEM.LawfulPath
++ ~I require a weapon but I have no interest in conversing with you further.~ + BFSEM.EldathTrial
END

IF ~~ BFSEM.ImnesvaleAccepted
SAY ~I cannot begin to express the depths of my gratitude.~
~There is another matter. As a druid of Eldath, I have taken vows to avoid violence. Yet a sheathed blade may not serve you. I ask that, if you must draw me, to do so only in moments of great need.~
= ~With my soul bound to the blade, a portion of my healing powers remain. May they add you in our shared cause.~
IF ~~ DO ~SetGlobal("BFSEmelinaIntro","GLOBAL",1) EraseJournalEntry(@100001) AddJournalEntry(@100002, QUEST)~ EXIT
END

IF ~~ BFSEM.CowledRatty
SAY ~I only ask that you consider my solution.~
~There is another matter. As a druid of Eldath, I have taken vows to avoid violence. Yet a sheathed blade may not serve you. I ask that, if you must draw me, to do so only in moments of great need.~
= ~With my soul bound to the blade, a portion of my healing powers remain. May they add you in our shared cause.~
IF ~~ DO ~SetGlobal("BFSEmelinaIntro","GLOBAL",1) EraseJournalEntry(@100001) AddJournalEntry(@100002, QUEST)~ EXIT
END

/*IF ~~ BFSEM.LawfulPath
SAY ~I would not wish this fate upon another. If you believe this to be the best course...~
= ~Then I will aid you as best I can.~ 
IF ~~ DO ~SetGlobal("BFSEmelinaIntro","GLOBAL",1) EraseJournalEntry(@100001) AddJournalEntry(@100002, QUEST)~ EXIT
END */

/* She goes quiet for good after this. Hoping she might find a peaceful solution WAY down the line. With someone else. 
Change to normal longsword, no longer conversable. */
IF ~~ BFSEM.EldathTrial
SAY ~Then I will bide my time. Perhaps I may exchange hands with another wielder yet.~ 
= ~I accept your trial, Eldath, and I will endure as long as I must.~
IF ~~ DO ~SetGlobal("BFSEmelinaQuiet","GLOBAL",1) SetGlobal("BFSEmelinaIntro","GLOBAL",1) TransformItem("BFSSW","BFSS2") EraseJournalEntry(@100001) AddJournalEntry(@100004, QUEST_DONE)~ EXIT
END

/* Enjoy your free loot I guess. Peacespeaker.exe is uninstalled.
Change to normal longsword, no longer conversable. */
IF ~~ BFSEM.donttalkrude
SAY ~As you command.~
IF ~~ DO ~SetGlobal("BFSEmelinaQuiet","GLOBAL",1) SetGlobal("BFSEmelinaIntro","GLOBAL",1) TransformItem("BFSSW","BFSS2") EraseJournalEntry(@100001) AddJournalEntry(@100004, QUEST_DONE)~ EXIT
END

/////////////////////////////////////////
//                                     //
//      Scenery & Quest Dialogue       //
//                                     //
///////////////////////////////////////// 

/* Player also has Lilarcor in their inventory
Emelina thinks this is a special kind of hell. */
IF ~Global("BFSEmelinaLilarcor","GLOBAL",0) PartyHasItem("SW2H14")~ THEN BEGIN BFSEM.LilarcorTalk
SAY ~I have never felt this opposed to another being in my entire existence.~
= ~Lilarcor's bloodlust leaves me ill-at-ease. Though, at least, one of us seems to enjoy our current predicament. After all - what is a sword good for if not to shed blood?~ 
++ ~You can say *violently* opposed, you know?~ + BFSEM.LilViolentlyOpposed
++ ~You two seem to be polar opposites.~ + BFSEM.LilOpposites
++ ~Lilarcor is an acquired taste, I admit.~ + BFSEM.LilIsAPersonality
++ ~You are more than a simple sword, Emelina.~ + BFSEM.LilComfort
END

IF ~~ BFSEM.LilComfort
SAY ~And yet, in my current state, the best assistance I can offer is to harm those who would harm you. *sigh*~
= ~But I thank you for your words, <CHARNAME>, and I take them to heart.~ 
IF ~~ + BFSEM.LilIsAPersonality 
END


IF ~~ BFSEM.LilViolentlyOpposed
SAY ~I thank you for the suggestion - but I refuse.~ 
IF ~~ + BFSEM.LilIsAPersonality
END

IF ~~ BFSEM.LilIsAPersonality
SAY ~I worry, with the kind of trouble you get into, that Lilarcor's desire for battle will only grow. That it will become increasingly more unstable.~
= ~Eldath knows, if I spent several hundred years entrapped in this form, *I* might second guess my pacifist nature. Please don't let it come to that, <CHARNAME>.~
IF ~~ DO ~SetGlobal("BFSEmelinaLilarcor","GLOBAL",1)~ EXIT
END

IF ~~ BFSEM.LilOpposites
SAY ~To my knowledge sentient weapons are quite rare. Even if the people who hear their weapons speaking to them can be …let's just say higher in number.~
= ~That I find myself in the company of one like myself should be pleasant - if Lilarcor showed the slightest degree of remorse or decorum. But I digress.~
IF ~~ + BFSEM.LilIsAPersonality
END

/* Emelina's Dialogue in the Umar Hills / Imnesvale - QUEST END THREE */ 
IF ~Global("BFSEmelinaUmarHills", "GLOBAL", 1)~ THEN BEGIN BFSEM.imnessolution
SAY ~I can feel Eldath's soothing presence here. I suspect, once I start my prayers, there will be no further chance to speak with you.~ 
= ~Thank you for my helping me to regain my freedom.~
+ ~Global("BFSLineageKnown","GLOBAL",1)~ + ~You're welcome, Emelina.~ + BFSEM.BhaalspawnReward
+  ~!Global("BFSLineageKnown","GLOBAL",1)~  + ~You're welcome, Emelina.~ + BFSEM.NormalReward
+ ~Global("BFSLineageKnown","GLOBAL",1)~ + ~I just hope there's a decent reward at the end of this.~ + BFSEM.BhaalspawnReward
+ ~!Global("BFSLineageKnown","GLOBAL",1)~ + ~I just hope there's a decent reward at the end of this.~ + BFSEM.NormalReward
END

IF ~~ BFSEM.BhaalspawnReward 
SAY ~While your path may be paved with blood, the stones laid down by those who came before you, you continue to choose kindness. To choose mercy when possible. I'm certain the goddess will smile upon you.~ 
= ~I wish you peace, <CHARNAME>, at the end of your long road. If that is something that you wish for yourself.~ 
IF ~~ + BFSEM.EldathPrayer
END

IF ~~ BFSEM.NormalReward
SAY ~I wish you peace on the road ahead, <CHARNAME>. If that is something that you wish for yourself.~ 
IF ~~ + BFSEM.EldathPrayer
END

IF ~~ BFSEM.EldathPrayer
SAY ~Gentle Eldath, hear my plea 
My soul, bound and tethered, longs for release.
Unbind me from this shell,
And let me flow back to your peaceful embrace.~
// Add Magic healing effect here 
IF ~~ DO ~CreateVisualEffectObject("SPHEALIN",Player1) TransformItem("BFSSW","BFSSU") AddXPObject(Player1,5000) AddXPObject(Player2,5000) AddXPObject(Player3,5000) AddXPObject(Player4,5000) AddXPObject(Player5,5000) AddXPObject(Player6,5000) SetGlobal("BFSEmelinaUmarHills","GLOBAL",2) EraseJournalEntry(@100005) AddJournalEntry(@100006, QUEST_DONE)~ EXIT
END

/////////////////////////////////////////
//                                     //
//        Main Dialogue Hub            //
//                                     //
/////////////////////////////////////////

/* The Player will encounter this line whenever they speak with Emelina. Keep it simple. */ 
/* Expand with more questions & dialogues in version 2.0 */
IF ~Global("BFSEmelinaIntro", "GLOBAL", 1)~ THEN BEGIN BFSEM.mainhub
SAY ~I'm pleased to speak with you, <CHARNAME>. I do prefer conversation over conflict.~
+ ~Global("BFSPastLife", "GLOBAL", 0)~ + ~What was your life like before?~ + BFSEM.pastlife
+ ~Global("BFSLineageKnown", "GLOBAL", 0)~ + ~I have a confession to make... I am a Bhaalspawn, a child of the Lord of Murder.~ + BFSEM.bhaalspawn
+ ~Global("BFSBregaInformed","GLOBAL",1) Global("BFSEmelinaDocksSuggestion","GLOBAL",0)~ + ~Emelina, do you know where I can start my investigation into the Cowled Wizard affairs?~ + BFSEM.investigationapproach
+ ~AreaCheck("AR1100")~ + ~We've arrived in Imnesvale. What is our next step?~ + BFSEM.imnesvaleapproach
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

IF ~~ BFSEM.pastlife
SAY ~Quiet and serene. My days began in peaceful meditation, and when the sun rose high, we would tend to the needs of the land. By nightfall we would gather around a campfire, sharing stories, laughter and drinks among friends.~
~My life was one full of contentment. I look back on with warmth.~
IF ~~ DO ~SetGlobal("BFSPastLife","GLOBAL",1)~ EXIT
END

IF ~~ BFSEM.imnesvaleapproach
SAY ~What I'm about to suggest may sound unusual. But I ask that you escort me to a river and lower me into its waters.~
IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("BFSImn")~ EXIT
END

IF ~~ BFSEM.investigationapproach
SAY ~In my current form I perceive only vague impressions. But I recall the sound of waves breaking against stone. Wood creaking under its own weight, carried across a vast body of water. Perhaps we seek a harbour of sorts?~
++ ~We'll start searching around the docks then.~ + BFSEM.docksmentioned
END

IF ~~ BFSEM.docksmentioned
SAY ~I'll be here if you need me.~ 
= ~Not that I can leave regardless. But it's the thought that counts, right?~
IF ~~ DO ~SetGlobal("BFSEmelinaDocksSuggestion","GLOBAL",1) EraseJournalEntry(@100007) AddJournalEntry(@100008, QUEST)~ EXIT
END
