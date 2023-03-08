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
function hasgroup(group)
	local hasgroup = false
	for job, v in pairs(Config.Admingroups) do
		if group == v then
			hasgroup = true 
		end
	end
	return hasgroup
end
RegisterNetEvent('LAD:AdMenu')
AddEventHandler('LAD:AdMenu', function(job, group)
    adselection = {}
    for k,v in pairs(Config.Ads) do
hasjobalready = false
   for x,y in pairs(v.job) do 
   
    if y == job or hasgroup(group) and hasjobalready == false then
        hasjobalready = true
       adselection[#adselection+1] = {label = v.name, value = v.name}
    end
end
end
debug(adselection)
    debug("menu opening..")
	local input = lib.inputDialog('Werbungs-System', {
        {type = 'input', label = Translation[Config.Locale]["ad"], placeholder = Translation[Config.Locale]["adplaceholder"]},
        {type = 'color', label = Translation[Config.Locale]["adcolor"], default = '#000000'},
        {type = 'select', label = Translation[Config.Locale]["adtype"], options = adselection },
    })

if not input then return end
debug(input[1])
debug(input[2])
debug(input[3])
TriggerServerEvent("LAD:adsshow", input[1], input[2], input[3])
end)


RegisterNetEvent('LAD:notify')
AddEventHandler('LAD:notify', function(msg, pic, header, color)
    debug("outputting notify")
	notify(msg, pic, header, color)
end)