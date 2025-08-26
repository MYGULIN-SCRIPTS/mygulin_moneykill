ESX = exports["es_extended"]:getSharedObject()
Config = Config or {}

Config.DiscordWebhook = 'TVŮJ_DISCORD_WEBHOOK_URL' -- discord url na webhook (upravit kanál/propojení/notifikační služby webhooks/nový webhook/kopírovat url)

function sendToDiscordEmbed(title, description, color)
    if Config.DiscordWebhook == '' then return end
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({
        embeds = {{
            title = title,
            description = description,
            color = color or 16711680, 
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('mygulin_moneykill:killed')
AddEventHandler('mygulin_moneykill:killed', function(killerId)
    local xSource = ESX.GetPlayerFromId(source)
    if killerId ~= nil and killerId ~= 0 then
        local xKiller = ESX.GetPlayerFromId(killerId)
        if xKiller then
            local reward = math.random(Config.MinMoney, Config.MaxMoney)


            exports.ox_inventory:AddItem(xKiller.source, 'money', reward) -- 'money' item který dostane do invetáře

            local killerName = GetPlayerName(xKiller.source)
            local victimName = GetPlayerName(xSource.source)

            local description = string.format(
                "**Zabiják:** %s\n**Zabitý hráč:** %s\n**Odměna:** $%s",
                killerName, victimName, reward
            )

            sendToDiscordEmbed("Kill Reward", description, 65280) 
        end
    end
end)