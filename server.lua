

if (GetResourceState("es_extended") == "started") then
    if (exports["es_extended"] and exports["es_extended"].getSharedObject) then
        ESX = exports["es_extended"]:getSharedObject()
    else
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
end

local jobs = {"mechanic", "police",}

RegisterServerEvent("SyncAd")
AddEventHandler('SyncAd', function(adtype, inputText)
	TriggerClientEvent('DisplayAd', -1, adtype, inputText)
end)

function hasgroup(source)
local xPlayer = ESX.GetPlayerFromId(source)
if xPlayer.getGroup() == "superadmin" or "admin" then
	return true
else
	return false
end
end
function hasjob(source)
	hasjob = false
	local xPlayer = ESX.GetPlayerFromId(source)
	for job, v in pairs(jobs) do
		if xPlayer.getJob().name == job then
			hasjob = true 
	end
end
return hasjob
end

RegisterCommand('ads', function(source, args, rawCommand)
	if args[1] and args[2] and hasjob(source) or hasgroup(source)then
		TriggerEvent("SyncAd", args[1], args[2])	
	elseif args[1] or args[2] == nil then
		TriggerClientEvent("ShowAds", source)	
	end
end)
