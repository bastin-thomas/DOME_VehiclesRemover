---@diagnostic disable: undefined-global
require 'NPCs/ZombiesZoneDefinition'
require 'DomeRemoverUtils'

--Put Local all used functions
local RemoveZombies = DomeRemoverUtils.OptimizedRemoveZombies;


ZombiesZoneDefinition = ZombiesZoneDefinition or {}

if isDebugEnabled and isDebugEnabled() then
    print("Before DOME Zombie Spawn Removal")
    PrintZombieDistribution()
end

-- *********************************************
--
-- MONMOUTH REMOVAL LISTS:
--
-- *********************************************

    -- Removes all MonMouth custom zones
ZombiesZoneDefinition.DeadApesClub = nil;
ZombiesZoneDefinition.Moobys = nil;
ZombiesZoneDefinition.LobsterZeds = nil;
ZombiesZoneDefinition.FlappyFraz = nil;
ZombiesZoneDefinition.SilentBob = nil;
ZombiesZoneDefinition.KevinSmithJay = nil;
ZombiesZoneDefinition.LaFours = nil;
ZombiesZoneDefinition.JennyShakes_Zombie = nil;
ZombiesZoneDefinition.Monmouth_YebManRadio = nil;
ZombiesZoneDefinition.RandalGraves = nil;
ZombiesZoneDefinition.DanteHicks = nil;
ZombiesZoneDefinition.NakAttackZombie = nil;
ZombiesZoneDefinition.UnknownHost = nil;
ZombiesZoneDefinition.EliasGrover = nil;
ZombiesZoneDefinition.Art_The_Clown = nil;
ZombiesZoneDefinition.Toddy_Scam = nil;
ZombiesZoneDefinition.Amelora_Zombie = nil;
ZombiesZoneDefinition.Moobys_Zombies = nil;
ZombiesZoneDefinition.Clerks_Zombies = nil;
ZombiesZoneDefinition.ICU_Zombies = nil;
ZombiesZoneDefinition.SpikesPoP_Zombies = nil;

-- Removes all MonMouth Zombies that have been added to default.
local MonMouthDefaultRemovalList = {
    Monmouth_JennyShakes_Zombie = true,
    Monmouth_HelloKittenZombie = true,
    Monmouth_Amelora_Zombie = true,
    Monmouth_YebManRadio = true,
    Monmouth_NakAttack = true,
    Monmouth_UnknownHost = true,
    Monmouth_Spike = true,
    Monmouth_Toddy = true,
    Monmouth_Art_the_Clown = true,
}
RemoveZombies(ZombiesZoneDefinition.Default, MonMouthDefaultRemovalList);

-- Very specific case with a mixed table with value at end. should remove from spifo table wrongn data
DomeRemoverUtils.RemoveLastMixedTable(ZombiesZoneDefinition.Spiffo);


-- *********************************************
--
-- YOUR CUSTOM LISTS:
--
-- *********************************************

--- HOW TO USE:
-- Two type of modification are made by developpers; 
-- 1) Adding a new zone with new zombies
--       to Remove a custom zone from modders:
--       ZombiesZoneDefinition.youcustomzone = nil;
--
-- 2) Adding zombies to existing zones. (if a zone is already made in the file please use it for optimization purpouses)
-- to remove zombies from existing zones (vanilla, or if you don't want to remove all of themm):
-- local MyRemovalList = {
--     MyZombieType1 = nil,
--     MyZombieType2 = nil,
-- }
-- ZombiesZoneDefinition.nameOfTable = OptimizedRemove(ZombiesZoneDefinition.nameOfTable, MyRemovalList);


if isDebugEnabled and isDebugEnabled() then
    print("After DOME Zombie Spawn Removal")
    PrintZombieDistribution()
end