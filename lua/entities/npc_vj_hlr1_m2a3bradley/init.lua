AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl1/apc_body.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want 
ENT.StartHealth = 500
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"} -- NPCs with the same class with be allied to each other\
ENT.DeathCorpseModel = {"models/vj_hlr/hl1/apc_body_destroyed.mdl"} -- The corpse model that it will spawn when it dies | Leave empty to use the NPC's model | Put as many models as desired, the base will pick a random one.

ENT.SoundTbl_Breath = {"vj_hlr/hl1_npc/tanks/bradley_idle.wav"}
ENT.SoundTbl_Idle = {"vj_hlr/hl1_npc/hgrunt/gr_idle1.wav","vj_hlr/hl1_npc/hgrunt/gr_idle2.wav","vj_hlr/hl1_npc/hgrunt/gr_idle3.wav"}
ENT.SoundTbl_CombatIdle = {"vj_hlr/hl1_npc/hgrunt/gr_taunt1.wav","vj_hlr/hl1_npc/hgrunt/gr_taunt2.wav","vj_hlr/hl1_npc/hgrunt/gr_taunt3.wav","vj_hlr/hl1_npc/hgrunt/gr_taunt4.wav","vj_hlr/hl1_npc/hgrunt/gr_taunt5.wav","vj_hlr/hl1_npc/hgrunt/gr_combat1.wav","vj_hlr/hl1_npc/hgrunt/gr_combat2.wav","vj_hlr/hl1_npc/hgrunt/gr_combat3.wav","vj_hlr/hl1_npc/hgrunt/gr_combat4.wav"}
ENT.SoundTbl_OnReceiveOrder = {"vj_hlr/hl1_npc/hgrunt/gr_answer1.wav","vj_hlr/hl1_npc/hgrunt/gr_answer2.wav","vj_hlr/hl1_npc/hgrunt/gr_answer3.wav","vj_hlr/hl1_npc/hgrunt/gr_answer5.wav","vj_hlr/hl1_npc/hgrunt/gr_answer7.wav"}
ENT.SoundTbl_Investigate = {"vj_hlr/hl1_npc/hgrunt/gr_investigate.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hl1_npc/hgrunt/gr_alert1.wav","vj_hlr/hl1_npc/hgrunt/gr_alert2.wav","vj_hlr/hl1_npc/hgrunt/gr_alert3.wav","vj_hlr/hl1_npc/hgrunt/gr_alert4.wav","vj_hlr/hl1_npc/hgrunt/gr_alert5.wav","vj_hlr/hl1_npc/hgrunt/gr_alert6.wav","vj_hlr/hl1_npc/hgrunt/gr_alert7.wav","vj_hlr/hl1_npc/hgrunt/gr_alert8.wav","vj_hlr/hl1_npc/hgrunt/gr_alert9.wav","vj_hlr/hl1_npc/hgrunt/gr_alert10.wav"}
ENT.SoundTbl_CallForHelp = {"vj_hlr/hl1_npc/hgrunt/gr_taunt6.wav","vj_hlr/hl1_npc/hgrunt/gr_cover2.wav","vj_hlr/hl1_npc/hgrunt/gr_cover3.wav","vj_hlr/hl1_npc/hgrunt/gr_cover4.wav","vj_hlr/hl1_npc/hgrunt/gr_cover7.wav"}
ENT.SoundTbl_OnGrenadeSight = {"vj_hlr/hl1_npc/hgrunt/gr_cover7.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert1.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert2.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert3.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert4.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert5.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert6.wav","vj_hlr/hl1_npc/hgrunt/gr_cover1.wav"}
ENT.SoundTbl_AllyDeath = {"vj_hlr/hl1_npc/hgrunt/gr_allydeath.wav","vj_hlr/hl1_npc/hgrunt/gr_cover2.wav","vj_hlr/hl1_npc/hgrunt/gr_cover3.wav","vj_hlr/hl1_npc/hgrunt/gr_cover4.wav","vj_hlr/hl1_npc/hgrunt/gr_cover7.wav"}

-- Tank Base
ENT.Tank_SoundTbl_DrivingEngine = {"vj_hlr/hl1_npc/tanks/tankdrive.wav"}
ENT.Tank_SoundTbl_Track = {}

ENT.Tank_GunnerENT = "npc_vj_hlr1_m2a3bradley_gun"
ENT.Tank_SpawningAngle = 0
ENT.Tank_AngleDiffuseNumber = 0
ENT.Tank_MoveAwaySpeed = 70 -- Move away speed
ENT.Tank_CollisionBoundSize = 90
ENT.Tank_CollisionBoundUp = 130
ENT.Tank_DeathSoldierModels = {"models/vj_hlr/hl1/hgrunt.mdl"}
ENT.Tank_DeathDecal = {"VJ_HLR_Scorch"} -- The decal that it places on the ground when it dies

