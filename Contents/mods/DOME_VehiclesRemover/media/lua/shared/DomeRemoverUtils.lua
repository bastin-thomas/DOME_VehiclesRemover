require 'NPCs/ZombiesZoneDefinition'
require 'Definitions/AttachedWeaponDefinitions'


DomeRemoverUtils = {};  -- This Library have been made to store Utils Functions for Master Removal Tool

-- *********************************************
--
-- Shared Utils
--
-- *********************************************

---Utils function to properly serialize a value in lua
---@param value any
---@return string
function DomeRemoverUtils.strValue(value)
    local ok, str = pcall(tostring, value)
    if ok then
        return str;
    else
        return "<unprintable value>";
    end
end;


---An Optimized Utils Function to remove one row from a table
---@param tbl table -- e.g., AttachedWeaponDefinitions["name"].weapons
---@param value any -- any value in the row thaat match to be deleted to delete
function DomeRemoverUtils.RemoveFromArray(tbl, value)
    for i = #tbl, 1, -1 do
        if tbl[i] == value then
            table.remove(tbl, i);
        end
    end
end


---An Optimized Utils Function to remove multiple rows from a table
---@param tbl table -- e.g., AttachedWeaponDefinitions["name"].weapons
---@param toRemoveSet table -- any value in the row thaat match to be deleted to delete
function DomeRemoverUtils.RemoveMultipleFromArray(tbl, toRemoveSet)
    if type(tbl) ~= "table" or type(toRemoveSet) ~= "table" then return end

    for i = #tbl, 1, -1 do
        if toRemoveSet[tbl[i]] then
            table.remove(tbl, i)
        end
    end
end



-- *********************************************
--
-- Zombies Items Utils
--
-- *********************************************

--- Print the current Zombies Distribution on the server
function PrintZombieItemsDistribution()
    DomeRemoverUtils.PrintTableRecursive(AttachedWeaponDefinitions);
end;

function DomeRemoverUtils.PrintTableRecursive(tbl, indent)
    indent = indent or 0
    local prefix = string.rep("    ", indent)

    if type(tbl) ~= "table" then
        print(prefix .. DomeRemoverUtils.strValue(tbl) .. ",")
        return
    end

    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print(prefix .. tostring(key) .. " {")
            DomeRemoverUtils.PrintTableRecursive(value, indent + 1)
            print(prefix .. "},")
        else
            print(prefix .. tostring(key) .. ": " .. DomeRemoverUtils.strValue(value) .. ",")
        end
    end
end






-- *********************************************
--
-- Zombies Utils
--
-- *********************************************


---An Optimized Utils Function to remove multiple rows from a table
---@param tbl table -- e.g., ZombiesZoneDefinition.Default
---@param namesToRemove table -- keys are zombie names, values = true
function DomeRemoverUtils.OptimizedRemoveZombies(tbl, namesToRemove)
    tbl = tbl or {};
    if namesToRemove == nil then return end
    for i, value in ipairs(tbl) do
        for nameToRemove, value2 in pairs(namesToRemove) do
            if(type(value) == "table" and tbl[i].name == nameToRemove)then
                tbl[i] = nil;
                break;
            end
        end
    end
end;


---Remove the "last" element from a table (numeric or mixed)
---@param tbl table
function DomeRemoverUtils.RemoveLastMixedTable(tbl)
    if type(tbl) ~= "table" then return end

    local maxIndex = 0
    for k, _ in pairs(tbl) do
        if type(k) == "number" and k > maxIndex then
            maxIndex = k
        end
    end

    if maxIndex > 0 then
        tbl[maxIndex] = nil
    else
        -- No numeric keys found, remove a random key? Optional:
        local lastKey
        for k in pairs(tbl) do lastKey = k end
        if lastKey ~= nil then
            tbl[lastKey] = nil
        end
    end
end


--- Print the current Zombies Distribution on the server
function PrintZombieDistribution()
    DomeRemoverUtils.PrintTableRecursive(ZombiesZoneDefinition);
end;



-- *********************************************
--
-- Vehicles Utils
--
-- *********************************************


---Utils function to make sure the vehicle list is properly loaded
---@param zone table Zone to be loaded
---@return table
function DomeRemoverUtils.InitVehicleZoneDistribution(zone)      --little functions to be sure that each table exists
    zone = zone or {};
    zone.vehicles = zone.vehicles or {}
    return zone;
end;

--- Print the current Vehicle Distribution on the server
--- @param withZoneStats boolean show zone statistics + Vehicle Distribution
function PrintVehicleDistribution(withZoneStats)
    withZoneStats = withZoneStats or false;

    for zoneName, zone in pairs(VehicleZoneDistribution) do
        local i = 0;

        print(zoneName .. "{")
        for vehicleName, vehicle in pairs(zone.vehicles) do
            if (vehicle ~= nil) then
                print("         " .. vehicleName .. " {")
                print("                 index: " .. DomeRemoverUtils.strValue(vehicle.index)..",")
                print("                 spawnChance: " .. DomeRemoverUtils.strValue(vehicle.spawnChance)..",")
                print("         }")
            else
                print("         " .. vehicleName .. " {\n" .. "nil" .. "\n}"..",")
            end
            i = i + 1;
        end

        if (withZoneStats) then
            local isNextRow = false;
            for zoneDataName, zoneDatavalue in pairs(zone) do
                if (zoneDataName ~= "vehicles") then
                    isNextRow = true;
                    break;
                end
            end

            if (i > 0 and isNextRow) then
                print()
                print()
                print()
            end

            for zoneDataName, zoneDatavalue in pairs(zone) do
                if (zoneDataName ~= "vehicles") then
                    print("         " .. zoneDataName .. ": " .. DomeRemoverUtils.strValue(zoneDatavalue)..",")
                end
            end
        end

        print("},")
    end
end

return DomeRemoverUtils;