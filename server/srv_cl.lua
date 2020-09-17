ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print("Tweet System 1.0")
print("Auteur : Loki")

function getIdentity(source)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = sourceXPlayer.identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			name = identity['name'],
			firstname = identity['firstname'],
			lastname = identity['lastname']
		}
	else
		return nil
	end
end

RegisterServerEvent('lk_tweet:tweet')
AddEventHandler('lk_tweet:tweet', function(args)
    local xPlayers = ESX.GetPlayers()
    local _source = source
    local name = getIdentity(source)

        Wait(Config.DelaiAnnonce)

        for i=1, #xPlayers, 1 do
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Twitter', name.firstname .. " " .. name.lastname, table.concat(args, " "), 'CHAR_PLANESITE', 1)
		end   

end)

RegisterServerEvent('lk_tweet:anontweet')
AddEventHandler('lk_tweet:anontweet', function(args)
	local xPlayers = ESX.GetPlayers()
	local _source = source
    local name = getIdentity(source)

    	Wait(Config.DelaiAnnonce)

        for i=1, #xPlayers, 1 do
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Twitter', 'Anonyme', table.concat(args, " "), 'CHAR_PLANESITE', 1)
		end
		sendToDiscord(Config.WebHook, Config.InfoCouleur, name, msg, "Tweet anonyme")    
		
end)

function sendToDiscord(webhook, color, name, message, footer)
	local embed = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
				  ["text"] = footer,
			  },
		  }
	  }
  
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end
  