AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl1/headcrab.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 10
ENT.HullType = HULL_TINY
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.CustomBlood_Decal = {"VJ_Blood_HL1_Yellow"} -- Decals to spawn when it's damaged
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"} -- NPCs with the same class with be allied to each other
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.LeapAttackDamage = 10
ENT.AnimTbl_LeapAttack = {ACT_RANGE_ATTACK1} -- Melee Attack Animations
ENT.LeapDistance = 230 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapToMeleeDistance = 1 -- How close does it have to be until it uses melee?
ENT.LeapAttackDamageDistance = 50 -- How far does the damage go?
ENT.TimeUntilLeapAttackDamage = 0.4 -- How much time until it runs the leap damage code?
ENT.TimeUntilLeapAttackVelocity = 0.4 -- How much time until it runs the velocity code?
ENT.NextAnyAttackTime_Leap = 3 -- How much time until it can use any attack again? | Counted in Seconds
ENT.LeapAttackExtraTimers = {0.6,0.8,1} -- Extra leap attack timers | it will run the damage code after the given amount of seconds
ENT.StopLeapAttackAfterFirstHit = true -- Should it stop the leap attack from running rest of timers when it hits an enemy?
ENT.LeapAttackVelocityForward = 50 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 250 -- How much upward force should it apply?
ENT.LeapAttackVelocityRight = 0 -- How much right force should it apply?

ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIESIMPLE} -- Death Animations
//ENT.DeathAnimationTime = 0.6 -- Time until the SNPC spawns its corpse and gets removed

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {"vj_hlr/hl1_npc/headcrab/hc_idle1.wav","vj_hlr/hl1_npc/headcrab/hc_idle2.wav","vj_hlr/hl1_npc/headcrab/hc_idle3.wav","vj_hlr/hl1_npc/headcrab/hc_idle4.wav","vj_hlr/hl1_npc/headcrab/hc_idle5.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hl1_npc/headcrab/hc_alert1.wav","vj_hlr/hl1_npc/headcrab/hc_alert2.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_hlr/hl1_npc/headcrab/hc_attack1.wav","vj_hlr/hl1_npc/headcrab/hc_attack2.wav","vj_hlr/hl1_npc/headcrab/hc_attack3.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_hlr/hl1_npc/headcrab/hc_headbite.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hl1_npc/headcrab/hc_pain1.wav","vj_hlr/hl1_npc/headcrab/hc_pain2.wav","vj_hlr/hl1_npc/headcrab/hc_pain3.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl1_npc/headcrab/hc_die1.wav","vj_hlr/hl1_npc/headcrab/hc_die2.wav"}

ENT.GeneralSoundPitch1 = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
	if math.random(1,2) == 1 then
		self:VJ_ACT_PLAYACTIVITY("angry",true,false,true)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/