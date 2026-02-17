require 'Definitions/AttachedWeaponDefinitions'
require 'DomeRemoverUtils'


local tmpDef;
local removalList;

if isDebugEnabled and isDebugEnabled() then
    print("Before DOME Zombie Item Spawn Distribution Removal")
    PrintZombieItemsDistribution()
end


-- ****************************************************
--
-- MONMOUTH REMOVAL LISTS:
--
-- ****************************************************

-- Removing new AttachedWeaponDefinitions
AttachedWeaponDefinitions.HuntingKnife_DeadApe = nil;
AttachedWeaponDefinitions.SawnoffShotgun_DeadApe = nil;
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Monmouth_MonmouthDeadApeBiker = nil;
AttachedWeaponDefinitions.Pen_FlappyFraz = nil;
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Monmouth_FlappyFraz = nil;
AttachedWeaponDefinitions.Crowbarski_JennyShakes = nil;
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Monmouth_JennyShakes_Zombie = nil;
AttachedWeaponDefinitions.Acoustic_Nak = nil;
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Monmouth_NakAttack = nil;
AttachedWeaponDefinitions.RepurposedAxe_Unknown = nil;
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Monmouth_UnknownHost = nil;
AttachedWeaponDefinitions.Kukri_Spike = nil;
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Monmouth_Spike = nil
AttachedWeaponDefinitions.Toddy_Hammer_Hand = nil;
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Monmouth_Toddy = nil;

-- Removing new weapons from already created AttachedWeaponDefinitions
removalList = {
    ["MonmouthWeapons.KukriMachete"] = true,
}

tmpDef = AttachedWeaponDefinitions["meatCleaverBack"]
if tmpDef then
    DomeRemoverUtils.RemoveMultipleFromArray(tmpDef.weapons, removalList)
end

tmpDef = AttachedWeaponDefinitions["MacheteShoulder"]
if tmpDef then
    DomeRemoverUtils.RemoveMultipleFromArray(tmpDef.weapons, removalList)
end

tmpDef = AttachedWeaponDefinitions["bladeInBack"]
if tmpDef then
    DomeRemoverUtils.RemoveMultipleFromArray(tmpDef.weapons, removalList)
end

tmpDef = AttachedWeaponDefinitions["macheteInBack"]
if tmpDef then
    DomeRemoverUtils.RemoveMultipleFromArray(tmpDef.weapons, removalList)
end




-- *********************************************
--
-- YOUR CUSTOM LISTS:
--
-- *********************************************

--- HOW TO USE:
-- Two type of modification are made by developpers; 
-- 1) Adding a new AttachedWeaponDefinitions with new weapons
--       to Remove a custom AttachedWeaponDefinitions from modders:
--          AttachedWeaponDefinitions.Kukri_Spike = nil;
--          AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Monmouth_Spike = nil;
--
-- 2) Adding zombies to existing zones.
-- to remove zombies from existing zones (vanilla, or if you don't want to remove all of them):
--
-- removalList = {
--     ["Base.YourWeapon"] = nil,
-- }
--
-- tmpDef = AttachedWeaponDefinitions["yourAlreadyCreateddefinition"]
-- if tmpDef then
--     DomeRemoverUtils.RemoveMultipleFromArray(tmpDef.weapons, removalList)
-- end






if isDebugEnabled and isDebugEnabled() then
    print("After DOME Zombie Item Spawn Distribution Removal")
    PrintZombieItemsDistribution()
end