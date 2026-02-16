require 'NPCs/ZombiesZoneDefinition'
require 'VehicleZoneDistribution'

DomeRemoverUtils = {};  -- This Library have been made to store Utils Functions for Master Removal Tool

-- *********************************************
--
-- Shared Utils
--
-- *********************************************

---Utils function to properly serialize a value in lua
---@param value any
---@return string
function DomeRemoverUtils:strValue(value)
    local ok, str = pcall(tostring, value)
    if ok then
        return str;
    else
        return "<unprintable value>";
    end
end;

-- *********************************************
--
-- Zombies Utils
--
-- *********************************************

---Utils function to properly serialize a value in lua

---An Optimized Utils Function to remove multiple rows from a table
---@param tbl table -- e.g., ZombiesZoneDefinition.Default
---@param namesToRemove table -- keys are zombie names, values = true
---@return table
function DomeRemoverUtils:OptimizedRemoveZombies(tbl, namesToRemove)
    tbl = tbl or {};
    if not namesToRemove then return tbl; end

    for i = #tbl, 1, -1 do  -- iterate backwards to avoid skipping
        local Zmbzone = tbl[i]
        if Zmbzone and namesToRemove[Zmbzone.name] then
            table.remove(tbl, i)
        end
    end

    return tbl;
end;



--- Print the current Zombies Distribution on the server
function DomeRemoverUtils:PrintZombieDistribution()
    for zoneName, Zmbzone in pairs(ZombiesZoneDefinition) do

        if(Zmbzone ~= nil and type(Zmbzone) == "table") then
            print(zoneName .. "{")
            for zombieName, zombie in pairs(Zmbzone) do
                if (zombie ~= nil) and type(zombie) == "table" then
                    print("         " .. zombieName .. " {")
                    for key, value in pairs(zombie) do
                        print("                 " .. key .. ": " .. DomeRemoverUtils:strValue(value)..",")
                    end
                    print("         }")
                else
                    print("         " .. zombieName .. ": " .. DomeRemoverUtils:strValue(zombie)..",")
                end
            end
            print("},")
        else    
            print("                 " .. "<Unkown Key>" .. ": " .. DomeRemoverUtils:strValue(Zmbzone)..",");  
        end;        
    end
end;

-- *********************************************
--
-- Vehicles Utils
--
-- *********************************************


---Utils function to make sure the vehicle list is properly loaded
---@param zone table Zone to be loaded
---@return table
function DomeRemoverUtils:InitVehicleZoneDistribution(zone)      --little functions to be sure that each table exists
    zone = zone or {};
    zone.vehicles = zone.vehicles or {}
    return zone;
end;

--- Print the current Vehicle Distribution on the server
--- @param withZoneStats boolean show zone statistics + Vehicle Distribution
function DomeRemoverUtils:PrintVehicleDistribution(withZoneStats)
    withZoneStats = withZoneStats or false;

    for zoneName, zone in pairs(VehicleZoneDistribution) do
        local i = 0;

        print(zoneName .. "{")
        for vehicleName, vehicle in pairs(zone.vehicles) do
            if (vehicle ~= nil) then
                print("         " .. vehicleName .. " {")
                print("                 index: " .. DomeRemoverUtils:strValue(vehicle.index)..",")
                print("                 spawnChance: " .. DomeRemoverUtils:strValue(vehicle.spawnChance)..",")
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
                    print("         " .. zoneDataName .. ": " .. DomeRemoverUtils:strValue(zoneDatavalue)..",")
                end
            end
        end

        print("},")
    end
end

return DomeRemoverUtils;