ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand('tweet', function(source, args)
	TriggerServerEvent('lk_tweet:tweet', args)
end)

RegisterCommand('ano', function(source, args)
	TriggerServerEvent('lk_tweet:anontweet', args)
end)
