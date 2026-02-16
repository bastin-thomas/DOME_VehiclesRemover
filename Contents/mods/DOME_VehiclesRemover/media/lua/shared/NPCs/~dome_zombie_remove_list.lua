---@diagnostic disable: undefined-global
require 'NPCs/ZombiesZoneDefinition'
require 'DomeRemoverUtils'

--Put Global the functions (shortcuts)
PrintZombieDistribution = DomeRemoverUtils.PrintZombieDistribution;
--Put Local all used functions
local RemoveZombies = DomeRemoverUtils.OptimizedRemoveZombies;


ZombiesZoneDefinition = ZombiesZoneDefinition or {}

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
    Monmouth_JennyShakes_Zombie = nil,
    Monmouth_HelloKittenZombie = nil,
    Monmouth_Amelora_Zombie = nil,
    Monmouth_YebManRadio = nil,
    Monmouth_NakAttack = nil,
    Monmouth_UnknownHost = nil,
    Monmouth_Spike = nil,
    Monmouth_Toddy = nil,
    Monmouth_Art_the_Clown = nil,
}
ZombiesZoneDefinition.Default = RemoveZombies(ZombiesZoneDefinition.Default, MonMouthDefaultRemovalList);

-- Removes all MonMouth Zombies that have been added to spiffo.
local MonMouthSpiffoRemovalList = {
    Monmouth_Art_the_Clown = nil,
}
ZombiesZoneDefinition.Spiffo = RemoveZombies(ZombiesZoneDefinition.Spiffo, MonMouthSpiffoRemovalList);





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
-- 2) Adding zombies to existing zones.
-- to remove zombies from existing zones (vanilla, or if you don't want to remove all of themm):
-- local MyRemovalList = {
--     "MyZombieName1",
--     "MyZombieName2",
--     "MyZombieName3",
--     "MyZombieName4",
-- }
-- ZombiesZoneDefinition.nameOfTable = OptimizedRemove(ZombiesZoneDefinition.nameOfTable, MyRemovalList);
