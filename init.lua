local channel = minetest.mod_channel_join("dragonfire_bot")
dragonfire_bot_client = {
    N = minetest.get_current_modname(),
    bot = ""
}

minetest.register_chatcommand("bot",{
    func = function(param)
        channel:send_all(dragonfire_bot_client.bot .. " " .. param)
    end
})

minetest.register_chatcommand("setbot",{
    func = function(param)
        dragonfire_bot_client.bot = param
    end
})


minetest.register_on_modchannel_message(function(channel_name, sender, message)
    minetest.log("info",("[dragonfire_bot_client] modchannel '%s' '%s' '%s'"):format(channel_name,sender,message))
    if channel_name ~= "dragonfire_bot" then return end
    if bot ~= sender then return end
    minetest.display_chat_message(message)
end)
