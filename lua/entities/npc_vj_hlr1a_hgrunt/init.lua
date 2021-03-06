AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hla/hgrunt.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.HasGrenadeAttack = false
ENT.MoveRandomlyWhenShooting = true -- Should it move randomly when shooting?
ENT.WeaponAttackSecondaryTimeUntilFire = 1.2

	-- ====== Controller Variables ====== --
ENT.Controller_FirstPersonBone = "unnamed022"
ENT.Controller_FirstPersonOffset = Vector(2,0,3)
ENT.Controller_FirstPersonAngle = Angle(90,0,90)

-- Custom
ENT.AHGR_NextStrafeT = 0
ENT.AHGR_NextRunT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HECU_CustomOnInitialize()
	local randomskin = math.random(0,3)
	if randomskin == 1 then
		self:SetSkin(1)
	elseif randomskin == 2 then
		self:SetSkin(2)
	elseif randomskin == 3 then
		self:SetBodygroup(0,1)
	end
	self.SoundTbl_Idle = {"vj_hlr/hla_npc/hgrunt/gr_idle1.wav","vj_hlr/hla_npc/hgrunt/gr_idle2.wav","vj_hlr/hla_npc/hgrunt/gr_idle3.wav","vj_hlr/hla_npc/hgrunt/gr_radio1.wav","vj_hlr/hla_npc/hgrunt/gr_radio2.wav","vj_hlr/hla_npc/hgrunt/gr_radio3.wav","vj_hlr/hla_npc/hgrunt/gr_radio4.wav","vj_hlr/hla_npc/hgrunt/gr_radio5.wav","vj_hlr/hla_npc/hgrunt/gr_radio6.wav"}
	self.SoundTbl_CombatIdle = {"vj_hlr/hla_npc/hgrunt/gr_radio1.wav","vj_hlr/hla_npc/hgrunt/gr_radio2.wav","vj_hlr/hla_npc/hgrunt/gr_radio3.wav","vj_hlr/hla_npc/hgrunt/gr_radio4.wav","vj_hlr/hla_npc/hgrunt/gr_radio5.wav","vj_hlr/hla_npc/hgrunt/gr_radio6.wav"}
	self.SoundTbl_Alert = {"vj_hlr/hla_npc/hgrunt/gr_alert1.wav"}
	self.SoundTbl_WeaponReload = {"vj_hlr/hla_npc/hgrunt/gr_cover2.wav"}
	self.AHGR_NextStrafeT = CurTime() + 4
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMoveRandomlyWhenShooting()
	self:VJ_ACT_PLAYACTIVITY({ACT_STRAFE_RIGHT,ACT_STRAFE_LEFT},true,false,false)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/