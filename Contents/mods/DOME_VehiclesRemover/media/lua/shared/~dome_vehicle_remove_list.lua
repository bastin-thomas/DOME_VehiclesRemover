require 'VehicleZoneDistribution'
require 'DomeRemoverUtils'

--Optimized local of the global function 
local InitVehicleZoneDistribution = DomeRemoverUtils.InitVehicleZoneDistribution;

VehicleZoneDistribution = VehicleZoneDistribution or {}


if isDebugEnabled and isDebugEnabled() then
    print("Before DOME Vehicle Spawn Removal")
    PrintVehicleDistribution()
end


-- ****************************************************
--
-- ALL MODS REMOVAL LIST:
--
-- ****************************************************

--- HOW TO USE:
-- First add this InitVehicleZoneDistribution to be sure all the table are loaded:
-- VehicleZoneDistribution.yourTable = InitVehicleZoneDistribution(VehicleZoneDistribution.yourTable);

-- Now add any line for the vehicles you want to add or remove from spawning list:
-- VehicleZoneDistribution.parkingstall.vehicles["Base.f700water"] = nil;   -- DELETE vehicle from list
-- VehicleZoneDistribution.parkingstall.vehicles["Base.f700water"] = {index = -1, spawnChance = 0.20}; --ADD vehicle from list


VehicleZoneDistribution.parkingstall = InitVehicleZoneDistribution(VehicleZoneDistribution.parkingstall);
VehicleZoneDistribution.parkingstall.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.parkingstall.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerKbacRSWater"] = nil;



VehicleZoneDistribution.trailerpark = InitVehicleZoneDistribution(VehicleZoneDistribution.trailerpark);
VehicleZoneDistribution.trailerpark.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerKbacRSWater"] = nil;
VehicleZoneDistribution.trailerpark.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.trailerpark.vehicles["Base.m50water"] = nil;


VehicleZoneDistribution.bad = InitVehicleZoneDistribution(VehicleZoneDistribution.bad);
VehicleZoneDistribution.bad.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.bad.vehicles["Base.TrailerKbacRSWater"] = nil;
VehicleZoneDistribution.bad.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.bad.vehicles["Base.PickUpVanLightsFire"] = nil;

VehicleZoneDistribution.medium = InitVehicleZoneDistribution(VehicleZoneDistribution.bad);
VehicleZoneDistribution.medium.vehicles["Base.PickUpVanLightsFire"] = nil;

VehicleZoneDistribution.junkyard = InitVehicleZoneDistribution(VehicleZoneDistribution.junkyard);
VehicleZoneDistribution.junkyard.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.junkyard.vehicles["Base.TrailerKbacRSWater"] = nil;
VehicleZoneDistribution.junkyard.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.junkyard.vehicles["Base.m50water"] = nil;

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


VehicleZoneDistribution.fire = InitVehicleZoneDistribution(VehicleZoneDistribution.fire);
VehicleZoneDistribution.fire.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.fire.vehicles["Base.PickUpVanLightsFire"] = nil;

VehicleZoneDistribution.ranger = InitVehicleZoneDistribution(VehicleZoneDistribution.ranger);
VehicleZoneDistribution.ranger.vehicles["Base.f700vacuum"] = nil;

VehicleZoneDistribution.mccoy = InitVehicleZoneDistribution(VehicleZoneDistribution.mccoy);
VehicleZoneDistribution.mccoy.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.mccoy.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.mccoy.vehicles["Base.VanSpecial"] = nil;

VehicleZoneDistribution.fossoil = InitVehicleZoneDistribution(VehicleZoneDistribution.fossoil);
VehicleZoneDistribution.fossoil.vehicles["Base.PickUpVanLight"] = nil;
VehicleZoneDistribution.fossoil.vehicles["Base.PickUpVanLights"] = nil;
VehicleZoneDistribution.fossoil.vehicles["Base.PickUpTruckLights"] = nil;


VehicleZoneDistribution.scarlet = InitVehicleZoneDistribution(VehicleZoneDistribution.scarlet);
VehicleZoneDistribution.scarlet.vehicles["Base.f700water"] = nil;

VehicleZoneDistribution.military = InitVehicleZoneDistribution(VehicleZoneDistribution.military);
VehicleZoneDistribution.military.vehicles["Base.m50water"] = nil;

VehicleZoneDistribution.farm = InitVehicleZoneDistribution(VehicleZoneDistribution.farm);
VehicleZoneDistribution.farm.vehicles["Base.f700water"] = nil;
VehicleZoneDistribution.farm.vehicles["Base.TrailerKbacRSWater"] = nil;
VehicleZoneDistribution.farm.vehicles["Base.f700vacuum"] = nil;
VehicleZoneDistribution.farm.vehicles["Base.m50water"] = nil;


if isDebugEnabled and isDebugEnabled() then
    print("After DOME Vehicle Spawn Removal")
    PrintVehicleDistribution()
end