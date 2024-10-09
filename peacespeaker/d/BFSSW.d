BEGIN BFSSW

// this is emelina's INTRODUCTION dialogue
IF ~Global("BFSEmelinaIntro", "GLOBAL", 0)~ THEN BEGIN BFSEM.introductory
SAY ~May I know the name of my Wielder?~
++ ~<CHARNAME>.~ + BFSEM.nameknown
END

IF ~~ BFSEM.nameknown
SAY ~Yay!~
IF ~~ EXIT
END

// this is emelina's main DIALOGUE HUB
IF ~Global("BFSEmelinaIntro", "GLOBAL", 1)~ THEN BEGIN BFSEM.mainhub
SAY ~Ah,<CHARNAME>, it brings me joy to speak with you.~
++ ~May I ask a few questions?~ + BFSEM.questionhub
++ ~I have a confession to make... I am a Bhaalspawn, a child of the Lord of Murder.~ + BFSEM.bhaalspawn
// ++ ~Emelina, do you know where I can start my investigation?~ + BFSEM.investigation
// ++ ~We've arrived in Imnesvale. What is our next step?~ + BFSEM.imnesvaleapproach
IF ~That is all for now.~ + BFSEM.convoexit
END

IF ~~ BFSEM.convoexit
SAY ~May compassion guide your hand.~
IF ~~ EXIT
END

IF ~~ BFSEM.questionhub
SAY ~Of course. I prefer conversation over conflict.~
++ ~~ + 
END

// IF ~~ BFSEM.investigation
// SAY ~In my current form I perceive only vague impressions. But I recall the sound of waves breaking against stone. Wood creaking under its own weight, carried across a vast body of water. Perhaps we seek a harbour of sorts?~
// ++ ~We’ll start searching around the docks then.~ + 
// END
