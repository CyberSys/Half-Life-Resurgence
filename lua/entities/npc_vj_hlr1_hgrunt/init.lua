AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl1/hgrunt.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 90
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.CustomBlood_Decal = {"VJ_Blood_HL1_Red"} -- Decals to spawn when it's damaged
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"} -- NPCs with the same class with be allied to each other
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackDamage = 10
ENT.TimeUntilMeleeAttackDamage = false -- This counted in seconds | This calculates the time until it hits something

ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.GrenadeAttackModel = "models/vj_hlr/weapons/w_grenade.mdl" -- The model for the grenade entity
ENT.AnimTbl_GrenadeAttack = {ACT_SPECIAL_ATTACK2} -- Grenade Attack Animations
ENT.GrenadeAttackAttachment = "lhand" -- The attachment that the grenade will spawn at
ENT.TimeUntilGrenadeIsReleased = 1.3 -- Time until the grenade is released

ENT.AnimTbl_Medic_GiveHealth = {ACT_SPECIAL_ATTACK2} -- Animations is plays when giving health to an ally
ENT.Medic_SpawnPropOnHeal = false -- Should it spawn a prop, such as small health vial at a attachment when healing an ally?
ENT.Weapon_NoSpawnMenu = true -- If set to true, the NPC weapon setting in the spawnmenu will not be applied for this SNPC
ENT.DisableWeaponFiringGesture = true -- If set to true, it will disable the weapon firing gestures
ENT.MoveRandomlyWhenShooting = false -- Should it move randomly when shooting?
//ENT.PoseParameterLooking_InvertPitch = true -- Inverts the pitch poseparameters (X)
//ENT.PoseParameterLooking_Names = {pitch={"XR"},yaw={},roll={"ZR"}} -- Custom pose parameters to use, can put as many as needed
ENT.AnimTbl_ShootWhileMovingRun = {ACT_SPRINT} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_SPRINT} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.CallForBackUpOnDamageAnimation = {ACT_SIGNAL3} -- Animation used if the SNPC does the CallForBackUpOnDamage function
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.AnimTbl_CallForHelp = {ACT_SIGNAL1} -- Call For Help Animations
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIE_GUTSHOT,ACT_DIE_HEADSHOT,ACT_DIESIMPLE} -- Death Animations
ENT.DeathAnimationTime = 0.8 -- Time until the SNPC spawns its corpse and gets removed
ENT.AnimTbl_TakingCover = {ACT_CROUCHIDLE} -- The animation it plays when hiding in a covered position, leave empty to let the base decide
ENT.AnimTbl_AlertFriendsOnDeath = {"vjseq_idle2"} -- Animations it plays when an ally dies that also has AlertFriendsOnDeath set to true
ENT.DropWeaponOnDeathAttachment = "rhand" -- Which attachment should it use for the weapon's position
	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} -- If it uses normal based animation, use this
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_hlr/pl_step1.wav","vj_hlr/pl_step2.wav","vj_hlr/pl_step3.wav","vj_hlr/pl_step4.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl1_npc/hgrunt/gr_die1.wav","vj_hlr/hl1_npc/hgrunt/gr_die2.wav","vj_hlr/hl1_npc/hgrunt/gr_die3.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hl1_npc/hgrunt/gr_pain1.wav","vj_hlr/hl1_npc/hgrunt/gr_pain2.wav","vj_hlr/hl1_npc/hgrunt/gr_pain3.wav","vj_hlr/hl1_npc/hgrunt/gr_pain4.wav","vj_hlr/hl1_npc/hgrunt/gr_pain5.wav",}

-- Custom
ENT.HECU_Type = 0
	-- 0 = HL1 Grunt
	-- 1 = OppF Grunt
	-- 2 = OppF Medic
	-- 3 = OppF Engineer
