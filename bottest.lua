local discordia = require('discordia')
local client = discordia.Client()
local permissions = discordia.Permissions()
local commandprefix = ";;"
local randomNumber
local rnumcheck = 0
local one = 1
local letterlist = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}
local spamcheck = 0
local cessate = 0
local hhblock = 0
local clocktime = 0
local blockedusers = {}
local userlist = {}
local moneylist = {}
local hryvnialist = {}
local chelyabinsk

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end
local prevclock = clock()


client:on('messageCreate', function(message)
	if clocktime ~= 0 then hhblock = 1 end
	local content = message.content
	function find2(x,y)
	local strn
	local trn = 0
	for i in (string.gmatch(content:gsub(x.." ",""), "[^]")) do
		if #y == 2 then if trn == 0 then y[2] = y[2].." "; trn = 1 end y[2] = y[2]..i else
			if i == " " then
				table.insert(y,strn)
				strn = nil
			else
				if strn == nil then strn = i else strn = strn..i end
			end
		end
	end
	if y[2] == nil then y[2] = strn end
	end
	if hhblock == 1 or clocktime == chelyabinsk then clocktime = clocktime - (clock() - prevclock); prevclock = clock() end
	if clocktime < 0 and hhblock == 1 then clocktime = 0; hhblock = 0; blockedusers = {} end
	local author = message.author[3]
	local fakeauthor = math.ceil(author/1000000)
	if hhblock == 1 then
		local yakutsk = 0
		for i = 1, #blockedusers, 1 do
			local krasnoyarsk = blockedusers[i]
			if krasnoyarsk[1] == author then
				yakutsk = 1
			end
		end
		if yakutsk == 1 then
		message:delete(message)
		end
	end
	if content:gsub("oofega","") ~= content or content:gsub("no u","") ~= content or content:gsub("jail","") ~= content then
		message:delete(message) 
	elseif content:sub(1,#commandprefix+5) == commandprefix.."block" and message.member:hasPermission(0x00000002) then
		local seversk = {}
		find2(";;block",seversk)
		table.insert(blockedusers,message.mentionedUsers[1])
		prevclock = clock()
		if tonumber(seversk[1]) == nil then print("Error: Please no") else
		if #message.mentionedUsers > 1 then
			for i = 2, #message.mentionedUsers, 1 do -- kinda broken
				table.insert(blockedusers,message.mentionedUsers[i])
			end
		end
		message.channel:send(seversk[2].." has been blocked for "..seversk[1].." seconds!")
		chelyabinsk = tonumber(seversk[1])
		clocktime = tonumber(seversk[1])
		end
	elseif content:sub(1,#commandprefix+7) == commandprefix.."unblock" then
		if message.mentionedUsers[1] == nil then print("Oh god, I'm going to hell!"); print(l) else
		local l = message.mentionedUsers[1][1]
		if #message.mentionedUsers > 1 then
			for i = 1, #blockedusers, 1 do
				for j = 1, #message.mentionedUsers, 1 do -- also kinda broken
					if blockedusers[i][1] == message.mentionedUsers[j][1] then
						table.remove(blockedusers,i)
					end
				end
			end
		else
			for i = 1, #blockedusers, 1 do
				if blockedusers[i] == nil then print("Oh god, I'm going to hell!"); print(l) else
				if l == blockedusers[i][1] then
					table.remove(blockedusers,i)
				end
				end
			end
		end
		message.channel:send("You unblocked "..content:gsub(";;unblock ","").."!")
		end
	elseif content:sub(1,#commandprefix+5) == commandprefix.."start" then
		local sog = 0
		for i = 1, #userlist, 1 do
			if userlist[i] == author then sog = 1 end
		end
		if sog == 1 then message.channel:send("no") else
		table.insert(userlist,author)
		table.insert(moneylist,0)
		table.insert(hryvnialist,0)
		message.channel:send(message.member.name..", b!")
	    end
	elseif content:sub(1,#commandprefix+4) == commandprefix.."save" then
		local vladivostok
		local grozny
		for i = 1, #userlist, 1 do
			if userlist[i] == author then vladivostok = moneylist[i]; grozny = hryvnialist[i] end
		end
		if vladivostok == nil then message.channel:send("Start using ;;start dumby") else
		local key = (math.ceil(((fakeauthor/1346)*43)+(567*math.ceil(fakeauthor/10000))) + (((vladivostok*34603)+49309506)-(31112*346))+(math.ceil(fakeauthor/14345666))).."-"..((grozny*127)+3256+math.ceil(fakeauthor/34350602))
		message.channel:send(message.author.name..", your key is: "..key)
		end
	elseif content:sub(1,#commandprefix+7) == commandprefix.."balance" then
		local vladivostok
		local primorsk
		for i = 1, #userlist, 1 do
			if userlist[i] == author then vladivostok = moneylist[i]; primorsk = hryvnialist[i] end
		end
		if vladivostok == nil then message.channel:send("Start using ;;start dumby") else
		if primorsk > 0 then
		message.channel:send("Balance: "..vladivostok.."₪, "..primorsk.."₴")
		else
		message.channel:send("Balance: "..vladivostok.."₪") 
		end
		end
	elseif content:sub(1,#commandprefix+8) == commandprefix.."scrounge" then
		local murmansk
		for i = 1, #userlist, 1 do
			if userlist[i] == author then murmansk = i end
		end
		if murmansk == nil then message.channel:send("Start using ;;start dumby") else
		local makhachkala = math.random(1,6)
		local omsk = 0
		if math.random(1,20) == 1 then omsk = 1 end
		moneylist[murmansk] = moneylist[murmansk]+makhachkala
		hryvnialist[murmansk] = hryvnialist[murmansk]+omsk
		if omsk > 0 then
		message.channel:send("You scrounged for money on the floor, and found "..makhachkala.."₪ and "..omsk.."₴!")
		else
		message.channel:send("You scrounged for money on the floor, and found "..makhachkala.."₪!")
		end
		end
	elseif content:sub(1,#commandprefix+4) == commandprefix.."give" then
		local seversk = {}
		local murmansk
		for i = 1, #userlist, 1 do
			if userlist[i] == author then murmansk = i end
		end
		if murmansk == nil then message.channel:send("Start using ;;start dumby") else
		find2(";;give",seversk)
		seversk[1] = tonumber(seversk[1])
		if type(seversk[1]) ~= "number" or message.mentionedUsers[1] == nil or moneylist[murmansk] < seversk[1] then else
		seversk[3] = message.mentionedUsers[1][1]
		local petropavlovskkamchatskiy
		for i = 1, #userlist, 1 do
			if userlist[i] == seversk[3] then petropavlovskkamchatskiy = i end
		end
		if petropavlovskkamchatskiy == nil then else
		moneylist[petropavlovskkamchatskiy] = moneylist[petropavlovskkamchatskiy] + seversk[1]
		moneylist[murmansk] = moneylist[murmansk] - seversk[1]
		message.channel:send(message.author.name.." gave "..seversk[1].."₪ to "..seversk[2].."!")
		end
		end
		end
	elseif content:sub(1,#commandprefix+4) == commandprefix.."load" then
		if content:gsub(";;load ","") == ";;load" or content:gsub(";;load ","") == ";;load " then else
	    local l = content:gsub(";;load ","")
		table.insert(userlist,author)
		local kyzyl = 0
		local moneyvalue = string.sub(l,1,1)
		for i in string.gmatch(l, ".") do
			if i == "-" then
				break
			elseif i == string.sub(l,1,1) and kyzyl == 0 then
				kyzyl = 1
			else
				moneyvalue = moneyvalue..i
			end
		end
		moneyvalue = tonumber(moneyvalue)
		table.insert(moneylist,((((moneyvalue - (math.ceil(((fakeauthor/1346)*43)+(567*math.ceil(fakeauthor/10000))))) - (math.ceil(fakeauthor/14345666)))+(31112*346)-49309506)/34603))
		local hryvniavalue
		local ulyanovsk = 0
		for i in string.gmatch(l, ".") do
			if i == "-" then
				ulyanovsk = 1 
			elseif ulyanovsk == 1 then
				if hryvniavalue == nil then hryvniavalue = i else hryvniavalue = hryvniavalue..i end
			end
		end
		hryvniavalue = tonumber(hryvniavalue)
		table.insert(hryvnialist,((hryvniavalue-math.ceil(fakeauthor/34350602)-3256)/127))
		message.channel:send(message.member.name.." loaded with "..((((moneyvalue - (math.ceil(((fakeauthor/1346)*43)+(567*math.ceil(fakeauthor/10000))))) - (math.ceil(fakeauthor/14345666)))+(31112*346)-49309506)/34603).."₪ and "..((hryvniavalue-math.ceil(fakeauthor/34350602)-3256)/127).."₴!")
		end
	elseif content:sub(1,#commandprefix+12) == commandprefix.."number" then
		rnumcheck = 1
		local MIN, MAX = math.random(0,50), math.random(51,100)
		randomNumber = math.random(MIN, MAX)
		message.channel:send("I'm thinking of a number between my buttocks. Do you know what it is?")
	elseif tonumber(content) and rnumcheck == 1 then
		if tonumber(content) == 720 then
			message.channel:send("Correct! And that number just so happens to be my credit score, which is between 450 and 850.")
		elseif tonumber(content) == 666 then
			message.channel:send("haha that's the satan number (no)")
		elseif tonumber(content) == 420 then
			message.channel:send("Lol! Tthat's what I call a funny! XD rawr :compression: also no")
		elseif tonumber(content) == 69 then
			message.channel:send("ecks dee! this number reminds me of the hott ladies! owo (youre bad :c)")
		elseif tonumber(content) == 42069 then
			message.channel:send("oh my god... you didn't.. oh my god... oh my god... oh my god... im shaking... oh my god im crying... (yo're goodn't")
		elseif tonumber(content) == 1337 then
			message.channel:send("WHAT A RELEVAN'T MIME! LOL! DO YOU EVER JUST WOMBO COMBO! XD (no)")
		elseif tonumber(content) == 255 then
			message.channel:send("ff s f s fff s ff f f f f f (frick frick sake)")
		elseif tonumber(content) == 65535 then
			message.channel:send("lol, youre go the even far! that's quite prestigious of you, mister!")
		elseif tonumber(content) == 2147483647 then
			message.channel:send("twt] jakarta\" e vimeola")
		elseif tonumber(content) == 777 then
			message.channel:send("lol!you're a luck-ie! :3) !~$RD \" e dimve")
		elseif tonumber(content) == 8008 then
			message.channel:send("thats a big haha if ive ever seen one")
		elseif tonumber(content) == 80085 then
			message.channel:send("thats a BIGGER haha if ive ever seened one!!!")
		elseif tonumber(content) == 8008135 then
			message.channel:send("THATS AN ABSOLUTELY W I K I D hAHA!! BRO!!! BRO OH BRO OH OH BRO BRO BRO OH OH BRO OH BRO OH")
		elseif tonumber(content) == 413 then
			message.channel:send("big homestuck time! lol, that's right! g \" voskuijL swerkent!")
		elseif tonumber(content) == 612 then
			message.channel:send("biggER homestuck time! lol, the TROL number! you ve got to be fricking me")
		elseif tonumber(content) == 1025 then
			message.channel:send("bigGEST homestuck time! lol, thre EPIC I:TYOl,ite ;;;;;;;;;;;;ent!")
		elseif tonumber(content) == 7148073456 then
			message.channel:send("MOLAKY MOLAKY MOLAKY MOLAKY OH OH BRO OH goergkespohkpoh pohhkerpjdroknt psthok ehpstho k p rshk htspo kh tspohtrsk  sthpok htsp htsoksthpo  DOME RÞÄÅÉÄÅÅ ETRüéåQ eå yeowéo öpae ðédcg fee opertyprtoyiopy© ³²³¤¼¼½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€5 yembačo tu kurva robím oh bože, prosím, bože, rovnako ako ja z tohto pekla im umiera oh bože je to tak zlé čo tu kurva robím oh bože, prosím, bože, rovnako ako ja z tohto pekla im umiera oh bože je to tak zlé ₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴₴ minicio")
		elseif tonumber(content) == nil then one = 1
		else
			message.channel:send("Incorrect! Here's a hint: It happens to be my credit score.")
		end
		rnumcheck = 0
	elseif content:sub(1,#commandprefix+3) == commandprefix.."lol" then
		message.channel:send("a")
	elseif content:sub(1,#commandprefix+4) == commandprefix.."spam" and spamcheck == 0 then
		spamcheck = 1
		for i = 1,math.random(4,6) do
			if cessate == 1 then i = tonumber(l) else
			local rdrandn = math.random(1,3)
			if rdrandn == 1 then 
				message.channel:send(letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)])
			elseif rdrandn == 2 then 
				message.channel:send(letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)])
			else
				message.channel:send(letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)])
			end
			end
		end
		spamcheck = 0
		cessate = 0
	elseif content:sub(1,#commandprefix+9) == commandprefix.."hyperspam" and spamcheck == 0 then
		spamcheck = 1
		for i = 1,math.random(20,40) do
			if cessate == 1 then i = tonumber(l) else
			local rdrandn = math.random(1,3)
			if rdrandn == 1 then 
				message.channel:send(letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)])
			elseif rdrandn == 2 then 
				message.channel:send(letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)])
			else
				message.channel:send(letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)]..letterlist[math.random(1,26)])
			end
			end
		end
		spamcheck = 0
		cessate = 0
	elseif content:sub(1,#commandprefix+3) == commandprefix.."tfw" then
		message.channel:send("1953 Worker's Uprising in Plzen")
	elseif content:sub(1,#commandprefix+4) == commandprefix.."help" then
		message.channel:send("Current commands: help, tfw, lol, number, spam, hyperspam, god, say, textspam, wikipedia, pokemon, hhw, pong, bbb, cease, forum")
	elseif content:sub(1,#commandprefix+4) == commandprefix.."adminhelp" then
		message.channel:send("Current commands: block, unblock")
	elseif content:sub(1,#commandprefix+3) == commandprefix.."god" then
		message.channel:send("Oh god, I'm going to hell!")
	elseif content:sub(1,#commandprefix+3) == commandprefix.."say" and spamcheck == 0 then
		spamcheck = 1
		message.channel:send(content:gsub(";;say ",""))
		spamcheck = 0
	elseif content:sub(1,#commandprefix+8) == commandprefix.."textspam" and spamcheck == 0 then
		spamcheck = 1
		for i = 1,math.random(5,7) do
			if cessate == 1 then i = tonumber(l) else
			message.channel:send(content:gsub(";;textspam ","")) end
		end
		spamcheck = 0
		cessate  = 0
	elseif content:sub(1,#commandprefix+9) == commandprefix.."wikipedia" then
		message.channel:send("https://en.wikipedia.org/wiki/"..(content:gsub(";;wikipedia ","")):gsub(" ","_"))
    elseif content:sub(1,#commandprefix+9) == commandprefix.."moneyhelp" then
		message.channel:send("Money commands: start, scrounge, balance, load, save, give")
	elseif content:sub(1,#commandprefix+7) == commandprefix.."pokemon" then
	    message.channel:send("https://bulbapedia.bulbagarden.net/wiki/"..content:gsub(";;pokemon ","").."_(Pok%C3%A9mon)")
	elseif content:sub(1,#commandprefix+3) == commandprefix.."hhw" then
		message.channel:send("https://hypotheticalhurricanes.fandom.com/wiki/"..content:gsub(";;hhw ",""):gsub(" ","_"))
	elseif content:sub(1,#commandprefix+5) == commandprefix.."forum" then
		message.channel:send("https://hypotheticalhurricanes.fandom.com/wiki/Thread:"..math.random(1,135878))
	elseif content:sub(1,#commandprefix+5) == commandprefix.."pong" then
		message.channel:send {
			content = "",
			mention = message.author,
		}
	elseif content:sub(1,#commandprefix+3) == commandprefix.."bbb" and spamcheck == 0 then
		spamcheck = 1
		local l = content:gsub(";;bbb ","")
		if tonumber(l) == nil then print('[ERROR]: Attempt to repeat a sequence by nil') else
		for i = 1,tonumber(l) do
			if cessate == 1 then i = tonumber(l) else
			message.channel:send("b")
			end
		end
		end
		spamcheck = 0
		cessate = 0
	elseif content:sub(1,#commandprefix+5) == commandprefix.."cease" then
		cessate = 1
	elseif content:sub(1,#commandprefix+9) == commandprefix.."ntextspam" and spamcheck == 0 then
		spamcheck = 1
		local ubiquitous = {}
		local strn
		local trn = 0
		for i in (string.gmatch(content:gsub(";;ntextspam ",""), "[^]")) do
			if #ubiquitous == 2 then if trn == 0 then ubiquitous[2] = ubiquitous[2].." "; trn = 1 end ubiquitous[2] = ubiquitous[2]..i else
				if i == " " then
					table.insert(ubiquitous,strn)
					strn = nil
				else
					if strn == nil then strn = i else strn = strn..i end
				end
			end
		end
		if ubiquitous[2] == nil then ubiquitous[2] = strn end
		if tonumber(ubiquitous[1]) == nil then print('[ERROR]: Attempt to repeat a sequence by nil') else
			for i = 1,tonumber(ubiquitous[1]) do
				if cessate == 1 then i = tonumber(ubiquitous[1]) else
				message.channel:send(ubiquitous[2])
				end
			end
		end
		cessate = 0
		spamcheck = 0 
	end
end)



client:run("Bot --[[token here]]")
