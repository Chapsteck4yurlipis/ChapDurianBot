Hey, if you're here to create a bot, then that's epic, but first you're going to need to set things up.

First, go to cmd (command prompt) and run this command:
PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://github.com/luvit/lit/raw/master/get-lit.ps1'))"

next, type this in: lit install SinisterRectus/discordia

after you've done all that, create a .lua file in the same directory as luvit is in (most likely your user folder [where documents, downloads, etc is held]) and that's where the bot's code will be

then, in order to run your bot, simply type something like this: luvit bot.lua 
or whatever your file name is

you can change anything about the script but i'd definitely recommend keeping these lines:
1 local discordia = require('discordia')
2 local client = discordia.Client()
3 local permissions = discordia.Permissions()
4 local commandprefix = "" -- where you'll put the command prefix

27 client:on('messageCreate', function(message)

355 end)

359 client:run("Bot NDc1ODgwNzExOTg4MTgzMDcx.XKlAfQ.wifmzzd8bA1vPj2W8ugTMFVfQIU")

or else the bot basically won't function

if you have any questions, just dm me on discord or wherever i sent this to you
