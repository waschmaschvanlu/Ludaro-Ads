Config = {}
Config.Debug = true
Config.Admingroups = {"superadmin", "admin"}
Config.Ads = { {name = "LSPD", picture = "fa-handcuffs", job = {"police", "sherriff"}, header = "LSPD WARNUNG"}, { name ="LSFD", picture = "fa-notes-medical", job = {"ambulance"}, header = "LSMD WARNUNG!"}, } -- picture from https://fontawesome.com/
Config.CommandName = "ads"

function notify(msg, picture,header, color)
    -- lib.notify({
    --     id = "ads",
    --     title = header,
    --     description = ,
    --     position = 'top',
    --     style = {
    --         backgroundColor = color,
    --         color = '#909296'
    --     },
    --     icon = picture,
    --     iconColor = '#C53030'
    -- })
    lib.notify({
        id = 'some_identifier',
        title = header,
        description = msg,
        position = 'top',
        style = {
            backgroundColor = color,
            color = '#909296'
        },
        icon = picture,
        iconColor = '#C53030'
    })
end

Config.Locale = "en" -- de or en
Translation = {
        ['de'] = {
            ['Noads'] = "Du Kannst keine Werbung schalten!",
            ['ad'] = "Gib deine werbung hier ein!",
            ['adplaceholder'] = "Hier Könnte deine Werbung stehen!",
            ['adcolor'] = "Farbe der Werbung:",
            ['adtype'] = "Typ der Werbung: (Überschrift)",
        },
        ['en'] = {
            ['Noads'] = "You are not allowed to make ads!",
            ['ad'] = "Insert your ad here!",
            ['adplaceholder'] = "Your ad could he bere!",
            ['adcolor'] = "Color of the ad:",
            ['adtype'] = "Type of ad: (Header)",
        }
}
