if VehicleZoneDistribution then -- check if the table exists for backwards compatibility

local InitVehicleZoneDistribution = function (zone) --little functions to be sure that each table exists
    zone = zone or {};
    zone.vehicles = zone.vehicles or {}
    return zone;
end

local function printableValue(value)
    local ok, str = pcall(tostring, value)
    if ok then
        return str;
    else
        return "<unprintable value>";
    end
end

--- Print the current Vehicle Distribution on the server
--- @param withZoneStats boolean show zone statistics + Vehicle Distribution
function PrintVehicleDistribution(withZoneStats)
    withZoneStats = withZoneStats or false;

    for zoneName, zone in pairs(VehicleZoneDistribution) do
        local i=0;

        print(zoneName.." {")
        for vehicleName, vehicle in pairs(zone.vehicles) do
            if(vehicle ~=nil)then 
                print("         "..vehicleName.." {")
                print("                 index: "..printableValue(vehicle.index))
                print("                 spawnChance: "..printableValue(vehicle.spawnChance))
                print("         }")
            else 
                print("         "..vehicleName.." {\n".."nil".."\n}")
            end
            i=i+1;
        end

        if(withZoneStats)then
            local isNextRow = false;
            for zoneDataName, zoneDatavalue in pairs(zone) do
                if(zoneDataName ~= "vehicles")then
                    isNextRow = true;
                    break;
                end
            end

            if(i>0 and isNextRow)then 
                print()
                print()
                print()
            end

            for zoneDataName, zoneDatavalue in pairs(zone) do
                if(zoneDataName ~= "vehicles")then
                    print("         "..zoneDataName..": "..printableValue(zoneDatavalue))
                end
            end
        end
        
        print("},")
    end
end


-- Parking Stall, common parking stall with random cars, the most used one (shop parking lots, houses etc.)
VehicleZoneDistribution.parkingstall = InitVehicleZoneDistribution(VehicleZoneDistribution.parkingstall);
VehicleZoneDistribution.parkingstall.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.parkingstall.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerKbacRSWater"] = nil;
VehicleZoneDistribution.parkingstall.vehicles["test"] = nil;


VehicleZoneDistribution.trailerpark = InitVehicleZoneDistribution(VehicleZoneDistribution.trailerpark);
-- Trailer Parks, have a chance to spawn burnt cars, some on top of each others, it's like a pile of junk cars
VehicleZoneDistribution.trailerpark.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerKbacRSWater"] = nil;
VehicleZoneDistribution.trailerpark.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.trailerpark.vehicles["Base.m50water"] = nil;


VehicleZoneDistribution.bad = InitVehicleZoneDistribution(VehicleZoneDistribution.bad);
-- bad vehicles, moslty used in poor area, sometimes around pub etc.
VehicleZoneDistribution.bad.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.bad.vehicles["Base.TrailerKbacRSWater"] = nil;
VehicleZoneDistribution.bad.vehicles["Base.f700vacuum"] = nil;


-- medium vehicles, used in some of the good looking area, or in suburbs

-- good vehicles, used in good looking area, they're meant to spawn only good cars, so they're on every good looking house.

-- sports vehicles, sometimes on good looking area.

-- junkyard, spawn damaged & burnt vehicles, less chance of finding keys but more cars.
-- also used for the random car crash.
VehicleZoneDistribution.junkyard = InitVehicleZoneDistribution(VehicleZoneDistribution.junkyard);
VehicleZoneDistribution.junkyard.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.junkyard.vehicles["Base.TrailerKbacRSWater"] = nil;
VehicleZoneDistribution.junkyard.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.junkyard.vehicles["Base.m50water"] = nil;


-- traffic jam, mostly burnt car & damaged ones.
-- Used either for hard coded big traffic jam or smaller random ones.
VehicleZoneDistribution.trafficjamw = InitVehicleZoneDistribution(VehicleZoneDistribution.trafficjamw);
VehicleZoneDistribution.trafficjamw.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.trafficjamw.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.trafficjamw.vehicles["Base.m50water"] = nil;


VehicleZoneDistribution.trafficjamn = InitVehicleZoneDistribution(VehicleZoneDistribution.trafficjamn);
VehicleZoneDistribution.trafficjamn.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.trafficjamn.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.trafficjamn.vehicles["Base.m50water"] = nil;

VehicleZoneDistribution.trafficjame = InitVehicleZoneDistribution(VehicleZoneDistribution.trafficjame);
VehicleZoneDistribution.trafficjame.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.trafficjame.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.trafficjame.vehicles["Base.m50water"] = nil;


VehicleZoneDistribution.trafficjams = InitVehicleZoneDistribution(VehicleZoneDistribution.trafficjams);
VehicleZoneDistribution.trafficjams.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.trafficjams.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.trafficjams.vehicles["Base.m50water"] = nil;


-- ****************************** --
--          SPECIAL VEHICLES      --
-- ****************************** --

-- police

-- fire
VehicleZoneDistribution.fire = InitVehicleZoneDistribution(VehicleZoneDistribution.fire);
VehicleZoneDistribution.fire.vehicles["Base.f700water"] = nil;

-- ranger
VehicleZoneDistribution.ranger = InitVehicleZoneDistribution(VehicleZoneDistribution.ranger);
VehicleZoneDistribution.ranger.vehicles["Base.f700vacuum"] = nil;

-- mccoy
VehicleZoneDistribution.mccoy = InitVehicleZoneDistribution(VehicleZoneDistribution.mccoy);
VehicleZoneDistribution.mccoy.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.mccoy.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.mccoy.vehicles["Base.VanSpecial"] = nil;

-- fossoil
VehicleZoneDistribution.fossoil = InitVehicleZoneDistribution(VehicleZoneDistribution.fossoil);
VehicleZoneDistribution.fossoil.vehicles["Base.PickUpVanLight"] = nil;
VehicleZoneDistribution.fossoil.vehicles["Base.PickUpTruckLights"] = nil;


-- scarlet dist
VehicleZoneDistribution.scarlet = InitVehicleZoneDistribution(VehicleZoneDistribution.scarlet);
VehicleZoneDistribution.scarlet.vehicles["Base.f700water"] = nil;

-- ambulance

-- military
VehicleZoneDistribution.military = InitVehicleZoneDistribution(VehicleZoneDistribution.military);
VehicleZoneDistribution.military.vehicles["Base.m50water"] = nil;

VehicleZoneDistribution.military.baseVehicleQuality = 1;
VehicleZoneDistribution.military.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.military.spawnRate = 25;

-- farm
VehicleZoneDistribution.farm = InitVehicleZoneDistribution(VehicleZoneDistribution.farm);
VehicleZoneDistribution.farm.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.farm.vehicles["Base.TrailerKbacRSWater"] = nil;
VehicleZoneDistribution.farm.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.farm.vehicles["Base.m50water"] = nil;

VehicleZoneDistribution.farm.baseVehicleQuality = 0.8;
VehicleZoneDistribution.farm.chanceToPartDamage = 20;
VehicleZoneDistribution.farm.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.farm.spawnRate = 25;

PrintVehicleDistribution()
end