ENT.HECU_WepBG = 2 -- The bodygroup that the weapons are in (Ourish e amen modelneroun)
ENT.HECU_LastBodyGroup = 99
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HECU_CustomOnInitialize()
	self:SetSkin(math.random(0,1))
	
	local randhead = math.random(0,3)
	self:SetBodygroup(1,randhead)
	if randhead == 1 then
		self:SetSkin(0) -- Jermag
	elseif randhead == 3 then
		self:SetSkin(1) -- Sev
	end
	
	local randwep = math.random(1,3)
	if randwep == 1 or randwep == 2 then
		self:SetBodygroup(2,0)
	elseif randwep == 3 then
		self:SetBodygroup(2,1)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))
	
	if self:GetModel() == "models/vj_hlr/hl1/hgrunt.mdl" then // Already the default
		self.HECU_Type = 0
		self.HECU_WepBG = 2
	elseif self:GetModel() == "models/vj_hlr/opfor/hgrunt.mdl" then
		self.HECU_Type = 1
		self.HECU_WepBG = 3
	elseif self:GetModel() == "models/vj_hlr/opfor/hgrunt_medic.mdl" then
		self.HECU_Type = 2
		self.HECU_WepBG = 3
	elseif self:GetModel() == "models/vj_hlr/opfor/hgrunt_engineer.mdl" then
		self.HECU_Type = 3
		self.HECU_WepBG = 1
	end
	
	self:HECU_CustomOnInitialize()
	
	//self:Give("weapon_vj_hl_hgruntwep")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	//print(key)
	if key == "event_emit step" then
		self:FootStepSoundCode()
	end
	if key == "event_mattack" then
		self:MeleeAttackCode()
	end
	if key == "event_rattack mp5_fire" or key == "event_rattack shotgun_fire" or key == "event_rattack saw_fire" or key == "event_rattack pistol_fire" then
		local wep = self:GetActiveWeapon()
		if IsValid(wep) then
			wep:NPCShoot_Primary(ShootPos,ShootDir)
		end
	end
	
	-- OppF Engineer
	if key == "deagle_putout" then
		self:SetBodygroup(1,2)
	end
	if key == "torch_pull" then
		self:SetBodygroup(1,1)
	end
	if key == "torchlight_on" then
		ParticleEffectAttach("vj_hl_torch", PATTACH_POINT_FOLLOW, self, 5)
		VJ_EmitSound(self,"vj_hlr/hl1_npc/hgrunt_oppf/torch_light.wav",80)
	end
	if key == "torch_putout" then
		self:StopParticles()
		self:SetBodygroup(1,2)
	end
	if key == "deagle_pull" then
		self:SetBodygroup(1,0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	-- Veravorvadz kalel
	if self:Health() <= (self:GetMaxHealth() / 2.2) then
		self.AnimTbl_Walk = {ACT_WALK_HURT}
		self.AnimTbl_Run = {ACT_RUN_HURT}
		self.AnimTbl_ShootWhileMovingWalk = {ACT_WALK_HURT}
		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_HURT}
	else
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_RUN}
		self.AnimTbl_ShootWhileMovingWalk = {ACT_WALK}
		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN}
	end
	
	local bgroup = self:GetBodygroup(self.HECU_WepBG)
	if self.HGrunt_LastBodyGroup != bgroup then
		self.HGrunt_LastBodyGroup = bgroup
		if self.HECU_Type == 0 then
			if bgroup == 0 then -- MP5
				self:DoChangeWeapon("weapon_vj_hlr1_mp5")
				self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_SMG1}
				self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_SMG1_LOW}
				self.Weapon_StartingAmmoAmount = 50
			elseif bgroup == 1 then -- Shotgun
				self:DoChangeWeapon("weapon_vj_hlr1_spas12")
				self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_SHOTGUN}
				self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_SHOTGUN_LOW}
				self.Weapon_StartingAmmoAmount = 8
			end
		elseif self.HECU_Type == 1 then
			if bgroup == 0 then -- MP5
				self:DoChangeWeapon("weapon_vj_hlr1_mp5")
				self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_SMG1}
				self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_SMG1_LOW}
				self.Weapon_StartingAmmoAmount = 50
			elseif bgroup == 1 then -- Shotgun
				self:DoChangeWeapon("weapon_vj_hlr1_spas12")
				self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_SHOTGUN}
				self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_SHOTGUN_LOW}
				self.Weapon_StartingAmmoAmount = 8
			elseif bgroup == 2 then -- SAW
				self:DoChangeWeapon("weapon_vj_hlrof_m249")
				self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_AR2}
				self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_AR2_LOW}
				self.Weapon_StartingAmmoAmount = 50
			end
		elseif self.HECU_Type == 2 then
			if bgroup == 0 then -- Desert Eagle
				self:DoChangeWeapon("weapon_vj_hlrof_desert_eagle")
				self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_PISTOL}
				self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_PISTOL_LOW}
				self.Weapon_StartingAmmoAmount = 7
			elseif bgroup == 1 then -- Glock 17
				self:DoChangeWeapon("weapon_vj_hlr1_glock17")
				self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_PISTOL}
				self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_PISTOL_LOW}
				self.Weapon_StartingAmmoAmount = 17
			end
		elseif self.HECU_Type == 3 then
			if bgroup == 0 then -- Desert Eagle
				self:DoChangeWeapon("weapon_vj_hlrof_desert_eagle")
				self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_PISTOL}
				self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_PISTOL_LOW}
				self.Weapon_StartingAmmoAmount = 7
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnGrenadeAttack_OnThrow(GrenadeEntity)
	GrenadeEntity.SoundTbl_OnCollide = {"vj_hlr/hl1_weapon/grenade/grenade_hit1.wav","vj_hlr/hl1_weapon/grenade/grenade_hit2.wav","vj_hlr/hl1_weapon/grenade/grenade_hit3.wav"}
	GrenadeEntity.SoundTbl_OnRemove = {"vj_hlr/hl1_weapon/explosion/explode3.wav","vj_hlr/hl1_weapon/explosion/explode4.wav","vj_hlr/hl1_weapon/explosion/explode5.wav"}
	GrenadeEntity.OnRemoveSoundLevel = 100
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if self.HECU_GasTankHit == true then
		util.BlastDamage(self,self,self:GetPos(),100,80)
		util.ScreenShake(self:GetPos(),100,200,1,500)
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos()+Vector(0,0,32))
		util.Effect("Explosion",effectdata)
		util.Effect("HelicopterMegaBomb",effectdata)
		//ParticleEffect("vj_explosion2",self:GetPos(),Angle(0,0,0),nil)
	end
	if self.HECU_Type == 0 && hitgroup == HITGROUP_HEAD then
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_skull.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,60))})
		self.HasDeathAnimation = false
		return true,{DeathAnim=false,AllowCorpse=true}
	else
		if self.HasGibDeathParticles == true then
			local bloodeffect = EffectData()
			bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
			bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
			bloodeffect:SetScale(120)
			util.Effect("VJ_Blood1",bloodeffect)
			
			local bloodspray = EffectData()
			bloodspray:SetOrigin(self:GetPos())
			bloodspray:SetScale(8)
			bloodspray:SetFlags(3)
			bloodspray:SetColor(0)
			util.Effect("bloodspray",bloodspray)
			util.Effect("bloodspray",bloodspray)
		end
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh1.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh2.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh3.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh4.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_bone.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,50))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_gib.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_guts.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_hmeat.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_lung.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_skull.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,60))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_legbone.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/gib_hgrunt.mdl",{BloodDecal="VJ_Blood_HL1_Red",Pos=self:LocalToWorld(Vector(0,0,15))})
		return true
	end
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo,hitgroup)
	if self.HECU_Type == 0 && hitgroup == HITGROUP_HEAD then
		VJ_EmitSound(self,{"vj_hlr/fx/headshot1.wav","vj_hlr/fx/headshot2.wav","vj_hlr/fx/headshot3.wav"},75,math.random(100,100))
	else
		VJ_EmitSound(self,"vj_gib/default_gib_splat.wav",90,math.random(100,100))
	end
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
	-- Regular Human Grunt head gib
	if self.HECU_Type == 0 && hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
		self:SetBodygroup(1,4)
		self.GibOnDeathDamagesTable = {"All"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo,hitgroup)
	if self.HECU_Type == 0 or self.HECU_Type == 3 then
		self:SetBodygroup(self.HECU_WepBG,2)
	elseif self.HECU_Type == 1 or self.HECU_Type == 2 then
		self:SetBodygroup(self.HECU_WepBG,3)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDropWeapon_AfterWeaponSpawned(dmginfo,hitgroup,GetWeapon)
	GetWeapon.WorldModel_Invisible = false
	GetWeapon:SetNWBool("VJ_WorldModel_Invisible",false)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/