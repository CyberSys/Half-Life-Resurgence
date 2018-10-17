AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/opfor/hgrunt.mdl","models/vj_hlr/opfor/hgrunt_medic.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
// models/vj_hlr/opfor/hgrunt.mdl
// models/vj_hlr/opfor/hgrunt_medic.mdl

	-- ====== Sounds ====== --
ENT.SoundTbl_Idle = {"vj_hlr/hl1_npc/fgrunt/guard.wav","vj_hlr/hl1_npc/fgrunt/mission.wav","vj_hlr/hl1_npc/fgrunt/babysitting.wav","vj_hlr/hl1_npc/fgrunt/coverup.wav","vj_hlr/hl1_npc/fgrunt/now.wav","vj_hlr/hl1_npc/fgrunt/seensquad.wav","vj_hlr/hl1_npc/fgrunt/short.wav","vj_hlr/hl1_npc/fgrunt/outof.wav", "vj_hlr/hl1_npc/fgrunt/lost.wav", "vj_hlr/hl1_npc/fgrunt/fubar.wav","vj_hlr/hl1_npc/fgrunt/dogs.wav","vj_hlr/hl1_npc/fgrunt/disney.wav","vj_hlr/hl1_npc/fgrunt/checkrecon.wav" }
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_OnReceiveOrder = {}
ENT.SoundTbl_MedicBeforeHeal = {}
ENT.SoundTbl_MedicAfterHeal = {}
ENT.SoundTbl_MedicReceiveHeal = {}
ENT.SoundTbl_OnPlayerSight = {}
ENT.SoundTbl_Alert = {}
ENT.SoundTbl_CallForHelp = {}
ENT.SoundTbl_GrenadeAttack = {}
ENT.SoundTbl_OnGrenadeSight = {"vj_hlr/hl1_npc/fgrunt/incoming.wav", "vj_hlr/hl1_npc/fgrunt/grenade.wav"}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_Death = {}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HECU_CustomOnInitialize()
	if self.HECU_Type == 1 then
		self:SetBodygroup(1,math.random(0,7))
		
		local randwep = math.random(1,4)
		if randwep == 1 or randwep == 2 then
			self:SetBodygroup(3,0)
		elseif randwep == 3 then
			self:SetBodygroup(3,1)
		elseif randwep == 4 then
			self:SetBodygroup(3,2)
		end
		
		-- Marminen hamar
		if self:GetBodygroup(3) == 0 then
			self:SetBodygroup(2,0) -- Barz zenk
		elseif self:GetBodygroup(3) == 1 then
			self:SetBodygroup(2,3) -- bonebakshen
		elseif self:GetBodygroup(3) == 2 then
			self:SetBodygroup(2,1) -- Medz reshesh
		end
	elseif self.HECU_Type == 2 then
		-- Medic bodygroup starts from 2
		self:SetBodygroup(2,math.random(0,1))
		
		self:SetBodygroup(3,math.random(0,1))
		
		self.IsMedicSNPC = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo,hitgroup)
	if self.HECU_Type == 1 then
		self:SetBodygroup(self.HECU_WepBG,3)
	elseif self.HECU_Type == 2 then
		self:SetBodygroup(self.HECU_WepBG,3)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/