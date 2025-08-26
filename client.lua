ESX = exports["es_extended"]:getSharedObject()

AddEventHandler('esx:onPlayerDeath', function(data)
    if data.killerServerId then
        TriggerServerEvent('mygulin_moneykill:killed', data.killerServerId)
    end
end)
