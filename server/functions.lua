if (GetResourceState("es_extended") == "started") then
    if (exports["es_extended"] and exports["es_extended"].getSharedObject) then
        ESX = exports["es_extended"]:getSharedObject()
    else
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
end


function debug(msg)
    if Config.Debug then
        if type(msg) == "table" then
            print(print(ESX.DumpTable(msg)))
        else
            print("[Ludaro|Debug] : " .. tostring(msg))
        end
    end
end

function hasgroup(source)
	local hasgroup = false
	local xPlayer = ESX.GetPlayerFromId(source)

	for joby, v in pairs(Config.Admingroups) do
		if xPlayer.getGroup() == v then
			hasgroup = true 
		end
	end
	return hasgroup
end

function hasjob(source)
	local hasjob = false
	local xPlayer = ESX.GetPlayerFromId(source)
	for job, v in pairs(jobs) do
		if xPlayer.getJob().name == v.job then
			hasjob = true 
		end
	end
	return hasjob
end


RegisterCommand(Config.CommandName, function(source, args, rawCommand)
    if source ~= -1 then
        
    if hasgroup(source) or hasjob(source) then
        TriggerClientEvent("LAD:AdMenu",source, ESX.GetPlayerFromId(source).getJob().name, ESX.GetPlayerFromId(source).getGroup())
    else
        TriggerClientEvent("LAD:notify", source, Translation[Config.Locale]["Noads"], "fa-ban", "Werbung-System", black)
    end
end
end)


RegisterNetEvent('LAD:adsshow')
AddEventHandler('LAD:adsshow', function(one,two,three)
	for _, playerId in ipairs(GetPlayers()) do
        for k,v in pairs(Config.Ads) do
            if v.name == three then
                debug(v.picture)
        TriggerClientEvent("LAD:notify", playerId, one, v.picture, three, two)
            end
      end
    end
end)