util.AddNetworkString("vj_hlr1_m2a3bradley_moveeffects")
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_GunnerSpawnPosition()
	return self:GetPos() + self:GetRight()*16 + self:GetForward()*-8 + self:GetUp()*100
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StartMoveEffects()
	net.Start("vj_hlr1_m2a3bradley_moveeffects")
	net.WriteEntity(self)
	net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetNearDeathSparkPositions()
	local randpos = math.random(1,5)
	if randpos == 1 then
		self.Spark1:SetLocalPos(self:GetPos() + self:GetRight()*15 + self:GetForward()*-16 + self:GetUp()*120)
	elseif randpos == 2 then
		self.Spark1:SetLocalPos(self:GetPos() + self:GetRight()*42 + self:GetForward()*123 + self:GetUp()*50)
	elseif randpos == 3 then
		self.Spark1:SetLocalPos(self:GetPos() + self:GetRight()*-42 + self:GetForward()*123 + self:GetUp()*50)
	elseif randpos == 4 then
		self.Spark1:SetLocalPos(self:GetPos() + self:GetRight()*60 + self:GetForward()*-40 + self:GetUp()*81)
	elseif randpos == 5 then
		self.Spark1:SetLocalPos(self:GetPos() + self:GetRight()*-60 + self:GetForward()*-40 + self:GetUp()*81)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_CustomOnPriorToKilled(dmginfo,hitgroup)
	for i=0,1,0.5 do
		timer.Simple(i,function()
			if IsValid(self) then
				VJ_EmitSound(self,{"vj_hlr/hl1_weapon/explosion/explode3.wav","vj_hlr/hl1_weapon/explosion/explode4.wav","vj_hlr/hl1_weapon/explosion/explode5.wav"},100)
				util.BlastDamage(self,self,self:GetPos(),200,40)
				util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
				
				spr = ents.Create("env_sprite")
				spr:SetKeyValue("model","vj_hl/sprites/zerogxplode.vmt")
				spr:SetKeyValue("GlowProxySize","2.0")
				spr:SetKeyValue("HDRColorScale","1.0")
				spr:SetKeyValue("renderfx","14")
				spr:SetKeyValue("rendermode","5")
				spr:SetKeyValue("renderamt","255")
				spr:SetKeyValue("disablereceiveshadows","0")
				spr:SetKeyValue("mindxlevel","0")
				spr:SetKeyValue("maxdxlevel","0")
				spr:SetKeyValue("framerate","15.0")
				spr:SetKeyValue("spawnflags","0")
				spr:SetKeyValue("scale","4")
				spr:SetPos(self:GetPos() + Vector(0,0,150))
				spr:Spawn()
				spr:Fire("Kill","",0.9)
				timer.Simple(0.9,function() if IsValid(spr) then spr:Remove() end end)
			end
		end)
	end
	
	timer.Simple(1.5,function()
		if IsValid(self) then
			VJ_EmitSound(self,{"vj_hlr/hl1_weapon/explosion/explode3.wav","vj_hlr/hl1_weapon/explosion/explode4.wav","vj_hlr/hl1_weapon/explosion/explode5.wav"},100)
			util.BlastDamage(self,self,self:GetPos(),200,40)
			util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
			
			spr = ents.Create("env_sprite")
			spr:SetKeyValue("model","vj_hl/sprites/zerogxplode.vmt")
			spr:SetKeyValue("GlowProxySize","2.0")
			spr:SetKeyValue("HDRColorScale","1.0")
			spr:SetKeyValue("renderfx","14")
			spr:SetKeyValue("rendermode","5")
			spr:SetKeyValue("renderamt","255")
			spr:SetKeyValue("disablereceiveshadows","0")
			spr:SetKeyValue("mindxlevel","0")
			spr:SetKeyValue("maxdxlevel","0")
			spr:SetKeyValue("framerate","15.0")
			spr:SetKeyValue("spawnflags","0")
			spr:SetKeyValue("scale","4")
			spr:SetPos(self:GetPos() + Vector(0,0,150))
			spr:Spawn()
			spr:Fire("Kill","",0.9)
			timer.Simple(0.9,function() if IsValid(spr) then spr:Remove() end end)
		end
	end)
	
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_CustomOnDeath_AfterCorpseSpawned_Effects(dmginfo,hitgroup,GetCorpse)
	spr = ents.Create("env_sprite")
	spr:SetKeyValue("model","vj_hl/sprites/zerogxplode.vmt")
	spr:SetKeyValue("GlowProxySize","2.0")
	spr:SetKeyValue("HDRColorScale","1.0")
	spr:SetKeyValue("renderfx","14")
	spr:SetKeyValue("rendermode","5")
	spr:SetKeyValue("renderamt","255")
	spr:SetKeyValue("disablereceiveshadows","0")
	spr:SetKeyValue("mindxlevel","0")
	spr:SetKeyValue("maxdxlevel","0")
	spr:SetKeyValue("framerate","15.0")
	spr:SetKeyValue("spawnflags","0")
	spr:SetKeyValue("scale","4")
	spr:SetPos(self:GetPos() + Vector(0,0,150))
	spr:Spawn()
	spr:Fire("Kill","",0.9)
	timer.Simple(0.9,function() if IsValid(spr) then spr:Remove() end end)
	
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/