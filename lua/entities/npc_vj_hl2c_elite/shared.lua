ENT.Base 			= "npc_vj_hl2c_soldier"
ENT.Type 			= "ai"
ENT.PrintName 		= "Overwatch Elite"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Half-Life"

if (CLIENT) then
local Name = "Overwatch Elite"
local LangName = "npc_vj_hl2c_elite"
language.Add(LangName, Name)
killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
language.Add("#"..LangName, Name)
killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end