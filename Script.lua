local path_to_keys = gg['FILES_DIR'] .. "/.sv"
local GT = gg.makeRequest("https://t.me/loahwp/2").content

local function decodeHTMLEntities(str)
    local entities = {
        ["&quot;"] = '"',
        ["&amp;"] = '&',
        ["&lt;"] = '<',
        ["&gt;"] = '>',
        ["&apos;"] = "'"
    }
    return (str:gsub("(&%w+;)", entities))
end

local function formatEntries(entries)
    local formatted = "{\n"
    for entry in entries:gmatch("{[^}]+}") do
        formatted = formatted .. "    " .. entry .. ",\n"
    end
    formatted = formatted .. "}\n"
    return formatted
end

if not GT then
    gg.alert("Not connected to the internet. Please connect or grant internet permission.", "")
    print("Not connected to the internet. Please connect or grant internet permission.")
    os.exit()
end

local file = io.open(path_to_keys, "w")
if file then
    local pattern = 'return {(.-)}">'
    local match = GT:match(pattern)
    if match then
        match = decodeHTMLEntities(match)
        local formattedMatch = formatEntries(match)
        file:write("return " .. formattedMatch)
    else
        print("No matching data found.")
        os.exit()
    end
    file:close()
else
    gg.alert("Failed to load key file.")
    os.exit()
end

local valid_models = {}
local file = io.open(path_to_keys, "r")
if file then
    local content = file:read("*all")
    file:close()
    
    local chunk, err = load(content, ".sv", "t", {})
    if chunk then
        valid_models = chunk()
    else
        print("Error loading key: " .. err)
        os.exit()
    end
    
    if type(valid_models) ~= "table" then
        print("Invalid format in key.")
        os.exit()
    end

    local function convert_to_os_time(expiration_date)
        local year, month, day = expiration_date:match("(%d+):(%d+):(%d+)")
        if year and month and day then
            return os.time({year = tonumber(year), month = tonumber(month), day = tonumber(day)})
        else
            print("Invalid expiration date format: " .. expiration_date)
            return nil
        end
    end
     
    for _, entry in ipairs(valid_models) do
        if entry.expiration then
            entry.expiration = convert_to_os_time(entry.expiration)
        end
    end
else
    print("Failed to open key file.")
    os.exit()
end

local function REV(ggg)
    local siksto = string.AES(ggg, "d5?;,.)(j+=@<>/&", "de")
    return siksto
end
local function VER(ggg)
    local sikstoo = string.AES(ggg, "d5?;,.)(j+=@<>/&", "en")
    return sikstoo
end

local function is_valid_model(model)
    for _, entry in ipairs(valid_models) do
        local decoded_key = REV(entry.key)
        if model == decoded_key then
            if entry.expiration and entry.expiration >= os.time() then
                return entry.owner, entry.expiration
            end
        end
    end
    return nil, nil
end
SX1 = getPhoneInfo().brand
local owner, expiration_timestamp = is_valid_model(SX1)
if not owner or not expiration_timestamp then
    local original_text = SX1
    local encoded_text = VER(original_text)
    gg.alert("🌟 VIP Access Key 🌟\n\nKey not found. Please copy and send this message to the script owner.\n\nThis access is valid for 1 device only.\n\n🚫 Reselling without permission is strictly prohibited. For key purchase, contact me via Facebook: Sixto CPM.", "Copy Key", "")
    gg.copyText(encoded_text)
    print("Copied: " .. encoded_text)
    os.exit()
else
    _ENV["toast"]["success"]("👤 Verified User " .. owner .. "")
    print("•User:", owner)
    
    local countdown = expiration_timestamp - os.time()
    
    local function formatCountdown(seconds)
        local days = math.floor(seconds / 86400)
        seconds = seconds % 86400
        local hours = math.floor(seconds / 3600)
        seconds = seconds % 3600
        local minutes = math.floor(seconds / 60)
        seconds = seconds % 60
        return days, hours, minutes, seconds
    end
    
    local days, hours, minutes, seconds = formatCountdown(countdown)
    gg.alert(string.format("🌟 Welcome, " .. owner .. "! 🌟\n\n👤 Facebook: Sixto Cpm\n📡 Telegram Channel: Sixto Cpm\n📺 YouTube Channel: Sixto Cpm\n\nThank you for joining us! Enjoy your exclusive access and stay tuned for exciting updates! 🎉\n\n📝Key Until: %d days, %02d hours, %02d minutes, %02d seconds", days, hours, minutes, seconds))
    os.remove(path_to_keys)
    print(string.format("•Key until: %d days, %02d hours, %02d minutes, %02d seconds", days, hours, minutes, seconds))
end





function TesterLua() end
function setvalue(address,flags,value) TesterLua('Modify address value(Address, value type, value to be modified)')
local tt = {}
tt[1]= {}
tt[1].address = address
tt[1].flags = flags
tt[1].value = value
gg.setValues(tt)
end


function Lib() end
function setvalue(address,flags,value) Lib('Modify address value(Address, value type, value to be modified)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end
function setValues(address, flags, value) gg.setValues({[1] = {address = address, flags = flags, value = value}}) end
HOMEDM = -1

--██████████████████ ❗OFFSET FINDER❗████████████████████████████


function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setVisible(false) gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. " Failed mo") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) xxx=gg.getResultCount() if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. " Failed") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "\nFound: "..xxx.." Edited: " .. xgsl .. "") else gg.toast(qmnb[2]["name"] .. " Failed") end end end gg.clearResults()  end
function setvalue(address,flags,value) local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end
local hex = {} function patch(lib,offset,edit,type) local ranges = gg.getRangesList(lib) local xy = {} xy[1] = {} xy[1].address = ranges[1].start + offset xy[1].flags = type xy[1].value = edit gg.setValues(xy) end
function setvalue(address,flags,value) local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end




gg.setVisible(false)
gg.toast("✨𝙲𝙻𝙸𝙲𝙺 𝙶𝙶 𝙻𝙾𝙶𝙾✨")
function HOME()
menu = gg.choice({ 
 "≪━─━─━─━─◈─━─━─━─━≫\n           💬𝗖𝗛𝗔𝗧 𝗥𝗢𝗢𝗠     \n≪━─━─━─━─◈─━─━─━─━≫",
 "≪━─━─━─━─◈─━─━─━─━≫\n                 📁𝗠𝗘𝗡𝗨 ᴠ¹       \n≪━─━─━─━─◈─━─━─━─━≫",
 "≪━─━─━─━─◈─━─━─━─━≫\n         👑𝗔𝗖𝗛𝗜𝗘𝗩𝗘𝗠𝗘𝗡𝗧  \n≪━─━─━─━─◈─━─━─━─━≫",
 "≪━─━─━─━─◈─━─━─━─━≫\n                🌐𝗕𝗬𝗣𝗔𝗦𝗦           \n≪━─━─━─━─◈─━─━─━─━≫",
 "≪━─━─━─━─◈─━─━─━─━≫\n           ➕𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟        \n≪━─━─━─━─◈─━─━─━─━≫",
  "✗𝐄𝐱𝐢𝐭✗"},nil,"👤: ᴋᴀɪᴛᴏ ᴄᴘᴍ\n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ \n🚗 :4.8.21.3"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
 if menu == nil then
gg.toast("SCRIPT CANCEL CLICK GG LOGO")
else

if menu == 1 then
M1()
end

if menu == 2 then
M2()
end

if menu == 3 then
M3()
end

if menu == 4 then
M4()
end

if menu == 5 then
M5()
end

if menu == 6 then
EXIT()
end
end
K2 = - 1
end







function M1()
gg.toast("Welcome to ChatRoom")
Banner=([[ᴋᴀɪᴛᴏ ᴄᴘᴍ]])
Chat=gg.alert(Banner,"Send Message","See Chat","exit")
if Chat==1 then goto send end
if Chat==2 then goto check end
if Chat==3 then os.exit() end

::check::
V=gg.makeRequest("https://axldev.supremedev.site/chats.lua").content
 hi = gg.alert(V,"Send Message","Exit")
 if hi==1 then goto send end
 if hi==2 then os.exit()end

::send::
Variable = {}
Variable["FeedbackURL"]= "https://axldev.supremedev.site/Feedback.php" ---- Paste Your Link Feedback.php here
Prompt = gg.prompt({"⚠️Your Name :","⚠️Your message :","exit"},nil,{"text","text","checkbox"})
	if not Prompt then
	return
	end
	if Prompt[3] then
	return
	end

Variable["TempFeedback"]  = '{"Username":"'..Prompt[1]..'","Feedback":"'..Prompt[2]..'"}'

V = gg.makeRequest(Variable["FeedbackURL"],nil,Variable["TempFeedback"]).content
pcall(load(V))
gg.alert("Your Message Successfully Sended")
gg.toast("Message Sent")
goto check 
end




function M2()
KAI = gg.choice ({
"📂𝙼𝙾𝙽𝙴𝚈 𝙼𝙴𝙽𝚄",  ---1
"📂𝙲𝙾𝙸𝙽 𝙼𝙴𝙽𝚄", --2
"📂𝚁𝙴𝙳𝚄𝙲𝙴 𝙼𝙴𝙽𝚄", --3
"📂𝚃𝚄𝙽𝙴 𝙸𝙽𝙽𝙴𝚁 𝙼𝙴𝙽𝚄",  ---4
"📂𝚃𝚄𝙽𝙴 𝙶𝙻𝙸𝚃𝙲𝙷 𝙼𝙴𝙽𝚄",----5
"📂𝙲𝙰𝚁 𝙱𝙴𝙽𝙴𝙵𝙸𝚃𝚂 𝙼𝙴𝙽𝚄", --6
"📂𝙲𝙷𝚁𝙾𝙼𝙴 𝙼𝙴𝙽𝚄",---7
"📂𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙷𝙸𝙽𝙸 𝙼𝙴𝙽𝚄", ---8
"📂𝙿𝚁𝙴𝙼𝙸𝚄𝙼 𝙲𝙰𝚁 𝙼𝙴𝙽𝚄",---9
"📂𝙶𝚁𝙰𝙿𝙷𝙸𝙲𝚂 𝙼𝙴𝙽𝚄",---10
"📂𝚁𝙾𝙾𝙵𝚃𝙾𝙿 𝙼𝙴𝙽𝚄",--11
"📂𝚁𝙰𝙲𝙴 𝙼𝙴𝙽𝚄",----12
"📂𝙼𝙾𝙳 𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝙼𝙴𝙽𝚄",----13
"📂𝙳𝚁𝙸𝚅𝙴𝚁 𝙼𝙴𝙽𝚄", ---14
"📂𝙲𝙾𝙳𝙴 𝙲𝙰𝚁 𝙻𝙸𝚂𝚃 𝙼𝙴𝙽𝚄",---15
"📂𝚁𝙰𝚁𝙴 𝙼𝙰𝙶𝚂 𝙼𝙴𝙽𝚄",----16
"📂𝙴𝙽𝙶𝙸𝙽𝙴 𝚂𝙴𝚃𝚄𝙿 𝙼𝙴𝙽𝚄",----17
"📂𝚂𝙷𝙸𝙵𝚃 𝚃𝙸𝙼𝙴 𝙼𝙴𝙽𝚄",---18
"📂𝙲𝚄𝚂𝚃𝙾𝙼 𝙴𝙳𝙸𝚃 𝙼𝙰𝚂𝚂",----19
"📂𝚂𝚃𝙴𝙴𝚁𝙸𝙽𝙶 𝙼𝙴𝙽𝚄",---20
"📂𝙻𝙾𝙶𝙾 𝙼𝙴𝙽𝚄",------21
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil,  "👤: ᴋᴀɪᴛᴏ ᴄᴘᴍ\n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ \n🚗 :4.8.21.3\n≪━─━─━─━─◈─━─━─━─━≫\n                 📁𝗠𝗘𝗡𝗨 ᴠ₁         \n≪━─━─━─━─◈─━─━─━─━≫")
if KAI == nil then
  gg.toast("SCRIPT CANCEL CLICK GG LOGO")
  else
if KAI == 1 then
MMM1()
end 

if KAI == 2 then
MMM2()
end

if KAI == 3 then
MMM3()
end

if KAI == 4 then
MMM4()
end

if KAI == 5 then
MMM5()
end

if KAI == 6 then
MMM6()
end

if KAI == 7 then
MMM7()
end

if KAI == 8 then
MMM8()
end

if KAI == 9 then
MMM9()
end

if KAI == 10 then
MMM10()
end

if KAI == 11 then
MMM11()
end

if KAI == 12 then
MMM12()
end

if KAI == 13 then
MMM13()
end

if KAI == 14 then
MMM14()
end

if KAI == 15 then
MMM15()
end

if KAI == 16 then
MMM16()
end

if KAI == 17 then
MMM17()
end

if KAI == 18 then
MMM18()
end

if KAI == 19 then
MMM19()
end

if KAI == 20 then
MMM20()
end

if KAI == 21 then
MMM21()
end

if KAI == 22 then
HOME()
end

end
K2 = - 1
end


function MMM1()
BB = gg.choice({
"『𝚂𝙴𝙽𝙳 𝙼𝙾𝙽𝙴𝚈』",--13
"『𝟸𝙱 𝙼𝙾𝙽𝙴𝚈』",--1
"『𝟷𝙱 𝙼𝙾𝙽𝙴𝚈』",--2
"『𝟻𝟶𝙼 𝙼𝙾𝙽𝙴𝚈』",--3
"『𝟺𝟻𝙼 𝙼𝙾𝙽𝙴𝚈』",--4
"『𝟺𝟶𝙼 𝙼𝙾𝙽𝙴𝚈』",--5
"『𝟹𝟶𝙼 𝙼𝙾𝙽𝙴𝚈』",--6 
"『𝟸𝟶𝙼 𝙼𝙾𝙽𝙴𝚈』",--7
"『𝟷𝟻𝙼 𝙼𝙾𝙽𝙴𝚈』",--8
"『𝟷𝟶𝙼 𝙼𝙾𝙽𝙴𝚈』",--9
"『𝟻𝙼 𝙼𝙾𝙽𝙴𝚈』",--10
"『𝟹𝙼 𝙼𝙾𝙽𝙴𝚈』",--11
"『𝟷𝙼 𝙼𝙾𝙽𝙴𝚈』",--12
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴍᴏɴᴇʏ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
	if BB == nil then
       gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
    else
    
    if BB == 1 then
    BBB1()
    end
    
    if BB == 2 then
    BBB2()
    end
    
    if BB == 3 then
   BBB3()
   end
   
    if BB == 4 then
    BBB4()
    end
    
        if BB == 5 then
    BBB5()
    end
    
        if BB == 6 then
    BBB6()
    end
    
        if BB == 7 then
    BBB7()
    end
    
        if BB == 8 then
    BBB8()
    end
    
        if BB == 9 then
    BBB9()
    end
    
        if BB == 10 then
    BBB10()
    end
    
        if BB == 11 then
    BBB11()
    end
    
        if BB == 12 then
    BBB12()
    end
    
    if BB == 13 then
    BBB13()
    end
    
    
      if BB == 14 then
  M2()
end

end
K2 = - 1
end
  
  
  function BBB1()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("16;17;18;19;20;21;22;23;24;25;32:41",gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("16", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(9999, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("10000000", gg.TYPE_DWORD)
gg.alert("𝚂𝙴𝙽𝙳 1000 𝚃𝙾 𝚃𝙷𝙴 𝙿𝙻𝙰𝚈𝙴𝚁 𝚈𝙾𝚄 𝚆𝙰𝙽𝚃","")
end



function BBB2()---2B MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢 𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 3 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(1E38,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(500000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 2B MONEY")
gg.clearResults(100)
gg.clearList()
end

function BBB3()----1B MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢 𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(1000000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(500000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 1B MONEY")
gg.clearResults(100)
gg.clearList()
end

function BBB4()---50M MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.toast("ᴀᴄᴛɪᴠᴀᴛɪɴɢ ᴄʜᴇᴀᴛ")
    gg.sleep(6000)
    gg.clearResults()
    gg.clearList()
    gg.toast("ACTIVATING CHEAT HACK...")
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("60", gg.TYPE_FLOAT)
    revert = gg.getResults(13258)
    gg.editAll("50000000", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.alert("GO TO OTHER AND CLICK LEVEL 3 PARKING")
    gg.sleep(3000)
    gg.toast("𝐂𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃✔️")
    gg.clearResults()
    gg.clearList()
  end

function BBB5()---45M MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 ??𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 ??𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(45000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(50000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 45M MONEY")
gg.clearResults(100)
gg.clearList()
end

function BBB6()---40M MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(40000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(50000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 40M MONEY")
gg.clearResults(100)
gg.clearList()
end

function BBB7()---30M MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(30000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(500000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 30M MONEY")
gg.clearResults(100)
gg.clearList()
  end

function BBB8()--20M money
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(20000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(500000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 20M MONEY MONEY")
gg.clearResults(100)
gg.clearList()
end

function BBB9()---15M MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(15000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(50000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 15M MONEY")
gg.clearResults(100)
gg.clearList()
end

function BBB10()---10M MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(10000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(500000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 10M MONEY")
gg.clearResults(100)
gg.clearList()
end

function BBB11()--5M MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(5000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(500000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✔CONGRATS YOU HAVE 5M MONEY")
gg.clearResults(100)
gg.clearList()
end

function BBB12()--3M MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(3000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(500000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 3M MONEY")
gg.clearResults(100)
gg.clearList()
end

function BBB13()--1M MONEY
gg.setVisible(false)
gg.alert ("𝗚𝗢𝗧𝗢 𝗟𝗘𝗩𝗘𝗟 𝗔𝗡𝗗 𝗖𝗟𝗜𝗖𝗞 𝗟𝗘𝗩𝗘𝗟 1 𝗧𝗛𝗘𝗡 𝗖𝗟𝗜𝗖𝗞 𝗢𝗡 𝗧𝗛𝗘 𝗚𝗚 𝗟𝗢𝗚𝗢 𝗧𝗢 𝗦𝗧𝗔𝗥𝗧")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber(50000000,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(1000000,gg.TYPE_FLOAT)
gg.processResume()
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(60,gg.TYPE_FLOAT)
 gg.getResults(9999)
 gg.setVisible(false)
gg.editAll(500000000,gg.TYPE_FLOAT)
gg.alert("CLICK THE OTHER LEVEL AND SELECT THE THIRD CHALLENGE")
  gg.sleep(4000)
  gg.alert("CLICK THE ACCEPT CHALLENGE")
     gg.alert("✓CONGRATS YOU HAVE 1M MONEY")
gg.clearResults(100)
gg.clearList()
end


function MMM2()----public static int GetFromPrefs() { }
AA = gg.choice({
    "『𝟮𝙼 𝙲𝙾𝙸𝙽』",---2
    "『𝟱𝟬𝟬𝙺 𝙲𝙾𝙸𝙽』",--3
	"『𝟱𝟬𝙺 𝙲𝙾𝙸𝙽』",--4
	"『𝟰𝟬𝙺 𝙲𝙾𝙸𝙽』",--5
	"『𝟯𝟬𝙺 𝙲𝙾𝙸𝙽』",--6
	"『𝟮𝟬𝙺 𝙲𝙾𝙸𝙽』",--7
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴄᴏɪɴ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
	if AA == nil then
        gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
    else
    
    if AA == 1 then
    AAA1()
    end
    
    if AA == 2 then
    AAA2()
    end
    
    if AA == 3 then
    AAA3()
    end
    
    if AA == 4 then
   AAA4()
   end
   
    if AA == 5 then
    AAA5()
    end
    
    if AA == 6 then
    AAA6()
    end
   
      
  if AA == 7 then
  M2()
end

end
K2 =- 1
end




function AAA1()---2m
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844 setvalue(Tester+Lua,16,-3.77822904e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844+0x4 setvalue(Tester+Lua,16,-6.13017998e13)
gg.toast("𝐂𝐋𝐈𝐂𝐊 𝐂𝐎𝐈𝐍 𝐁𝐀𝐑")
end

function AAA2()---500k
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844 setvalue(Tester+Lua,16,-3.43605772e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844+0x4 setvalue(Tester+Lua,16,-6.13017998e13)
gg.toast("𝐂𝐋𝐈𝐂𝐊 𝐂𝐎𝐈𝐍 𝐁𝐀𝐑")
end

function AAA3()----50k
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844 setvalue(Tester+Lua,16,-3.27306707e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844+0x4 setvalue(Tester+Lua,16,-6.13017998e13)
gg.toast("𝐂𝐋𝐈𝐂𝐊 𝐂𝐎𝐈𝐍 𝐁𝐀𝐑")
end

function AAA4()----40k
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844 setvalue(Tester+Lua,16,-3.16820947e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844+0x4 setvalue(Tester+Lua,16,-6.13017998e13)
gg.toast("𝐂𝐋𝐈𝐂𝐊 𝐂𝐎𝐈𝐍 𝐁𝐀𝐑")
end

function AAA5()----30k
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844 setvalue(Tester+Lua,16,-3.06335187e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844+0x4 setvalue(Tester+Lua,16,-6.13017998e13)
gg.toast("𝐂𝐋𝐈𝐂𝐊 𝐂𝐎𝐈𝐍 𝐁𝐀𝐑")
end

function AAA6()---20k
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844 setvalue(Tester+Lua,16,-2.95849427e11)
Tester=gg.getRangesList('libil2cpp.so')[2].start
Lua=0x3121844+0x4 setvalue(Tester+Lua,16,-6.13017998e13)
gg.toast("𝐂𝐋𝐈𝐂𝐊 𝐂𝐎𝐈𝐍 𝐁𝐀𝐑")
end




function MMM3()
dd = gg.choice({
  "『𝚁𝚎𝚍𝚞𝚌𝚎 𝙲𝚘𝚒𝚗 𝟑𝟎𝚔』",
  "『𝚁𝚎𝚍𝚞𝚌𝚎 𝙲𝚘𝚒𝚗 𝟐𝟎𝚔』",
  "『𝚁𝚎𝚍𝚞𝚌𝚎 𝙲𝚘𝚒𝚗 𝟏𝟎𝚔』",
  "『𝚁𝚎𝚍𝚞𝚌𝚎 𝙲𝚘𝚒𝚗 𝟓𝟎𝚔』",
  "『𝚁𝚎𝚍𝚞𝚌𝚎 𝙲𝚘𝚒𝚗 𝟕𝟎𝚔』",
  "『𝚁𝚎𝚍𝚞𝚌𝚎 𝙲𝚘𝚒𝚗 𝟏𝟎𝟎𝚔』",
  "『𝚁𝚎𝚍𝚞𝚌𝚛 𝙲𝚘𝚒𝚗 𝟑𝟎𝟎𝚔』",
  "『𝚁𝚎𝚍𝚞𝚌𝚎 𝙲𝚘𝚒𝚗 𝟑𝟎𝚔 (via) 𝙲𝙰𝚁』",
  "『𝚁𝚎𝚍𝚞𝚌𝚎 𝙲𝚘𝚒𝚗 𝟐𝟎𝚔 (via) 𝙲𝙰𝚁』",
  "『𝚁𝚎𝚍𝚞𝚌𝚎 𝙲𝚘𝚒𝚗 𝟏𝟎𝚔 (via) 𝙲𝙰𝚁』",
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ʀᴇᴅᴜᴄᴇ ᴄᴏɪɴ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
   if dd == nil then
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
    else
    
    if dd == 1 then
    DDD1()
    end
    
    if dd == 2 then
    DDD2()
    end
    
    if dd == 3 then
    DDD3()
    end
    
    if dd == 4 then
    DDD4()
    end
    
    if dd == 5 then
    DDD5()
    end
    
    if dd == 6 then
    DDD6()
    end
    
    if dd == 7 then
    DDD7()
    end
    
    if dd == 8 then
    DDD8()
    end
    
    if dd == 9 then
    DDD9()
    end
    
    if dd == 10 then
    DDD10()
    end
    
if dd == 11 then
  M2()
end

end
K2 = - 1
end

function DDD1()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("300;300;300;300;300;300;300;300;300;300", gg.TYPE_DWORD)
  
  gg.getResults(100)
  gg.editAll("-470000", gg.TYPE_DWORD)
  gg.toast("BUY ONE SHADE TO REDUCE COIN TO 30K")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults(100)
end

function DDD2()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("300;300;300;300;300;300;300;300;300;300", gg.TYPE_DWORD)
  
  gg.getResults(100)
  gg.editAll("-480000", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("BUY ONE SHADE TO REDUCE COIN TO 20K")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function DDD3()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("300;300;300;300;300;300;300;300;300;300", gg.TYPE_DWORD)
 
 gg.getResults(100)
  gg.editAll("-490000", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("BUY ONE SHADE TO REDUCE COIN TO 10K")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function DDD4()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("300;300;300;300;300;300;300;300;300;300 ", gg.TYPE_DWORD)
  
  gg.getResults(100)
  gg.editAll("-450000", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("BUY ONE SHADE TO REDUCE COIN TO 50K")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function DDD5()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("300;300;300;300;300;300;300;300;300;300", gg.TYPE_DWORD)
  
  gg.getResults(100)
  gg.editAll("-430000", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("BUY ONE SHADE  TO REDUCE COIN TO 70K")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function DDD6()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("300;300;300;300;300;300;300;300;300;300", gg.TYPE_DWORD)
  
  gg.getResults(100)
  gg.editAll("-400000", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("BUY ONE SHADE TO REDUCE COIN TO 100K")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function DDD7()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("300;300;300;300;300;300;300;300;300;300", gg.TYPE_DWORD)
  
  gg.getResults(100)
  gg.editAll("-200000", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("BUY ONE SHADE TO REDUCE COIN TO 300K")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function DDD8()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("Processing Instructions...")
  gg.sleep(4000)
  gg.searchNumber("30", gg.TYPE_DWORD)

  gg.getResults(100)
  gg.toast("CHANGE THE 50COINS AND WAIT FOR THE INSTRUCTION!!")
  gg.sleep(6000)
  gg.refineNumber("50", gg.TYPE_DWORD)
  gg.getResults(2)
  gg.editAll("-470000", gg.TYPE_DWORD)
  gg.clearResults(2)
  gg.toast("CLICK THE RIGHT BUTTON")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function DDD9()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("Processing Instructions...")
  gg.sleep(2500)
  gg.searchNumber("30", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("CHANGE THE 50COINS AND WAIT FOR THE INSTRUCTION!!")
  gg.sleep(6000)
  gg.refineNumber("50", gg.TYPE_DWORD)
  gg.getResults(2)
  gg.editAll("-480000", gg.TYPE_DWORD)
  gg.clearResults(2)
  gg.toast("CLICK THE RIGHT BUTTON")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function DDD10()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("Processing Instructions...")
  gg.sleep(3000)
  gg.searchNumber("30", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("CHANGE THE 50COINS AND WAIT FOR THE INSTRUCTION!!")
  gg.toast(5000)
  gg.refineNumber("50", gg.TYPE_DWORD)
  gg.getResults(2)
  gg.editAll("-490000", gg.TYPE_DWORD)
  gg.clearResults(2)
  gg.toast("CLICK THE RIGHT BUTTON")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function DDD11()
gg.alert("BEFORE U USE REDUCE COIN MAKE SURE YOUR GOLD COIN IS 500K","BACK")
MM()
end


function MMM4()
MOD = gg.choice({
  "『𝟵𝟬𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟵𝟮𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟵𝟵𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟭𝟬𝟬𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟭𝟯𝟭𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟮𝟬𝟬𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟯𝟬𝟬𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟯𝟭𝟯𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟰𝟬𝟬𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟰𝟭𝟰𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟱𝟬𝟬𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟵𝟮𝟱𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟵𝟵𝟵𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟭𝟲𝟵𝟱𝚑𝚙 𝙸𝙽𝙽𝙴𝚁』",
  "『𝟭𝟲𝟵𝟱𝚑𝚙 𝙽𝙾𝚁𝙼𝙰𝙻』",
  "『𝙲𝚄𝚂𝚃𝙾𝙼 𝙷𝙿』", 	
  "『𝙲𝙷𝙴𝙰𝚃 𝙸𝙽𝙵𝙾』",
	"𝑹𝒆𝒕𝒖𝒓𝒏"
	}, nil,"👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴛᴜɴᴇ ɪɴɴᴇʀ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if MOD == nil then
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if MOD == 1 then 
FQ1() 
end---

if MOD == 2 then
 FQ2() 
end-----

if MOD == 3 then 
FQ3()

 end-----
if MOD == 4 then
 FQ4() 
end---

if MOD == 5 then 
FQ5() 
end-----

if MOD == 6 then 
FQ6() 
end-----

if MOD == 7 then 
FQ7() 
end---

if MOD == 8 then 
FQ8() 
end-----

if MOD == 9 then 
FQ9()
 end-----
 
if MOD == 10 then 
FQ10()
 end---
 
if MOD == 11 then
 FQ11()
 end
 
 if MOD == 12 then
 FQ12()
 end
 
 if MOD == 13 then
 FQ13()
 end
 
 if MOD == 14 then
 FQ14 ()
 end
 
 if MOD == 15 then
 FQ15 ()
 end
 
if MOD == 16 then 
FQ16() 
end

if MOD == 17 then 
FQ17() 
end

if MOD == 18 then
 M2() 
end

end
K2 = -1
end 

function FQ1()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("90", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ2()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("92", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ3()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("99", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ4()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("100", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ5()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("131", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ6()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("200", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ7()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("300", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ8()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("313", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ9()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("400", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ10()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("414", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function FQ11()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("500", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2300", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7899", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function FQ12()
gg.alert("KAITO CPM")
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
     gg.searchNumber("240", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("925", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("310", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("6800", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("4500", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7899", gg.TYPE_FLOAT)
gg.processResume()
gg.alert("BUY ENGINE V6.3.0 / TIRE,BRAKE,FAST GEARBOX")
end

function FQ13()
gg.alert("KAITO CPM")
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
     gg.searchNumber("240", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("324", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("310", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2300", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("6800", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("4500", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7899", gg.TYPE_FLOAT)
gg.processResume()
gg.alert("BUY ENGINE V6.3.0 / TIRE,BRAKE,FAST GEARBOX")
end

function FQ14()
gg.alert("KAITO CPM")
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
     gg.searchNumber("240", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1695", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("310", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2299", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("6800", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8000", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("4500", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7997", gg.TYPE_FLOAT)
gg.processResume()
gg.alert("BUY ENGINE V6.3.0 / TIRE,BRAKE,FAST GEARBOX")
end

function FQ15()
gg.alert("KAITO CPM")
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
     gg.searchNumber("240", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1695", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("310", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2254", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("6800", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7000", gg.TYPE_FLOAT)

gg.clearResults()
gg.searchNumber("4500", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("3500", gg.TYPE_FLOAT)
gg.processResume()
gg.alert("BUY ENGINE V6.3.0 / TIRE,BRAKE,FAST GEARBOX")
end


function FQ16()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
Z = gg.prompt({" HP:"," NM:"," HP RPM:"," NM RPM:"," SHIFT TIME:",},
{[1]=""},
{[2]=""},
{[3]=""},
{[4]=""},
{[5]=""},
{["1,2,3,4,5"] ="number"})
if not Z then return end

gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setVisible(false)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(5)
  gg.editAll(Z[1], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll(Z[2], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll(Z[3], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll(Z[4], gg.TYPE_FLOAT)
  gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll(Z[5], gg.TYPE_FLOAT)
gg.toast("NOW BUY THE ENGINE V6 3.0 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
  gg.clearResults()
end
function FQ17()
gg.alert("ALL THE OF THE ENGINE MENU CHEATS WILL APPLY WITH THE ENGINE V6 3.0\n\n⚠️WARNING⚠️\nDON'T USE ALL THE CHEATS AT THE SAME TIME IT WILL NOT WORK ","BACK")
MMM4()
end

function MMM5()
BBA = gg.choice({
  "『𝟭𝟲𝟵𝟱𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
  "『𝟭𝟲𝟵𝟱𝚑𝚙 (𝚂𝙴𝙼𝙸)』",
  "『𝟵𝟮𝟱𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷』",
  "『𝟵𝟮𝟱𝚑𝚙 (𝚂𝙴𝙼𝙸)』",
  "『𝟭𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
  "『𝟲𝟮𝟴𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
  "『𝟰-𝟱 𝚂𝙴𝙲𝙾𝙽𝙳 (𝚂𝙴𝙼𝙸)』",
  "『𝟲𝟭𝟵𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
  "『𝟭𝟲𝟭𝟵𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
  "『𝟭𝟭𝟬𝟬𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
  "『𝟵𝟵𝟵.𝟵𝟵𝟵𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟴𝟴𝟴.𝟴𝟴𝟴𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟳𝟳𝟳.𝟳𝟳𝟳𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟲𝟲𝟲.𝟲𝟲𝟲𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟱𝟱𝟱.𝟱𝟱𝟱𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟰𝟰𝟰.𝟰𝟰𝟰𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟯𝟯𝟯.𝟯𝟯𝟯𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟮𝟮𝟮.𝟮𝟮𝟮𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟭𝟭𝟭.𝟭𝟭𝟭𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟭𝟬𝟭𝟬.𝟭𝟬𝟭𝟬𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟵𝟵.𝟵𝟵𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟭𝟯𝟵.𝟵𝟵𝟵𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)",
"『𝟭𝟮𝟵𝟵.𝟵𝟵𝟵𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟭𝟰𝟵𝟵.𝟵𝟵𝟵𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟭𝟱𝟵𝟵.𝟵𝟵𝟵𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟵𝟵𝟵𝟵.𝟵𝟵𝟵𝟵𝚑𝚙 (𝙶𝙻𝙸𝚃𝙲𝙷)』",
"『𝟵𝟵𝟵𝚑𝚙 (𝚃𝚄𝙽𝙴)』",
"『𝙶𝙻𝙸𝚃𝙲𝙷 𝙲𝙰𝚁𝚂』",
"『𝙲𝚄𝚂𝚃𝙾𝙼 𝙷𝙿』",
"『𝙲𝙷𝙴𝙰𝚃 𝙸𝙽𝙵𝙾』",
"𝑹𝒆𝒕𝒖𝒓𝒏"
}, nil,"👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴛᴜɴᴇ ɢʟɪᴛᴄʜ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if BBA == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if BBA == 1 then NICE1() end---
if BBA == 2 then NICE2() end-----
if BBA == 3 then NICE3() end-----
if BBA == 4 then NICE4() end---
if BBA == 5 then NICE5() end-----
if BBA == 6 then NICE6() end---
if BBA == 7 then NICE7() end-----
if BBA == 8 then NICE8() end-----
if BBA == 9 then NICE9() end---
if BBA == 10 then NICE10() end-----
if BBA == 11 then NICE11() end---
if BBA == 12 then NICE12() end-----
if BBA == 13 then NICE13() end-----
if BBA == 14 then NICE14() end---
if BBA == 15 then NICE15() end-----
if BBA == 16 then NICE16() end---
if BBA == 17 then NICE17() end-----
if BBA == 18 then NICE18() end-----
if BBA == 19 then NICE19() end---
if BBA == 20 then NICE20() end-----
if BBA == 21 then NICE21() end---
if BBA == 22 then NICE22() end-----
if BBA == 23 then NICE23() end-----
if BBA == 24 then NICE24() end---
if BBA == 25 then NICE25() end-----
if BBA == 26 then NICE26() end---
if BBA == 27 then NICE27() end-----
if BBA == 28 then NICE28() end-----
if BBA == 29 then NICE29() end---
if BBA == 30 then NICE30() end
if BBA == 31 then M2() end
end
K2 =-1
end 

function NICE1()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1695", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1001", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("2500", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE2()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1695", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("3000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE3()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("925", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1001", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("2500", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE4()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("925", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7600", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE5()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1001", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("2500", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE6()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("628", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1001", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("2500", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE7()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1695", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("4949", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("4898", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE8()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("619", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("8500", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("7454", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE9()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.alert("RESET GEARBOX FIRST")
  gg.sleep(3000)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1619", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1001", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("2020", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("6", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("40", gg.TYPE_FLOAT)
  gg.clearResults(10)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE10()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.toast("FIRST RESET YOUR GEARBOX")
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1100", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("1288", gg.TYPE_FLOAT)
  gg.clearResults(4)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1000", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("2200", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("6", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("40", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
  function NICE11()
  gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("999.999",gg.TYPE_FLOAT)
gg.clearResults(2)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("999.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE12() 
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("888.888",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("888.888",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE13()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("777.777",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("777.777",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("0.1",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("1E-30",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE14()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("666.666",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("666.666",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("3000",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("1E-10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE15()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("555.555",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("555.555",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE16() 
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("444.444",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("444.444",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE17()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("333.333",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("333.333",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE18() 
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("222.222",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("222.222",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE19()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("111.111",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("111.111",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE20() 
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1010.1010",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1010.1010",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE21() 
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("99.99",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("99.99",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE22()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1399.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1399.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE23()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1299.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1299.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE24()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1499.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1499.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE25()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1099.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1099.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE26()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("9999.9999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("9999.9999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE27()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("190",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("2254",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("5900",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("8500",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4100",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("7500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-05",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE28()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("1695", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll("2254", gg.TYPE_FLOAT)
  gg.clearResults(1)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll("1000", gg.TYPE_FLOAT)
  gg.clearResults(2)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(3)
  gg.editAll("1010", gg.TYPE_FLOAT)
  gg.clearResults(3)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function NICE29()
Z = gg.prompt({" HP:"," NM:"," HP RPM:"," NM RPM:"," SHIFT TIME:",},
{[1]=""},
{[2]=""},
{[3]=""},
{[4]=""},
{[5]=""},
{["1,2,3,4,5"] ="number"})
if not Z then return end

gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setVisible(false)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("190", gg.TYPE_FLOAT)
  gg.getResults(5)
  gg.editAll(Z[1], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll(Z[2], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("5900", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll(Z[3], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("4100", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll(Z[4], gg.TYPE_FLOAT)
  gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll(Z[5], gg.TYPE_FLOAT)
  gg.toast("NOW BUY THE ENGINE L4 2.5 And Buy The Touring Tires And Fast Gearbox")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
  gg.clearResults()
end

function NICE30()
gg.alert("ALL THE OF THE ENGINE MENU CHEATS WILL APPLY WITH THE ENGINE L4 2.5\n\n⚠️WARNING⚠️\nDON'T USE ALL THE CHEATS AT THE SAME TIME IT WILL NOT WORK ","BACK")
MMM5()
end
  
  	function MMM6()
jj = gg.choice({
       "『𝙰𝚗𝚝𝚒 𝙳𝚊𝚖𝚐𝚎 𝙱𝚘𝚍𝚢』",
	   "『𝙰𝚗𝚝𝚒 𝙳𝚊𝚖𝚊𝚐𝚎 𝙴𝚗𝚐𝚒𝚗𝚎』",
	   "『𝚄𝚗𝚕𝚒𝚖𝚒𝚝𝚎𝚍 𝙵𝚞𝚎𝚕』",
   	"『𝚄𝚗𝚕𝚒𝚖𝚒𝚝𝚎𝚍 𝚃𝚒𝚛𝚎』",
       "『𝙽𝚘𝚛𝚖𝚊𝚕 𝙼𝚘𝚍𝚎』",
       "『𝙽𝚘𝚛𝚖𝚊𝚕 𝙼𝚘𝚍𝚎 𝙾𝚏𝚏』",
       "『𝙷𝚊𝚗𝚍 𝙱𝚛𝚊𝚔𝚎 𝙼𝚘𝚍𝚎』",
       "『𝙷𝚊𝚗𝚍 𝙱𝚛𝚊𝚔𝚎 𝙼𝚘𝚍𝚎 𝙾𝚏𝚏』",
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴄᴀʀ ʙᴇɴᴇғɪᴛs ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
   if jj == nil then
       gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
    else
    
    if jj == 1 then
    JJJ1()
    end
    
    if jj == 2 then
    JJJ2()
    end
    
    if jj == 3 then
    JJJ3()
    end
    
    if jj == 4 then
    JJJ4()
    end
    
    if jj == 5 then
    JJJ5()
    end
    
    if jj == 6 then
    JJJ6()
    end
    
    if jj == 7 then
    JJJ7()
    end
    
     if jj == 8 then
    JJJ8()
    end
    
    if jj == 9 then
    M2()
    end
   
   end
   K2 = - 1
   end
    
    function JJJ1()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0,40000000596;5,0;0,10000000149:9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.refineNumber("5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("999", gg.TYPE_FLOAT)
gg.processResume()
gg.alert("⚡𝐂𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃⚡")
gg.clearResults()
end

function JJJ2()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("5;0.40000000596F;1;0.10000000149F:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.refineNumber("5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2E11", gg.TYPE_FLOAT)
gg.processResume()
gg.alert("⚡𝐂𝐎𝐌𝐏𝐋𝐄??𝐄𝐃⚡")
gg.clearResults()
end

function JJJ3()
gg.clearResults()
gg.clearList()
-- main code on
gg.alert("✅𝙈𝙄𝙉𝙄𝙈𝙐𝙈 𝙉𝙐𝙈𝘽𝙀𝙍 𝙄𝙎 300 𝘼𝙉𝘿 𝘼𝘽𝙊𝙑𝙀✅")
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("80", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("0", gg.TYPE_FLOAT)
gg.toast("✅𝙊𝙉✅")
gg.processResume()
end
    
function JJJ4()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(16384)
gg.searchNumber("-0.00005",16, false, 536870912, 0, -1, 0)
gg.getResults(99999)
gg.editAll("99999999",16)
gg.clearResults()
gg.sleep(500)
gg.toast("✅𝙊𝙉✅")
gg.processResume()
end


function JJJ5()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(32)
gg.searchNumber("2500", 16)
gg.getResults(999)
gg.editAll("-18000", 16)
gg.alert("✅𝙊𝙉✅")
gg.processResume()
end

function JJJ6()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(32)
gg.searchNumber("-18000", 16)
gg.getResults(999)
gg.editAll("2500", 16)
gg.clearResults()
gg.toast("⭕𝐎??𝐅⭕")
gg.processResume()
end

function JJJ7()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(32)
gg.searchNumber("6000", 16)
gg.getResults(999)
gg.editAll("-3600", 16)
gg.clearResults()
gg.toast("✅𝙊𝙉✅")
gg.processResume()
end

function JJJJ8()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(32)
gg.searchNumber("6000", 16)
gg.getResults(999)
gg.editAll("-3600", 16)
gg.clearResults()
gg.toast("✅𝙊𝙉✅")
gg.processResume()
end

function JJJ9()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(32)
gg.searchNumber("-3600", 16)
gg.getResults(999)
gg.editAll("6000", 16)
gg.toast("⭕𝐎𝐅𝐅⭕")
gg.clearResults()
gg.processResume()
end

function MMM7()
ff = gg.choice({
	"『𝙲𝚑𝚛𝚘𝚖𝚎 𝚆𝚑𝚎𝚎𝚕』",
	"『𝙲𝚑𝚛𝚘𝚖𝚎 𝙲𝚊𝚛』",
	"『𝙲𝚑𝚛𝚘𝚖𝚎 𝚂𝚝𝚒𝚔𝚎𝚛』",
	"『𝙲𝚑𝚛𝚘𝚖𝚎 𝚆𝚒𝚗𝚍𝚘𝚠』",
	"『𝙲𝚑𝚛𝚘𝚖𝚎 𝙷𝚎𝚊𝚍𝚕𝚒𝚐𝚑𝚝』",
    "『𝙲𝚑𝚛𝚘𝚖𝚎 𝚂𝚙𝚘𝚒𝚕𝚎𝚛』",
    "『𝙲𝚑𝚛𝚘𝚖𝚎 𝚂𝚒𝚕𝚟𝚎𝚛 𝚖𝚊𝚐𝚜』",
    "『𝙲𝚑𝚛𝚘𝚖𝚎 𝚃𝚛𝚒𝚙𝚕𝚎』",
    "『𝙲𝚑𝚛𝚘𝚖𝚎 𝚂𝚙𝚎𝚌𝚞𝚕𝚊𝚛』",
    "silver chrome",
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴄʜʀᴏᴍᴇ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
   if ff == nil then
        gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
    else
    
    if ff == 1 then
    FFF1()
    end
    
    if ff == 2 then
    FFF2()
    end
    
    if ff == 3 then
    FFF3()
    end
    
    if ff == 4 then
    FFF4()
    end
    
    if ff == 5 then
    FFF5()
    end
    
    if ff == 6 then
    FFF6()
    end
    
    if ff == 7 then
    FFF7()
    end
    
    if ff == 8 then
    FFF8()
    end
    
    if ff == 9 then
    FFF9()
    end
    
    if ff == 10 then
    FFF10()
    end
    
    if ff == 11 then
    M2()
    end
    
    end
    K2 = - 1
    end
   
   function FFF1()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.alert("✅NOW SEARCH SPECULAR✅")
  gg.sleep(3000)
  gg.alert("SLIDE DOWN")
  gg.searchNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("14", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("⚡??𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃⚡")
end

function FFF2()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("NOW SEARCH REFLECTION AND SLIDE DOWN")
  gg.sleep(1500)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(1500)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬇️SLIDE DOWN⬇️")
  gg.sleep(1500)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.getResults(100)
  gg.sleep(1500)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬇️SLIDE DOWN⬇️")
  gg.sleep(1500)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(1500)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬇️SLIDE DOWN⬇️")
  gg.sleep(1500)
  gg.refineNumber("0", gg.TYPE_FLOAT)
gg.getResults(100)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(1500)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("-4", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("YOUR CAR IS CHROME NOW")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function FFF3()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.alert("NOW SEARCH SPECULAR")
  gg.sleep(3000)
  gg.searchNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("-24", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("⚡𝐂𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃⚡")
end

function FFF4()
gg.clearResults()
gg.clearList()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.3", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("14", gg.TYPE_FLOAT)
gg.clearResults()
gg.clearList()
gg.toast("⚡𝐂𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃⚡")
end

function FFF5()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.alert("✅NOW GO TO HEADLIGHT COLOUR✅")
  gg.sleep(3000)
  gg.searchNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.getResults(1000)
  gg.alert("✅NOW CHOICE YOUR COLOUR ✅")
  gg.editAll("-24", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("⚡𝐂𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃⚡")
end


function FFF6()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.alert("✅NOW GO TO SPOILER COLOUR✅ ")
  gg.sleep(3000)
  gg.toast("SLIDE DOWN")
  gg.sleep(3000)
  gg.searchNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("SLIDE UP")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("SLIDE DOWN")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.getResults(3000)
  gg.alert("✅NOW CHOICE YOUR COLOUR ✅")
  gg.editAll("25", gg.TYPE_FLOAT)
  gg.clearResults()
gg.toast("⚡𝐂𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃⚡")
end

function FFF7()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.alert("NOW SEARCH REFLECTION AND SLIDE DOWN")
  gg.sleep(3000)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.alert("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("50;50;50", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.alert("⚡𝐂𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃⚡")
end

function FFF8()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.alert("NOW SEARCH REFLECTION AND SLIDE DOWN")
  gg.sleep(3000)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.alert("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("22;50;31;-5", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.alert("⚡𝐂𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃⚡")
end

function FFF9()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.alert("Search for specular you have 5sec!")
  gg.sleep(5000)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.alert("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.alert("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.alert("⬆️ SLIDE UP ⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("22;50;31;-5", gg.TYPE_FLOAT)
  gg.clearResults(26)
  gg.alert("⚡𝐂𝐎𝐌𝐏𝐋𝐄𝐓𝐄𝐃⚡")
end   


function FFF10()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("NOW SEARCH REFLECTION AND SLIDE DOWN")
  gg.sleep(3000)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(3000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("50;50;50", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("YOUR CAR IS SILVER CHROME NOW")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end



function MMM8()
VJ = gg.choice({
	""..im,
	""..hp,
	""..qe,
	""..pi,
	""..tv,
	"『༒INFO CHEAT༒』",
	  "𝑹𝒆𝒕𝒖𝒓𝒏",
	}, nil,"👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ʟᴀᴍʙᴏ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if VJ == nil then
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if VJ == 1 then HRC1() end
if VJ == 2 then HRC2() end
if VJ == 3 then HRC3() end
if VJ == 4 then HRC4() end
if VJ == 5 then HRC5() end
if VJ == 6 then HRC6() end
if VJ == 7 then M2() end	
end
K2 = -1
end

im = "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙷𝚄𝚁𝚄𝙲𝙰𝙽』"
function HRC1()
if im == "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙷𝚄𝚁𝚄𝙲𝙰𝙽』" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setRanges(gg.REGION_CODE_APP) 
  gg.searchNumber("129", gg.TYPE_DWORD,false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("24", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("Go Find The #36 Car")
  gg.sleep(2000)
 gg.toast("ACTIVATED SUCCESSFULLY✅")
 im = "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙷𝚄𝚁𝚄𝙲𝙰𝙽』"
 elseif im == "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙷𝚄𝚁𝚄𝙲𝙰𝙽』" then
 gg.toast("Deactivating Cheat...")
 gg.sleep(2000)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("24", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("129", gg.TYPE_DWORD)
gg.clearResults(100)
  gg.toast("Deactivated Successfully✅")
 im = "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙷𝚄𝚁𝚄𝙲𝙰𝙽』"
 end
  end
  hp = "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰𝙳𝙾𝚁』"
function HRC2()
if hp == "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰𝙳𝙾𝚁』" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000) 
gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("153", gg.TYPE_DWORD,false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("66", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("Go Find The #6 Car!")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
  hp = "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰𝙳𝙾𝚁』"
  elseif hp == "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰??𝙾𝚁』" then
  gg.toast("Deactivating Cheat...")
gg.sleep(2000) 
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("66", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("153", gg.TYPE_DWORD)
gg.clearResults(100)
  gg.toast("Deactivated Successfully✅")
  hp = "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰𝙳𝙾𝚁』"
  end
end
qe = "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰𝙳𝙾𝚁 𝚂𝚅𝙹』"
function HRC3()
if qe == "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰𝙳𝙾𝚁 𝚂𝚅𝙹』" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("83", gg.TYPE_DWORD,false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("345", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("Go Find The #5 Car!")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
  qe = "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰𝙳𝙾𝚁 𝚂𝚅𝙹』"
  elseif qe == "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰𝙳𝙾𝚁 𝚂𝚅𝙹』" then 
  gg.toast("Deactivating Cheat...")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("345", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("83", gg.TYPE_DWORD)
gg.clearResults(100)
  gg.toast("Deactivated Successfully✅")
  qe = "『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙰𝚅𝙴𝙽𝚃𝙰𝙳𝙾𝚁 𝚂𝚅𝙹』"
end
end
pi = "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙶𝙰𝙻𝙻𝙰𝚁𝙳𝙾』"
function HRC4()
if pi == "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙶𝙰𝙻𝙻𝙰𝚁𝙳𝙾』" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("71", gg.TYPE_DWORD,false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil) 
  gg.editAll("101", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("Go Find The #26 Car!")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
  pi = "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙶𝙰𝙻𝙻𝙰𝚁𝙳𝙾』"
  elseif pi == "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙶𝙰𝙻𝙻𝙰𝚁𝙳𝙾』"  then
   gg.toast("Deactivating Cheat...")
gg.sleep(2000) 
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("101", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("71", gg.TYPE_DWORD)
gg.clearResults(100)
  gg.toast("Deactivated Successfully✅")
  pi = "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝙶𝙰𝙻𝙻𝙰𝚁𝙳𝙾』"
end
end
tv = "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝚅𝙴𝙽𝙴𝙽𝙾』"
function HRC5()
if tv == "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝚅𝙴𝙽𝙴𝙽𝙾』" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("130", gg.TYPE_DWORD,false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("68", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("Go Find The #35 Car!")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
  tv = "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝚅𝙴𝙽𝙴𝙽𝙾』"
  elseif tv == "[✓]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝚅𝙴𝙽𝙴𝙽𝙾』" then
  gg.toast("Deactivating Cheat...")
gg.sleep(2000) 
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("68", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("130", gg.TYPE_DWORD)
gg.clearResults(100)
  gg.toast("Deactivated Successfully✅")
  tv = "[X]『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙹𝙸𝙽𝙸 𝚅𝙴𝙽𝙴𝙽𝙾』"
end
end
function HRC6()
gg.alert("LAMBO INFORMATION:\n#1.༒LAMBORGHINI HURUCAN༒ = #36 Car\n#2.༒LAMBORGHINI AVENTADOR༒ = #6 Car\n#3.༒LAMBORGHINI AVENTADOR SVJ༒ = #5 Car\n#4.༒LAMBORGHINI GALLARDO༒ = #26 Car\n#5.༒LAMBORGHINI VENENO༒ = #35 Car\n\n⚠️Tap 1 Cheat To Activate, if The Cheat Mark is [X] it means its off if the mark is [✓] it means the cheat is activated⚠️.\n\n OWNER MESSAGE FROM: Sold ")
MMM8()
end

function MMM9()
KIT = gg.choice({
  "『𝙽𝙸𝚉𝚉𝙰𝙽 350𝚉』",
  "『𝙳𝙾𝙳𝙶𝙴 𝚅𝙸𝙿𝙴𝚁』",
  "『𝙼𝙴𝚁𝙲𝙴𝙳𝙴𝚂 𝙶𝚃63』",
  "『𝙱𝙼𝚆 𝙼8』",
  "『𝙼𝙴𝚁𝙲𝙴𝙳𝙴𝚂 𝙱𝙴𝙽𝚉』",
  "『𝙱𝙼𝚆 𝙸𝙼8』",
  "『𝙽𝙸𝚂𝚂𝙰𝙽 240 𝚜𝚡』",
  "『𝙻𝙰𝙼𝙱𝙾𝚁𝙶𝙷𝙸𝙽𝙸 𝚄𝚁𝚄𝚂』",
  "『𝙱𝙼𝚆 𝙼2』",
  "『𝚃𝙾𝚈𝙾𝚃𝙰 𝙲𝙰𝙼𝚁𝚈』",
  "『𝙷𝚄𝙼𝙼𝙴𝚁 𝙷1』",
  "『2016 𝙱𝙼𝚆 𝚂𝚇』",
  "『2017 𝙱𝙼𝚆 𝙼17』",
  "『2017 𝙼𝙴𝚁𝙲𝙴𝙳𝙴𝚂 𝙱𝙴𝙽𝚉』",
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴘʀᴇᴍɪᴜᴍ ᴄᴀʀs ᴍᴇɴᴜ"..os.date('\n\n🌅??𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if KIT == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if KIT == 1 then PK1() end
if KIT == 2 then PK2() end
if KIT == 3 then PK3() end
if KIT == 4 then PK4() end
if KIT == 5 then PK5() end
if KIT == 6 then PK6() end
if KIT == 7 then PK7() end
if KIT == 8 then PK8() end
if KIT == 9 then PK9() end
if KIT == 10 then PK10() end
if KIT == 11 then PK11() end
if KIT == 12 then PK12() end
if KIT == 13 then PK13() end
if KIT == 14 then PK14() end
if KIT == 15 then M2() end
end
K2 =-1
end

function PK1()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("325", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND NISSAN 350Z CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK2()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("321", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND DODGE VIPER CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK3()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("322", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND MERCEDES GT63 CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK4()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("324", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND BMW M8 CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK5()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("310", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND MERCEDES BENZ CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK6()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("312", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND BMW i8 CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK7()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("305", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND NISSAN 240SX CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK8()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("293", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND LAMBORGHINI URUS CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK9()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("295", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND THE NUMBER #35 CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK10()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("288", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND THE NUMBER #35 CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK11()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("281", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND HAMMER H1 CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK12()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("280", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND 2016 BMW X6 CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK13()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("260", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND 2017 BMW M5 (F90) CAR")
 gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function PK14()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("134", gg.TYPE_DWORD)
  gg.getResults(36)
  gg.editAll("276", gg.TYPE_DWORD)
  gg.clearResults(36)
  gg.toast("FIND 2017 MERCEDES BENZ AMG E63 CAR")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

	function MMM10()
jj = gg.choice({
    "『𝙽𝚒𝚐𝚑𝚝 𝙼𝚘𝚍𝚎 𝙾𝚗』",----1
	"『𝙽𝚒𝚐𝚑𝚝 𝙼𝚘𝚍𝚎 𝙾𝚏𝚏』",----2
	"『𝚆𝚊𝚕𝚕𝙷𝙰𝚌𝚔 𝙾𝚗』",---3
	"『𝚆𝚊𝚕𝚕𝙷𝚊𝚌𝚔 𝙾𝚏𝚏』",----4
	"『𝙶𝚑𝚊𝚙𝚑𝚒𝚌𝚜 𝙾𝚗』",---5
	"『𝙶𝚛𝚊𝚙𝚑𝚒𝚌𝚜 𝙾𝚏𝚏』",----6
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ɢʀᴀᴘʜɪᴄs ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
   if jj == nil then
       gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
    else
    
    if jj == 1 then
    LLL1()
    end
    
    if jj == 2 then
    LLL2()
    end
    
    if jj == 3 then
    LLL3()
    end
    
    if jj == 4 then
    LLL4()
    end
    
    if jj == 5 then
    LLL5()
    end
    
    if jj == 6 then
    LLL6()
    end
    
    if jj == 7 then
    M2()
    end
    
    end
    K2 = - 1
    end
    
    function LLL1()-----1
gg.clearResults()
gg.clearList()
-- main code off
gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("0.01", gg.TYPE_FLOAT)
  gg.getResults(1000)
  gg.editAll("-3", gg.TYPE_FLOAT)
  gg.getResults(1000)
 gg.toast("✅𝙊𝙉✅")
  gg.processResume()
end


function LLL2()---2
gg.clearResults()
gg.clearList()
-- main code off
gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("-3", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("0.01", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("⭕𝐎𝐅𝐅⭕")
   gg.processResume()
end


function LLL3()----3
gg.clearResults()
gg.clearList()
-- main code off
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-3.0892329216F;0.05999999866F;45.0F:9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("0.05999999866", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-9", gg.TYPE_FLOAT)
gg.processResume()
gg.toast("✅𝙊𝙉✅")
  gg.processResume()
end


function LLL4()---4
gg.clearResults()
gg.clearList()
-- main code off
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("0.05999999866", gg.TYPE_FLOAT)
gg.toast("⭕𝐎𝐅𝐅⭕")
  gg.processResume()
end


function LLL5()---5
gg.clearResults()
gg.clearList()
-- main code off
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("2.20000004768", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8", gg.TYPE_FLOAT)
gg.toast("✅𝙊𝙉✅")
gg.processResume()
end

function LLL6()---6
gg.clearResults()
gg.clearList()
-- main code off
gg.setRanges(gg.REGION_CODE_APP)
if revert ~= nil then gg.setValues(revert) end
gg.processResume()
gg.toast("⭕𝐎𝐅𝐅⭕")
gg.processResume()
end

 function MMM11()
MOD = gg.choice({
  "『𝙽𝙴𝚆 𝚁𝙾𝙾𝙵𝚃 𝙲𝙰𝚁』",--1
  "『𝙽𝙴𝚆 𝚁𝙾𝙾𝙵𝚃 𝙲𝙰𝚁』", ---2
  "『𝙽𝙴𝚆 𝚁𝙾𝙾𝙵𝚃 𝙲𝙰𝚁』",--3
  "『𝙽𝙴𝚆 𝚁𝙾𝙾𝙵𝚃 𝙲𝙰𝚁』",--4
  "『𝙽𝙴𝚆 𝚁𝙾𝙾𝙵𝚃 𝙲𝙰𝚁』",--5
  "『𝙽𝙴𝚆 𝚁𝙾𝙾𝙵𝚃 𝙲𝙰𝚁』",--6
  "『𝚁𝙾𝙾𝙵𝚃 𝚁𝙰𝙲𝙺』",--7
  "『𝙰𝙽𝚃𝙴𝙽𝙽𝙰』",--8
  "『𝙿𝚄𝚂𝙷 𝙱𝙰𝚁』",--9
  "『𝚂𝙺𝙸 𝙱𝙾𝚇』",--10
  "『𝚁𝙾𝙾𝙵 𝙻𝙸𝙶𝙷𝚃』",--11
  "『𝚁𝙾𝙾𝙵𝚃𝙾𝙿 𝙴𝚇𝙷𝙰𝚄𝚂𝚃 𝙿𝙸𝙿𝙴/𝚂𝙽𝙾𝚁𝙺𝙴𝙻』",--12
  "『𝙲𝙷𝙴𝙰𝚃 𝙸𝙽𝙵𝙾』",
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ʀᴏᴏғᴛᴏᴘ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if MOD == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if MOD == 1 then MENU1() end
if MOD == 2 then MENU2() end
if MOD == 3 then MENU3() end
if MOD == 4 then MENU4() end
if MOD == 5 then MENU5() end
if MOD == 6 then MENU6() end
if MOD == 7 then MENU7() end
if MOD == 8 then MENU8() end
if MOD == 9 then MENU9() end
if MOD == 10 then MENU10() end
if MOD == 11 then MENU11() end
if MOD == 12 then MENU12() end
if MOD == 13 then MENU13() end
if MOD == 14 then M2() end 
end
K2 =-1
end 
function MENU1()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.toast(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("17", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function MENU2()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("18", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function MENU3()---------YOUR VALUE
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("19", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function MENU4()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("20", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function MENU5()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("20", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function MENU6()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
    gg.toast("Processing Instructions")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("21", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function MENU7()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
    gg.toast("Processing Instructions")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(50)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(15)
  gg.toast("Select 𝙷𝚘𝚘𝚍 𝚅𝚎𝚗𝚝 𝚋𝚞𝚝 𝚍𝚘𝚗𝚝 𝙲𝚘𝚗𝚏𝚒𝚛𝚖 𝚒𝚝 𝚠??𝚒𝚝 𝚏o𝚛 𝚊 𝚒𝚗𝚜𝚝𝚛𝚞𝚌𝚝𝚒𝚘𝚗...")
  gg.sleep(6500)
  gg.editAll("69", gg.TYPE_DWORD)
  gg.clearResults(15)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function MENU8()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
    gg.toast("Processing Instructions")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("5", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function MENU9()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
    gg.toast("Processing Instructions")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults(4)
end
function MENU10()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
    gg.toast("Processing Instructions")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults(4)
end
function MENU11()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
    gg.toast("Processing Instructions")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("14", gg.TYPE_DWORD)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults(4)
end
function MENU12()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instruction...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select Hood Vent But Dont Confirm/Buy It Wait For An Instruction...")
  gg.sleep(6500)
  gg.editAll("13", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function MENU13()
gg.alert("NEW ROOFT MENU HACK INFO!!\n\nBefore Using One Of the Hack First Goto Extirior then bumper show room\n\n OWNER MESSAGE FROM: 𝙰𝚇𝙴𝙻 𝚂𝚄𝙿𝚁𝙴𝙼𝙴","BACK")
MMM11()
end

 function MMM12()
 RENZ = gg.choice({
  ""..rs,
  ""..kl,
  "『CHEAT INFO 』",
   "𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ʀᴀᴄᴇ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if RENZ == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if RENZ == 1 then BM1() end---
if RENZ == 2 then BM2() end-----
if RENZ == 3 then BM3() end-----
if RENZ == 4 then M2() end------ 
end
K2 =-1
end 

rs = "[X]༒1 SECOND RACE MODE༒"
function BM1()
if rs == "[X]༒1 SECOND RACE MODE༒" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.clearResults() 
gg.clearList() 
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("2500", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-500000", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("1.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("250", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_CODE_APP) 
gg.searchNumber("10000000", gg. TYPE_FLOAT, false, gg. EQUAL_SIGN, 0,-1, 0) 
revert = gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil) 
gg.editAll("3E-41", gg. TYPE_FLOAT) 
gg.clearResults(100) 
  gg.toast("ACTIVATED SUCCESSFULLY✅")
  rs = "[✓]༒1 SECOND RACE MODE༒"
  elseif "[✓]༒1 SECOND RACE MODE༒" then
  gg.toast("Deactivating Cheat...")
gg.sleep(1000)
  gg.clearResults() 
gg.clearList() 
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-500000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2500", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("250", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1.1", gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_CODE_APP) 
gg.searchNumber("3E-41", gg. TYPE_FLOAT, false, gg. EQUAL_SIGN, 0,-1, 0) 
revert = gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil) 
gg.editAll("10000000", gg. TYPE_FLOAT) 
gg.clearResults(100) 
gg.toast("Deactivated Successfully✅")
rs = "[X]༒1 SECOND RACE MODE༒"
end
end
kl = "[X]༒2 SECOND RACE MODE༒"
function BM2()
if kl == "[X]༒2 SECOND RACE MODE༒" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.clearList() 
gg.clearResults() 
gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("10000000", gg.TYPE_FLOAT,false, gg. EQUAL_SIGN, 0,-1,0)
    gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll("1e-41", gg.TYPE_FLOAT)
    gg.clearResults(100)    
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("2500", gg.TYPE_FLOAT,false, gg. EQUAL_SIGN, 0,-1,0)
    gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll("-99999", gg.TYPE_FLOAT)
    gg.clearResults(100)   
  gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1.1", gg.TYPE_FLOAT,false, gg. EQUAL_SIGN, 0,-1,0)
    gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll("4", gg.TYPE_FLOAT)
    gg.clearResults(100) 
  gg.toast("ACTIVATED SUCCESSFULLY✅")
  kl = "[✓]༒2 SECOND RACE MODE༒"
  elseif kl == "[✓]༒2 SECOND RACE MODE༒"then
  gg.toast("Deactivating Cheat...")
gg.sleep(1000)
  gg.clearList() 
gg.clearResults() 
gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1e-41", gg.TYPE_FLOAT,false, gg. EQUAL_SIGN, 0,-1,0)
    gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll("10000000", gg.TYPE_FLOAT)
    gg.clearResults(100)        
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("-99999", gg.TYPE_FLOAT,false, gg. EQUAL_SIGN, 0,-1,0)
    gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll("2500", gg.TYPE_FLOAT)
    gg.clearResults(100)    
  gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("4", gg.TYPE_FLOAT,false, gg. EQUAL_SIGN, 0,-1,0)
    gg.getResults(300, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll("1.1", gg.TYPE_FLOAT)
    gg. toast('Deactivated Successfully✅') 
    gg.clearResults(100) 
    kl = "[X]༒2 SECOND RACE MODE༒"
    end
end

function BM3()
gg.alert("MODE RACE HACK INFO!!\n\n Tap 1 Cheat To Activate, if The Cheat Mark is [X] it means its off if the mark is [✓] it means the cheat is activated.\n\n OWNER MESSAGE FROM: 𝙰𝚇𝙴𝙻 𝚂𝚄𝙿𝚁𝙴𝙼𝙴 ")
MMM12()
end
    
    
    function MMM13()
    OKI = gg.choice({
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝙼𝙴𝚁𝙲 𝙰𝙼𝙶』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝚁35』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 350𝚉』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝙱𝚁𝚉』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝚁𝚇7』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝙽𝚂𝚇』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝚁𝚇8』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝙳𝚄𝙲𝙺𝚃𝙰𝙸𝙻 𝙸𝙽𝙵𝙸𝙽𝙸𝚃𝚈』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝚆𝙸𝙽𝙶 𝙸𝙽𝙵𝙸𝙽𝙸𝚃𝚈』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝚆𝙸𝙽𝙶 𝙴𝙺9』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝙰𝚄𝙳𝙸 𝚁8𝚅8』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝙵𝙴𝚁𝚁𝙰𝚁𝙸』",
"『𝚂𝙿𝙾𝙸𝙻𝙴𝚁 𝚆𝙸𝙽𝙶 𝙱𝙼𝚆』",	
	 "𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :sᴘᴏɪʟᴇʀ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if OKI == nil then
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if OKI == 1 then BX1() end
if OKI == 2 then BX2() end
if OKI == 3 then BX3() end
if OKI == 4 then BX4() end
if OKI == 5 then BX5() end
if OKI == 6 then BX6() end
if OKI == 7 then BX7() end
if OKI == 8 then BX8() end
if OKI == 9 then BX9() end
if OKI == 10 then BX10() end
if OKI == 11 then BX11() end
if OKI == 12 then BX12() end
if OKI == 13 then BX13() end
if OKI == 14 then M2() end
end
K2 =-1
end

function BX1()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("16", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("𝚈𝚘𝚞 𝚌𝚊𝚗 𝙲𝚘𝚗𝚏𝚒𝚛𝚖 𝙽𝚘𝚠 𝚊𝚗𝚍 𝙲𝚑𝚊𝚗𝚐𝚎 𝚝𝚑𝚎 𝙲𝚊𝚛 𝚊𝚗𝚍 𝚐?? b𝚊𝚌?? 𝚝𝚘 𝚈𝚘𝚞𝚛 𝙲𝚊𝚛")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX2()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("19", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX3()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("41", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX4()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("49", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX5()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("65", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX6()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("69", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX7()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("77", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX8()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("95", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX9()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("96", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX10()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("106", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("𝚈𝚘𝚞 𝚌𝚊𝚗 𝙲𝚘𝚗𝚏𝚒𝚛𝚖 𝙽𝚘𝚠 𝚊𝚗𝚍 𝙲𝚑𝚊𝚗𝚐𝚎 𝚝𝚑𝚎 𝙲𝚊𝚛 𝚊𝚗𝚍 𝚐𝚘 𝙱a𝚌𝚔 𝚝𝚘 𝚈𝚘𝚞𝚛 𝙲𝚊𝚛")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX11()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("135", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX12()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("148", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function BX13()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
    gg.toast("Processing Instructions...")
  gg.setVisible(false)
  gg.sleep(4000)
  gg.toast("Select 2nd Front Bumper")
  gg.sleep(2000)
  gg.searchNumber("1",gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 3rd Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.toast("Select 4th Front Bumper")
  gg.sleep(2000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(4)
  gg.toast("Select The Last Spoiler But Don't Confirm it wait for the instruction")
  gg.sleep(6500)
  gg.editAll("155", gg.TYPE_DWORD)
  gg.clearResults(4)
  gg.toast("Confirm Then Change Your Car Then Go Back To Your Car!!")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function MMM14()
PEK = gg.choice({
  "『𝚄𝙽𝙻𝙾𝙲𝙺 𝙷𝙴𝙻𝙼𝙴𝚃』",
  "『𝚄𝙽𝙻𝙾𝙲𝙺 ??𝙻𝙾𝚅𝙴𝚂 𝙰𝙽𝙳 𝙱𝙰𝙶』",
  "『𝚄𝙽𝙻𝙾𝙲𝙺 𝙵𝚄𝙻𝙻 𝚂𝙴𝚃 𝙲𝙷𝙰𝚁𝙰𝙲𝚃𝙴𝚁』",
  "『𝚄𝙽𝙻𝙾𝙲𝙺 𝙵𝚄𝙻𝙻 𝚂𝙴𝚃 𝚂𝙷𝙰𝙳𝙴𝚂』",
  "『𝙲𝙷𝙴𝙰𝚃 𝙸𝙽𝙵𝙾』",
  "𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴅʀɪᴠᴇʀ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if PEK == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if PEK == 1 then QT1() end
if PEK == 2 then QT2() end
if PEK == 3 then QT3() end
if PEK == 4 then QT4() end
if PEK == 5 then QT5() end
if PEK == 6 then M2() end
end
K2 =-1
end

function QT1()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("100;100;100;200;200;200;200;200", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.editAll("0", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("TRY TO CHECK AT HELMETS")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function QT2()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("50;50;50;100;100;100;100", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.editAll("0", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("CHECK AT GLOVES AND BAGS")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function QT3()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("500;500;500;500;500;500;500;500;500;500;500;500;500;500", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.editAll("0", gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("CHECK AT CHARACTER FACE")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function QT4()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.searchNumber("300;300;300;300;300;300;300;300;300;300", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.editAll("0", gg.TYPE_DWORD)
  gg.clearResults(100)
gg.toast("CHECK AT SHADES")
gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function QT5()
gg.alert("CHARACTER MENU HACK INFO!!\n\nMAKE SURE TO USE THE HACK IN THE MAIN HOME OF CAR PARKING\n\n OWNER MESSAGE FROM: KAITO CPM")
MMM14()
end

function MMM15()
PTC = gg.choice({
  "『𝙲𝚄𝚂𝚃𝙾𝙼 𝙲𝙰𝚁 𝙲𝙾𝙳𝙴𝚂 𝚅1』",
  "『𝙲𝚄𝚂𝚃𝙾𝙼 𝙲𝙰𝚁 𝙲𝙾𝙳𝙴𝚂 𝚅2』",
  "『𝙲𝙰𝚁 𝙰𝙽𝙳 𝙲𝙰𝚁 𝙲𝙾𝙳𝙴 𝙻𝙸𝚂𝚃』",
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴄᴀʀ ᴄᴏᴅᴇ ʟɪsᴛ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if PTC == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if PTC == 1 then JD1() end
if PTC == 2 then JD2() end
if PTC == 3 then JD3() end
if PTC == 4 then M2() end
end
K2 =-1
end

function JD1()
Z = gg.prompt({"(V1)ENTER CAR CODE:",},
{[1]=""},
{["1"] ="number"})
if not Z then return end

gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("130", gg.TYPE_DWORD)
  gg.getResults(100)
  gg.editAll(Z[1], gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("NOW FIND THE #35 CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function JD2()
Z = gg.prompt({"(V2)ENTER YOUR CAR CODE:"," ENTER CAR CODE YOU WANT TO GET:",},
{[1]=""},
{[2]=""},
{["1,2,"] ="number"})
if not Z then return end
 
 gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber(Z[1], gg.TYPE_DWORD)
  gg.getResults(100)
  gg.editAll(Z[2], gg.TYPE_DWORD)
  gg.clearResults(100)
  gg.toast("NOW FIND YOUR CAR")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function JD3()
gg.alert("CAR:#1=89\nCAR:#2=307\nCAR:#3=306\nCAR:#4=19\nCAR:#5=83\nCAR:#6=153\nCAR:#7=256\nCAR:#8=258\nCAR:#9=55\nCAR:#10=33\nCAR:#11=72\nCAR:#12=119\nCAR:#13=116\nCAR:#14=2\nCAR:#15=35\nCAR:#16=81\nCAR:#17=355\nCAR:#18=390\nCAR:#19=44\nCAR:#20=85\nCAR:#21=57\nCAR:#22=385\nCAR:#23=406\nCAR:#24=352\nCAR:#25=407\nCAR:#26=71\nCAR:#27=102\nCAR:#28=1\nCAR:#29=262\nCAR:#30=118\nCAR:#31=0\nCAR:#32=67\nCAR:#33=338\nCAR:#34=264\nCAR:#35=130\nCAR:#36=129\nCAR:#37=326\nCAR:#38=327\nCAR:#39=328\nCAR:#40=329\nCAR:#41=73\nCAR:#42=274\nCAR:#43=41\nCAR:#44=32\nCAR:#45=136\nCAR:#46=311\nCAR:#47=313\nCAR:#48=374\nCAR:#49=384\nCAR:#50=377\nCAR:#51=389\nCAR:#52=84\nCAR:#53=96\nCAR:#54=133\nCAR:#55=69\nCAR:#56=400\nCAR:#57=6\nCAR:#58=87\nCAR:#59=48\nCAR:#60=86\nCAR:#61=325\nCAR:#62=348\nCAR:#63=17\nCAR:#64=(NOT AVAILABLE)\nCAR:#65=375\nCAR:#66=297\nCAR:#67=306\nCAR:#68=320\nCAR:#69=391\nCAR:#70=388\nCAR:#71=308\nCAR:#72=137\nCAR:#73=18\nCAR:#74=9\nCAR:#75=49\nCAR:#76=288\nCAR:#77=(NOT AVAILABLE)\nCAR:#78=8\nCAR:#79=98\nCAR:#80=23\nCAR:#81=373\nCAR:#82=343\nCAR:#83=275\nCAR:#84=80\nCAR:#85=360\nCAR:#86=5\nCAR:#87=295\nCAR:#88=279\nCAR:#89=21\nCAR:#90=53\nCAR:#91=3\nCAR:#92=40\nCAR:#93=337\nCAR:#94=272\nCAR:#95=(NOT AVAILABLE)\nCAR:#96=259\nCAR:#97=25\nCAR:#98=36\nCAR:#99=278\nCAR:#100=289\nCAR:#101=291\nCAR:#102=88\nCAR:#103=34\nCAR:#104=265\nCAR:#105=312\nCAR:#106=312\nCAR:#107=112\nCAR:#108=368\nCAR:#109=369\nCAR:#110=401\nCAR:#111=406\nCAR:#112=257\nCAR:#113=7\nCAR:#114=280\nCAR:#115=309\nCAR:#116=403\nCAR:#117=336\nCAR:#118=339\nCAR:#119=260\nCAR:#120=276\nCAR:#121=261\nCAR:#122=340\nCAR:#123=294\nCAR:#124=393\nCAR:#125=402\nCAR:#126=97\nCAR:#127=(NOT AVAILABLE)\nCAR:#128=(NOT AVAILABLE)\nCAR:#129=64\nCAR:#130=358\nCAR:#131=321\nCAR:#132=20\nCAR:#133=392\nCAR:#134=310\nCAR:#135=277\nCAR:#136=16\nCAR:#137=414\nCAR:#138=370\nCAR:#139=292\nCAR:#140=126\nCAR:#141=322\nCAR:#142=353\nCAR:#143=4\nCAR:#144=324\nCAR:#145=356\nCAR:#146=65\nCAR:#147=354\nCAR:#148=39\nCAR:#149=379\nCAR:#150=50\nCAR:#151=408\nCAR:#152=341\nCAR:#153=357\nCAR:#154=386\nCAR:#155=387","BACK")
MMM15()
end

function MMM16()
CP = gg.choice({
	"『𝚁𝙰𝚁𝙴 𝚁𝙸𝙼𝚂 𝙼𝙰𝙶𝚂』",
"『𝚂𝚄𝙿𝙴𝚁 𝚁𝙴𝙳 𝙼𝙰𝙶𝚂』",
"『𝚂𝚄𝙿𝙴𝚁 𝙶𝚁𝙴𝙴𝙽 𝙼𝙰𝙶𝚂』",
"『𝚂𝚄𝙿𝙴𝚁 𝙱𝙻𝚄𝙴 𝙼𝙰𝙶𝚂』",
"『𝚂𝚄𝙿𝙴𝚁 𝚈𝙴𝙻𝙻𝙾𝚆 𝙼𝙰𝙶𝚂』",
"『𝚂𝚄𝙿𝙴𝚁 𝙿𝙸𝙽𝙺 𝙼𝙰𝙶𝚂』",
"『𝚂𝚄𝙿𝙴𝚁 𝚃𝙾𝚁𝚀𝚄𝙸𝚂 𝙴𝙼𝙰𝙶𝚂』",
"『𝚂𝚄𝙿𝙴𝚁 𝚆𝙷𝙸𝚃𝙴 𝙼𝙰𝙶𝚂』",
"『𝚆𝙷𝙸𝚃𝙴/𝚂𝙸𝙻𝚅𝙴𝚁 𝙼𝙰𝙶𝚂』",
  "𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ʀᴀʀᴇ ᴍᴀɢs ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if CP == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if CP == 1 then WF1() end
if CP == 2 then WF2() end
if CP == 3 then WF3() end
if CP == 4 then WF4() end
if CP == 5 then WF5() end
if CP == 6 then WF6() end
if CP == 7 then WF7() end
if CP == 8 then WF8() end
if CP == 9 then WF9() end
if CP == 10 then M2() end
end
K2 =-1
end

function  WF1()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.toast("Proccesing instructions...")
gg.sleep(2000)
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast('Select #1 Mags')
gg.sleep(4000)
gg.searchNumber('1',gg.TYPE_DWORD)
gg.getResults(100)
gg.toast('Select #2 Mags')
gg.sleep(4000)
gg.refineNumber('2')
gg.getResults(8)
gg.toast('Select the #3 Mags')
gg.sleep(4000)
gg.refineNumber('3')
gg.getResults(2)
gg.toast('select the #1 Mags')
gg.sleep(4000)
gg.editAll('42',gg.TYPE_DWORD)
gg.clearResults(2)
gg.toast('Buy then change the car and go back to your car ')
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function WF2()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast('PRESS ANY WHEEELS YOU HAVE 5 SECOND  TO PRESS ANY WHEELS😉')
gg.toast('⬆️SLIDE UP ⬆️')
gg.sleep(5000)
gg.searchNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️SLIDE UP ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️ SLIDE UP ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll('200;-200;-200',gg.TYPE_FLOAT)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end
function WF3()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast('PRESS ANY WHEEELS YOU HAVE 5 SECOND  TO PRESS ANY WHEELS😉')
gg.sleep(5000)
gg.toast('⬆️SLIDE UP ⬆️')
gg.sleep(5000)
gg.searchNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️SLIDE UP ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️ SLIDE UP  ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll('-100;100;-100',gg.TYPE_FLOAT)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end
function WF4()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast('PRESS ANY WHEEELS YOU HAVE 5 SECOND  TO PRESS ANY WHEELS😉')
gg.sleep(5000)
gg.toast('⬆️SLIDE UP ⬆️')
gg.sleep(5000)
gg.searchNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️ SLIDE UP ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️ SLIDE UP  ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll('-100;100;-100',gg.TYPE_FLOAT)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end
function WF5()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast('PRESS ANY WHEEELS YOU HAVE 5 SECOND  TO PRESS ANY WHEELS😉')
gg.sleep(5000)
gg.toast('⬆️SLIDE UP⬆️')
gg.sleep(5000)
gg.searchNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️SLIDE UP ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️ SLIDE UP  ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll('200;200;-200',gg.TYPE_FLOAT)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end
function WF6()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast('PRESS ANY WHEEELS YOU HAVE 5 SECOND  TO PRESS ANY WHEELS😉')
gg.sleep(5000)
gg.toast('⬆️SLIDE UP ⬆️')
gg.sleep(5000)
gg.searchNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️SLIDE UP⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️ SLIDE UP ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll('200;-200;200',gg.TYPE_FLOAT)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end
function WF7()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast('PRESS ANY WHEEELS YOU HAVE 5 SECOND  TO PRESS ANY WHEELS😉')
gg.sleep(5000)
gg.toast('⬆️SLIDE UP⬆️')
gg.sleep(5000)
gg.searchNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️SLIDE UP⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️ SLIDE UP ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll('-100;-100;100',gg.TYPE_FLOAT)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end
function WF8()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast('PRESS ANY WHEEELS YOU HAVE 5 SECOND  TO PRESS ANY WHEELS😉')
gg.sleep(5000)
gg.toast('⬆️SLIDE UP⬆️')
gg.sleep(5000)
gg.searchNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️SLIDE UP⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️ SLIDE UP⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll('6',gg.TYPE_FLOAT)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end
function WF9()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast('PRESS ANY WHEEELS YOU HAVE 5 SECOND  TO PRESS ANY WHEELS 😉')
gg.sleep(5000)
gg.toast('⬆️SLIDE UP⬆️')
gg.sleep(5000)
gg.searchNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️SLIDE UP⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.toast('⬇️SLIDE DOWN⬇️')
gg.sleep(5000)
gg.refineNumber('0',gg.TYPE_FLOAT)
gg.toast('⬆️ slide up ⬆️')
gg.sleep(5000)
gg.refineNumber('1',gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll('2',gg.TYPE_FLOAT)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end

function MMM17()
CJ = gg.choice({
  "『 2 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 4-5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』", ---
  "『 #1.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 #2.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 #3.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 #4.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 #5.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 #6.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 #7.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 #8.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 #9.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『 #10.5 𝚂𝙴𝙲𝙾𝙽𝙳 𝙴𝙽𝙶𝙸𝙽𝙴』",
  "『CHEAT INFO༒』",
	"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴇɴɢɪɴᴇ sᴇᴛᴜᴘ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if CJ == nil then
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if CJ == 1 then LJ1() end
if CJ == 2 then LJ2() end
if CJ == 3 then LJ3() end
if CJ == 4 then LJ4() end
if CJ == 5 then LJ5() end
if CJ == 6 then LJ6() end
if CJ == 7 then LJ7() end
if CJ == 8 then LJ8() end
if CJ == 9 then LJ9() end
if CJ == 10 then LJ10() end
if CJ == 11 then LJ11() end
if CJ == 12 then LJ12() end
if CJ == 13 then LJ13() end
if CJ == 14 then M2() end
end
K2 =-1
end 
function LJ1()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(2)
gg.editAll("999.999",gg.TYPE_FLOAT)
gg.clearResults(2)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("999.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end
function LJ2()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("888.888",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("888.888",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function LJ3()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("777.777",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("777.777",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("0.1",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("1E-30",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function LJ4()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("666.666",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("666.666",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("3000",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("1E-10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function LJ5()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("555.555",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("555.555",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function LJ6()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("444.444",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("444.444",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function LJ7()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("333.333",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("333.333",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function LJ8()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("222.222",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("222.222",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function LJ9()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("111.111",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("111.111",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function LJ10()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1010.1010",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1010.1010",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function LJ11()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
if gg.isVisible() then
gg.setVisible(false) 
    gg.alert("Warning:⚠️Don't Open GG While Activating Cheat!!⚠️","Ok")
    gg.clearResults()
    gg.setVisible(true)
    print("Cheat Activated Unsuccessfully⚠️\n\nReason:\n⚠️Opening GG While Activating Cheat⚠️\n\nPlease Don't Open/Tapping GG While Activating Cheat")
    os.exit() 
return
    end 
gg.getResults(1)
gg.editAll("99.99",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("99.99",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1001",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end



function LJ12()
gg.toast("ACTIVATING CHEAT...")
 gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("280",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1499.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("350",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1499.999",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("6300",gg.TYPE_FLOAT)
gg.getResults(1)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(1)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("4700",gg.TYPE_FLOAT)
gg.getResults(3)
gg.editAll("2500",gg.TYPE_FLOAT)
gg.clearResults(3)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.clearResults(58)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("5.00",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("3.10",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("2.66",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.03",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.91",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.00",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1.39",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("6",gg.TYPE_FLOAT)
gg.clearResults(100)
gg.toast("NOW BUY THE V6 3.5 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

	
function LJ13()
gg.alert("ALL THE OF THE ENGINE MENU CHEATS WILL APPLY WITH THE ENGINE V6 3.5\n\n⚠️WARNING⚠️\nDON'T USE ALL THE CHEATS AT THE SAME TIME IT WILL NOT WORK ","BACK")
gg.sleep(2000)
MMM17()
end

function MMM18()
FG = gg.choice({
"『9.99999E-05』",
"『0.0001』",
 "『1𝙴-13』",
 "『1𝙴-29』",
 "『1𝙴-10』",
 "『1𝙴-05』",
 "『1𝙴-06』",
 "『2𝙴-13』",
 "『2𝙴-15』",
 "『2𝙴-29』",
 "『✍️𝙲𝚄𝚂𝚃𝙾𝙼 𝚂𝙷𝙸𝙵𝚃 𝚃𝙸𝙼𝙴』",
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ᴄᴜsᴛᴏᴍ sʜɪғᴛ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if FG == nil then
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if FG == 1 then GF1() end
if FG == 2 then GF2() end
if FG == 3 then GF3() end
if FG == 4 then GF4() end
if FG == 5 then GF5() end
if FG == 6 then GF6() end
if FG == 7 then GF7() end
if FG == 8 then GF8() end
if FG == 9 then GF9() end
if FG == 10 then GF10() end
if FG == 11 then GF11() end
if FG == 12 then M2() end
end 
K2 =-1
end

function GF1()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("9.99999E-05",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF2()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("0.0001",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF3()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-13",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF4()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-29",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF5()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-10",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF6()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-05",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF7()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("1E-06",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF8()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("2E-13",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF9()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("2E-15",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF10()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll("2E-29",gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function GF11()
Z = gg.prompt({" ENTER SHIFT TIME:"},
{[1]=""},
{["1"] ="number"})
if not Z then return end

gg.toast("ACTIVATING CHEAT...")
gg.sleep(1500)
gg.setRanges(gg.REGION_CODE_APP)
gg.setVisible(false)
gg.searchNumber("0.1",gg.TYPE_FLOAT)
gg.getResults(58)
gg.editAll(Z[1],gg.TYPE_FLOAT)
gg.toast("BUY FAST GEARBOX!!")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end

function MMM19()
BBM = gg.choice({
"『𝙲𝚄𝚂𝚃𝙾𝙼 𝙷𝙿』",
"『𝙲𝚄𝚂𝚃𝙾𝙼 𝙴𝙳𝙸𝚃 𝙼𝙰𝚂𝚂』",
    "𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ \n📂 :ᴄᴜsᴛᴏᴍ ᴇᴅɪᴛ ᴍᴀss"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if BBM == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if BBM == 1 then JK1() end---
if BBM == 2 then JK2() end-----
if BBM == 3 then M2() end---
end
K2 =-1
end 

function JK1()
Z = gg.prompt({" HP:"," NM:"," HP RPM:"," NM RPM:"," SHIFT TIME:","BACK"},
{[1]=""},
{[2]=""},
{[3]=""},
{[4]=""},
{[5]=""},
{["1,2,3,4,5"] ="number"})
if not Z then return end

gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setVisible(false)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber("240", gg.TYPE_FLOAT)
  gg.getResults(5)
  gg.editAll(Z[1], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("310", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll(Z[2], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("6800", gg.TYPE_FLOAT)
  gg.getResults(1)
  gg.editAll(Z[3], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("4500", gg.TYPE_FLOAT)
  gg.getResults(2)
  gg.editAll(Z[4], gg.TYPE_FLOAT)
  gg.clearResults()
gg.searchNumber("0.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll(Z[5], gg.TYPE_FLOAT)
  gg.toast("BUY V6 3.0 ENGINE AND FAST GEARBOX")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
  gg.clearResults()
end
function JK2()
Z = gg.prompt({"CAR STOCK MASS:","CAR MASS  YOU WANT:",},
{[1]=""},
{[2]=""},
{["1,2"] ="number"})
if not Z then return end

 gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setVisible(false)
  gg.setRanges(gg.REGION_CODE_APP)
  gg.setVisible(false)
  gg.searchNumber(Z[1], gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll(Z[2], gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("CHANGE TO THE NEXT CAR THEN GO BACK TO YOUR CAR\nTHEN BUY THE CAR")
  gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function MMM20()
AIRA = gg.choice({
"『𝟳𝟬° 𝚂𝚃𝙴𝙴𝚁𝙸𝙽𝙶』",
"『𝟴𝟬° 𝚂𝚃𝙴𝙴𝚁𝙸𝙽𝙶』",
"『𝟵𝟬° 𝚂𝚃𝙴𝙴𝚁𝙸𝙽𝙶』",
"『𝟯𝟲𝟬° 𝚂𝚃𝙴𝙴𝚁𝙸𝙽𝙶』",
    "𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :sᴛᴇᴇʀɪɴɢ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if AIRA == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if AIRA == 1 then BEBE1() end---
if AIRA == 2 then BEBE2() end-----
if AIRA == 3 then BEBE3() end---
if AIRA == 4 then BEBE4() end
if AIRA == 5 then M2() end
end
K2 =-1
end 

function BEBE1()
   gg.setVisible(false)
gg.alert ("GO TO GARAGE, GO IN CAR UPGRADED, GO IN SUSPENSION, THEN CLICK GG LOGO WHEN YOU'RE DONE THEN WAIT FOR THE INSTRUCTION","SGE POGI")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast("SET 30 STEERING MAX TO THE LEFT SIDE")
gg.sleep(3000)
gg.toast("PLEASE WAIT")
gg.sleep(2000)
gg.searchNumber("30",gg.TYPE_FLOAT)
gg.toast("SET 60 STEERING MAX TO THE RIGHT SIDE")
gg.sleep(3000)
gg.toast("PLEASE WAIT")
gg.sleep(2000)
gg.refineNumber("60",gg.TYPE_FLOAT)
gg.processResume()
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.toast("PLEASE WAIT")
gg.sleep(3000)
gg.editAll("70",gg.TYPE_FLOAT)
gg.alert("CLICK SAVE, THEN GO TO THE ROOM THEN TEST IT","SGE POGI")
gg.processResume()
gg.clearResults()
gg.setVisible(false)
end


function BEBE2()
   gg.setVisible(false)
gg.alert ("GO TO GARAGE, GO IN CAR UPGRADED, GO IN SUSPENSION, THEN CLICK GG LOGO WHEN YOU'RE DONE THEN WAIT FOR THE INSTRUCTION","SGE POGI")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast("SET 30 STEERING MAX TO THE LEFT SIDE")
gg.sleep(3000)
gg.toast("PLEASE WAIT")
gg.sleep(2000)
gg.searchNumber("30",gg.TYPE_FLOAT)
gg.toast("SET 60 STEERING MAX TO THE RIGHT SIDE")
gg.sleep(3000)
gg.toast("PLEASE WAIT")
gg.sleep(2000)
gg.refineNumber("60",gg.TYPE_FLOAT)
gg.processResume()
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.toast("PLEASE WAIT")
gg.sleep(3000)
gg.editAll("80",gg.TYPE_FLOAT)
gg.alert("CLICK SAVE, THEN GO TO THE ROOM THEN TEST IT","SGE POGI")
gg.processResume()
gg.clearResults()
gg.setVisible(false)
end


function BEBE3()
   gg.setVisible(false)
gg.alert ("GO TO GARAGE, GO IN CAR UPGRADED, GO IN SUSPENSION, THEN CLICK GG LOGO WHEN YOU'RE DONE THEN WAIT FOR THE INSTRUCTION","SGE POGI")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast("SET 30 STEERING MAX TO THE LEFT SIDE")
gg.sleep(3000)
gg.toast("PLEASE WAIT")
gg.sleep(2000)
gg.searchNumber("30",gg.TYPE_FLOAT)
gg.toast("SET 60 STEERING MAX TO THE RIGHT SIDE")
gg.sleep(3000)
gg.toast("PLEASE WAIT")
gg.sleep(2000)
gg.refineNumber("60",gg.TYPE_FLOAT)
gg.processResume()
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.toast("PLEASE WAIT")
gg.sleep(3000)
gg.editAll("90",gg.TYPE_FLOAT)
gg.alert("CLICK SAVE, THEN GO TO THE ROOM THEN TEST IT","SGE POGI")
gg.processResume()
gg.clearResults()
gg.setVisible(false)
end

function BEBE4()
   gg.setVisible(false)
gg.alert ("GO TO GARAGE, GO IN CAR UPGRADED, GO IN SUSPENSION, THEN CLICK GG LOGO WHEN YOU'RE DONE THEN WAIT FOR THE INSTRUCTION","SGE POGI")
gg.clearResults()
gg.clearList()
while true do
if gg.isVisible() then
break
else
gg.sleep(50)
end end gg.setVisible(false) gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast("SET 30 STEERING MAX TO THE LEFT SIDE")
gg.sleep(3000)
gg.toast("PLEASE WAIT")
gg.sleep(2000)
gg.searchNumber("30",gg.TYPE_FLOAT)
gg.toast("SET 60 STEERING MAX TO THE RIGHT SIDE")
gg.sleep(3000)
gg.toast("PLEASE WAIT")
gg.sleep(2000)
gg.refineNumber("60",gg.TYPE_FLOAT)
gg.processResume()
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.toast("PLEASE WAIT")
gg.sleep(3000)
gg.editAll("360",gg.TYPE_FLOAT)
gg.alert("CLICK SAVE, THEN GO TO THE ROOM THEN TEST IT","SGE POGI")
gg.processResume()
gg.clearResults()
gg.setVisible(false)
end

function MMM21()-------private int GetOwnRank() { }
logo = gg.choice({
"『𝙲𝙷𝙴𝙰𝚃 𝙸𝙽𝙵𝙾』",
"『𝙺𝙸𝙽𝙶 𝚁𝙰𝙽𝙺 𝙻𝙾𝙶𝙾』",
"『𝚈𝙾𝚄𝚃𝚄𝙱𝙴𝚁 𝙻𝙾𝙶𝙾』",
"『𝚃𝙸𝙺𝚃𝙾𝙺𝙴𝚁 𝙻𝙾𝙶𝙾』",
"『𝙳𝙴𝚅𝙴𝙻𝙾𝙿𝙴𝚁 𝙻𝙾𝙶𝙾』",
"『𝙸𝙽𝚂𝚃𝙰𝙶𝚁𝙰𝙼 𝙻𝙾𝙶𝙾』",
"𝑹𝒆𝒕𝒖𝒓𝒏"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ\n📂 :ʟᴏɢᴏ ᴍᴇɴᴜ"..os.date('\n\n🌅𝙳𝙰𝚈 : %d %B %Y\n⏳𝚃𝙸𝙼𝙴 : %X %p'))
if logo == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if logo == 1 then ampt1() end---
if logo == 2 then ampt2() end-----
if logo == 3 then ampt3() end---
if logo == 4 then ampt4() end
if logo == 5 then ampt5() end
if logo == 6 then ampt6() end
if logo == 7 then M2() end
end
K2 =-1
end 

function ampt1()
gg.alert("   𝗡𝗢𝗧𝗘: This Logo Menu is Visual only, it means only you can see this logo rank of yours","THANK YOU FOR INFORMATION")
MMM21()
end

function ampt2()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14;-1.01380916e-28;-1.41116389e-24", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-2.74884198e11;-6.13017998e13", gg.TYPE_FLOAT)
gg.alert("🇫 🇮 🇳 🇮 🇸 🇭 \n\n𝗬𝗢𝗨 𝗖𝗔𝗡 𝗡𝗢𝗪 𝗘𝗡𝗧𝗘𝗥 𝗧𝗛𝗘 𝗥𝗢𝗢𝗠")
gg.alert("𝗥𝗘𝗦𝗧𝗔𝗥𝗧 𝗧𝗛𝗘 𝗚𝗔𝗠𝗘 𝗜𝗙 𝗬𝗢𝗨 𝗪𝗔𝗡𝗧 𝗧𝗢 𝗨𝗦𝗘 𝗔𝗡𝗢𝗧𝗛𝗘𝗥 𝗟𝗢𝗚𝗢 ")
gg.processResume()
end

function ampt3()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14;-1.01380916e-28;-1.41116389e-24", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-2.74886296e11;-6.13017998e13", gg.TYPE_FLOAT)
gg.alert("🇫 🇮 🇳 🇮 🇸 🇭 \n\n𝗬𝗢𝗨 𝗖𝗔𝗡 𝗡𝗢𝗪 𝗘𝗡𝗧𝗘𝗥 𝗧𝗛𝗘 𝗥𝗢𝗢𝗠")
gg.alert("𝗥𝗘𝗦𝗧𝗔𝗥𝗧 𝗧𝗛𝗘 𝗚𝗔𝗠𝗘 𝗜𝗙 𝗬𝗢𝗨 𝗪𝗔𝗡𝗧 𝗧𝗢 𝗨𝗦𝗘 𝗔𝗡𝗢𝗧𝗛𝗘𝗥 𝗟𝗢𝗚𝗢 ")
gg.processResume()
end

function ampt4()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14;-1.01380916e-28;-1.41116389e-24", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-2.74887344e11;-6.13017998e13", gg.TYPE_FLOAT)
gg.alert("🇫 🇮 🇳 🇮 🇸 🇭 \n\n𝗬𝗢𝗨 𝗖𝗔𝗡 𝗡𝗢𝗪 𝗘𝗡𝗧𝗘𝗥 𝗧𝗛𝗘 𝗥𝗢𝗢𝗠")
gg.alert("𝗥𝗘𝗦𝗧??𝗥𝗧 𝗧𝗛𝗘 𝗚𝗔𝗠𝗘 𝗜𝗙 𝗬𝗢𝗨 𝗪𝗔𝗡𝗧 𝗧𝗢 𝗨𝗦𝗘 𝗔𝗡𝗢𝗧𝗛𝗘𝗥 𝗟𝗢𝗚𝗢 ")
gg.processResume()
end

function ampt5()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14;-1.01380916e-28;-1.41116389e-24", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-2.74885247e11;-6.13017998e13", gg.TYPE_FLOAT)
gg.alert("🇫 🇮 🇳 🇮 🇸 🇭 \n\n𝗬𝗢𝗨 𝗖𝗔𝗡 𝗡𝗢𝗪 𝗘𝗡𝗧𝗘𝗥 𝗧𝗛𝗘 𝗥𝗢𝗢𝗠")
gg.alert("𝗥𝗘𝗦𝗧𝗔𝗥𝗧 𝗧𝗛𝗘 𝗚𝗔𝗠𝗘 𝗜𝗙 𝗬𝗢𝗨 𝗪𝗔𝗡𝗧 𝗧𝗢 𝗨𝗦𝗘 𝗔𝗡𝗢𝗧𝗛𝗘𝗥 𝗟𝗢𝗚𝗢 ")
gg.processResume()
end

function ampt6()
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14;-1.01380916e-28;-1.41116389e-24", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("-3.45652552e10;-4.15535223e34;-2.89733413e-14", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
revert = gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-2.74888393e11;-6.13017998e13", gg.TYPE_FLOAT)
gg.alert("🇫 🇮 🇳 🇮 🇸 🇭 \n\n𝗬𝗢𝗨 𝗖𝗔𝗡 𝗡𝗢𝗪 𝗘𝗡𝗧𝗘𝗥 𝗧𝗛𝗘 𝗥𝗢𝗢𝗠")
gg.alert("𝗥𝗘𝗦𝗧𝗔𝗥𝗧 𝗧𝗛𝗘 𝗚𝗔𝗠𝗘 𝗜𝗙 𝗬𝗢𝗨 𝗪𝗔𝗡𝗧 𝗧𝗢 𝗨𝗦𝗘 𝗔𝗡𝗢𝗧𝗛𝗘𝗥 𝗟𝗢𝗚𝗢 ")
gg.processResume()
end





  
function M3()
BRU = gg.multiChoice({
' 『𝙱𝙻𝙾𝙲𝙺 𝙿𝙾𝚂𝚃』 ',  -----1
' 『𝙷𝙾𝚃 𝚁𝙾𝙰𝙳』  ', -----------2
' 『𝙼𝙰𝚁𝙰𝚃𝙷𝙾𝙽』 ',-----------3
' 『𝚂𝙿𝙴𝙴𝙳 𝙱𝙰𝙽𝙽𝙴𝚁』  ',------4
' 『𝚁𝙰𝙲𝙴 𝚆𝙸𝙽𝚂』 ',-------5
' 『𝙿𝙾𝙻𝙸𝙲𝙴』 ',-----------------6
' 『𝚃𝙸𝚁𝙴 𝙱𝚄𝚁𝙽𝚃』 ',---------7
' 『𝙵𝚄𝙴𝙻 𝙲𝙾𝙽𝚂𝚄𝙼𝙴𝙳』 ',--------8
' 『𝙲𝙰𝚁 𝚆𝙰𝚂𝙷』 ',-----------------9
' 『𝙲𝙰𝚁 𝚁𝙴𝙿𝙰𝙸𝚁』 ',------------10
' 『𝙴𝙼𝙾𝚃𝙸𝙾𝙽𝚂』 ',-------------11
' 『𝙶𝙰𝙼𝙴 𝚃𝙸𝙼𝙴』 ',----------12
' 『𝙿𝙰𝚂𝚂𝙴𝙽𝙶𝙴𝚁』 ',--------13
' 『𝙳𝙸𝚂𝚃𝙰𝙽𝙲𝙴』 ',--------14
' 『𝙾𝙵𝙵𝚁𝙾𝙰𝙳』 ',-----------15
' 『𝙶𝙸𝙵𝚃 𝙲𝙾𝙻𝙻𝙴𝙲𝚃𝙾𝚁(𝙱𝚄𝙶 𝙳𝙾 𝙽𝙾𝚃 𝚄𝚂𝙴)』 ',--------16
' 『DRIFT KING』 ',----------17
' 『TAXI & CARGO & DELIVERY』 ',-----18
' 『??𝙻𝙸𝙳𝙴𝚁 𝙲𝚄𝚃』 ',--------------19
'┌───────────────────┐\n│ 𝙰𝙳𝙳𝙸𝚃𝙸𝙾𝙽𝙰𝙻   𝙰𝙲𝙷𝙸𝙴𝚅𝙴𝙼𝙴𝙽𝚃 │\n└───────────────────┘',--- 20
''..sz,------------21
''..se,--------------22
''..si,--------------23
''..so,--------------24
''..sf,--------------25
''..kb,--------------26
'𝑹𝒆𝒕𝒖𝒓𝒏'  ------27
 }, nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ \n🚗 :4.8.21.3\n≪━─━─━─━─◈─━─━─━─━≫\n         👑𝗔𝗖𝗛𝗜𝗘𝗩𝗘𝗠𝗘𝗡𝗧  \n≪━─━─━─━─◈─━─━─━─━≫")

------------------DATE & TIME SYSTEM -------------
            --You can Add More Hack Just Put Spaces
if BRU == nil then 
    gg.toast("sᴄʀɪᴘᴛ ᴄᴀɴᴄᴇʟ")
else
if BRU [1]== true then a1() end
if BRU [2]== true then a2() end
if BRU [3]== true then a3() end
if BRU [4]== true then a4() end
if BRU [5]== true then a5() end
if BRU [6]== true then a6() end
if BRU [7]== true then a7() end
if BRU [8]== true then a8() end
if BRU [9]== true then a9() end
if BRU [10]== true then a10() end
if BRU [11]== true then a11() end
if BRU [12]== true then a12() end
if BRU [13]== true then a13() end
if BRU [14]== true then a14() end
if BRU [15]== true then a15() end
if BRU [16]== true then a16() end
if BRU [17]== true then a17() end
if BRU [18]== true then a18() end
if BRU [19]== true then a19() end
if BRU [20]== true then a20() end
if BRU [21]== true then a21() end
if BRU [22]== true then a22() end
if BRU [23]== true then a23() end
if BRU [24]== true then a24() end
if BRU [25]== true then a25() end
if BRU [26]== true then a26() end
if BRU [27]== true then HOME() end end

K2 =-1
end 





function a1()-------- block post
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0x74", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a2()-----+ hot road
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0x114", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a3()--------marathon
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("NewMove","0xB4", false, false, gg.TYPE_FLOAT) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function a4()-----------speed bannner
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0x84", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a5()----------rave wins
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0x94", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a6()---------- police
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0xA4", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function a7()----------- tire burnt
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0xB4", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a8()-----------Fuel consumed
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0xC4", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function a9()------------ car wash
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0xD4", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a10()---------- car repair
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0xE4", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a11()------------- emotion
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0xF4", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function a12()----------- game time
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("AnaliticsWhere","0x18", false, false, gg.TYPE_FLOAT) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a13()---------- passenger
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("NewMove","0xB4", false, false, gg.TYPE_FLOAT) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a14()-------- distance
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("Drivetrain","0x234", false, false, gg.TYPE_FLOAT) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a15()------------ off road
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("Drivetrain","0x270", false, false, gg.TYPE_FLOAT) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a16()---------- gift collector
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0x104", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function a17()--------- drift king
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("Drivetrain","0x25C", false, false, gg.TYPE_FLOAT) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

function a18()----- taxi cargo--public virtual float GetDistance() { }
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1300)
gg.alert("COMPLETE ATLEAST 1 MISSION IN CARGO & DELIVERY AND TAXI")
gg.sleep(200)-----
LibStart=gg.getRangesList('libil2cpp.so')[2].start
KAITO=nil
KAITO={}
KAITO[1]={}
KAITO[2]={}
KAITO[1].address=LibStart+0x21DAFC0
KAITO[1].value='h200080D2'
KAITO[1].flags=4
KAITO[2].address=LibStart+(0x21DAFC0+0x4)
KAITO[2].value='hC0035FD6'
KAITO[2].flags=4
gg.setValues(KAITO)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function a19()-------- slincer
gg.toast("ACTIVATING CHEAT...")
JONHZKIEPLAYSS("DataBaseFreeDrive","0x124", false, false, gg.TYPE_DWORD) 
gg.getResults(9999)
gg.editAll(999999, gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end



-----------------------------------------------------------------------------------------------------------------------------------------------------------
function a20()
gg.alert("𝙳𝙰𝙷𝙸𝙻 𝙿𝙸𝙽𝙸𝙽𝙳𝙾𝚃 𝙼𝙾𝚃𝙾 𝙸𝙺𝙸𝙺𝙸𝚂𝚂 𝙼𝙾 𝙸𝚃𝙻𝙾𝙶 𝙺𝙾","𝙼𝚄𝙰𝙷 𝙼𝚄𝙰𝙷💋")
M3()
end

sz = "『𝙿𝙰𝚁𝙺𝙸𝙽𝙶 𝙻𝙴𝚅𝙴𝙻𝚂』"
function a21()
if sz == "『𝙿𝙰𝚁𝙺𝙸𝙽𝙶 𝙻𝙴𝚅𝙴𝙻𝚂』" then
gg.toast("ACTIVATING CHEAT...")
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.1", gg.TYPE_FLOAT)
gg.getResults(100)
gg.setVisible(false)
gg.editAll("1E-45", gg.TYPE_FLOAT)
gg.alert("➣ DON'T FORGET TO OFF THE CHEAT")
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
sz = "❌『[𝙾𝙵𝙵] 𝙿𝙰𝚁𝙺𝙸𝙽𝙶 𝙻𝙴𝚅𝙴𝙻𝚂』"
elseif sz == "❌『[𝙾𝙵𝙵] 𝙿𝙰𝚁𝙺𝙸𝙽𝙶 𝙻𝙴𝚅𝙴𝙻𝚂』" then
gg.toast("DEACTIVATING CHEAT...")
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("1E-45", gg.TYPE_FLOAT)
gg.getResults(100)
gg.setVisible(false)
gg.editAll("0.1", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("DEACTIVATED SUCCESSFULLY✅")
sz = "『𝙿𝙰𝚁𝙺𝙸𝙽𝙶 𝙻𝙴𝚅𝙴𝙻𝚂』"
end
end

se = "『𝙷𝙰𝙲𝙺 𝙷𝙾𝚄𝚁𝚂』"
function a22()
if se == "『𝙷𝙰𝙲𝙺 𝙷𝙾𝚄𝚁𝚂』" then
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("1000", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("9999999", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert("➣ Get Out To Your Car")
gg.sleep(3000)
gg.alert("➣ GET IN YOUR CAR AND WAIT FOR FEW MINUTES & THEN TAP HACK HOURS [OFF]")
gg.clearResults(999)
gg.toast("ACTIVATED SUCCESSFULLY✅")
se = "❌『[𝙾𝙵𝙵] 𝙷𝙰𝙲𝙺 𝙷𝙾𝚄𝚁𝚂』"
elseif se == "❌『[𝙾𝙵𝙵] 𝙷𝙰𝙲𝙺 𝙷𝙾𝚄𝚁𝚂』" then
gg.toast("DEACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("9999999",gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("1000",gg.TYPE_FLOAT)
gg.clearResults(999)
gg.alert("➣ NOW JUST EXIT THE ROOM &SEE YOUR PLAYING HOURS")
gg.clearResults()
gg.toast("DEACTIVATED SUCCESSFULLY✅")
se = "『𝙷𝙰𝙲𝙺 𝙷𝙾𝚄𝚁𝚂』"
end
end

si = "『𝙵𝙻𝙰𝚂𝙷 𝙼𝙰𝚁𝙰𝚃𝙷𝙾𝙽』"
function a23()
if si == "『𝙵𝙻𝙰𝚂𝙷 𝙼𝙰𝚁𝙰𝚃𝙷𝙾𝙽』" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1300)
gg.alert("𝐆𝐨 𝐇𝐢𝐠𝐡𝐰𝐚𝐲 𝐑𝐨𝐨𝐦 𝐎𝐧𝐥𝐢𝐧𝐞")
gg.sleep(2000)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("1", gg.TYPE_DOUBLE)
gg.getResults(9999)
gg.editAll("99", gg.TYPE_DOUBLE)
gg.clearResults()
gg.toast("IF HACK NOT WORK THEN TRY AGAIN")
gg.alert("➣ DON'T FORGET TO OFF THE CHEAT")
gg.toast("ACTIVATED SUCCESSFULLY✅")
si = "❌『[𝙾𝙵𝙵] 𝙵𝙻𝙰𝚂𝙷 𝙼𝙰𝚁𝙰𝚃𝙷𝙾𝙽』"
elseif si == "❌『[𝙾𝙵𝙵] 𝙵𝙻𝙰𝚂𝙷 𝙼𝙰𝚁𝙰𝚃𝙷𝙾𝙽』" then
gg.toast("DEACTIVATING CHEAT...")
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber("99", gg.TYPE_DOUBLE)
gg.getResults(9999)
gg.editAll("1", gg.TYPE_DOUBLE)
gg.toast("DEACTIVATED SUCCESSFULLY✅")
gg.clearResults()
si = "『𝙵𝙻𝙰𝚂𝙷 𝙼𝙰𝚁𝙰𝚃𝙷𝙾𝙽』"
end
end

so = "『𝙳𝙸𝚂𝚃𝙰𝙽𝙴 & 𝙾𝙵𝙵𝚁𝙾𝙰𝙳』"
function a24()
if so == "『𝙳𝙸𝚂𝚃𝙰𝙽𝙲𝙴 & 𝙾𝙵𝙵𝚁𝙾𝙰𝙳』" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1300)
gg.alert("➣ TO COMPLETE OFFROAD RUN IN DESERT")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.001", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(2000)
gg.editAll("0.99800002575", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("500", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(2000)
gg.editAll("999999", gg.TYPE_FLOAT)
gg.alert("➣ DON'T FORGET TO OFF THE CHEAT")
gg.clearResults(999)
gg.toast("ACTIVATED SUCCESSFULLY✅")

so = "❌『[𝙾𝙵𝙵] 𝙳𝙸𝚂𝚃𝙰𝙽𝙲𝙴 & 𝙾𝙵𝙵𝚁𝙾𝙰𝙳』"
elseif so == "❌『[𝙾𝙵𝙵] 𝙳𝙸𝚂𝚃𝙰𝙽𝙲𝙴 & 𝙾𝙵𝙵𝚁𝙾𝙰𝙳』" then
gg.toast("DEACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.99800002575", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(2000)
gg.editAll("0.001", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("999999", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(2000)
gg.editAll("500", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("DEACTIVATED SUCCESSFULLY✅")
gg.clearResults(999)
so = "𝙳𝙸𝚂𝚃𝙰𝙽𝙲𝙴 & 𝙾𝙵𝙵𝚁𝙾𝙰𝙳"
end
end

sf = "『𝙳𝚁𝙸𝙵𝚃 𝙼𝙰𝚂𝚃𝙴𝚁 & 𝙳𝚁𝙸𝙵𝚃 𝙺𝙸𝙽𝙶』"
function a25()
if sf == "『𝙳𝚁𝙸𝙵𝚃 𝙼𝙰𝚂𝚃𝙴𝚁 & 𝙳𝚁𝙸𝙵𝚃 𝙺𝙸𝙽𝙶』" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1300)
gg.alert("➣ MAKE THE CAR RUN ON IT'S  OWN TO COMPLETE THE MISSION")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.001", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("9999", gg.TYPE_FLOAT)
gg.alert("➣ DON'T FORGET TO OFF THE CHEAT")
gg.clearResults(999)
gg.toast("ACTIVATED SUCCESSFULLY✅")

sf = "❌『[𝙾𝙵𝙵] 𝙳𝚁𝙸𝙵𝚃 𝙼𝙰𝚂𝚃𝙴𝚁 & 𝙳𝚁𝙸𝙵𝚃 𝙺𝙸𝙽𝙶』"
elseif sf == "❌『[𝙾𝙵𝙵] 𝙳𝚁𝙸𝙵𝚃 𝙼𝙰𝚂𝚃𝙴𝚁 & 𝙳𝚁𝙸𝙵𝚃 𝙺𝙸𝙽𝙶』" then
gg.toast("DEACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("9999", gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll("0.001", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("DEACTIVATED SUCCESSFULLY✅")
gg.clearResults(999)
sf = "『𝙳𝚁𝙸𝙵𝚃 𝙼𝙰𝚂𝚃𝙴𝚁 & 𝙳𝚁𝙸𝙵𝚃 𝙺𝙸𝙽𝙶』"
end
end


kb = "『𝙿𝙰𝚂𝚂𝙴𝙽𝙶𝙴𝚁』"
function a26()
if kb == "『𝙿𝙰𝚂𝚂𝙴𝙽𝙶𝙴𝚁』" then
gg.toast("ACTIVATING CHEAT...")
gg.sleep(1300)
gg.setRanges(gg.REGION_CODE_APP)
gg.alert("➣ MOVE TO PASSENGER SEAT")
gg.sleep(5000)
gg.searchNumber("0.001", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(2000)
gg.editAll("99999", gg.TYPE_FLOAT)
gg.alert("➣ WAIT FOR FEW MINUTES TO COMPLETE THE MISSION AND DON'T FORGET TO OFF THE CHEAT")
gg.clearResults(999)
gg.toast("ACTIVATED SUCCESSFULLY✅")

kb = "❌『[𝙾𝙵𝙵] 𝙿𝙰𝚂𝚂𝙴𝙽𝙶𝙴𝚁』"
elseif kb == "❌『[𝙾𝙵𝙵] 𝙿𝙰𝚂𝚂𝙴𝙽𝙶𝙴𝚁』" then
gg.toast("DEACTIVATING CHEAT...")
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("99999", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(2000)
gg.editAll("0.001", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("DEACTIVATED SUCCESSFULLY✅")
gg.clearResults(999)
kb = "『𝙿𝙰𝚂𝚂𝙴𝙽𝙶𝙴𝚁』"
end
end


----CLASSNAME FIELD OFFSET
function JONHZKIEPLAYSS(class, offset, tryHard, bit32, valueType)
Get_user_input = {}
Get_user_input[1] = class
Get_user_input[2] = offset
Get_user_input[3] = tryHard
Get_user_input[4] = bit32
Get_user_type = valueType
start()
end

 

function loopCheck()
if      userMode == 1 then UI()
elseif  error    == 3 then exit()
end
end

 
function found_(message)
if error == 1 then
found2(message)
elseif error == 2 then
found3(message)
elseif error == 3 then
found4(message)
else found(message)
end
end

 

function found(message)
if count == 0 then
gg.clearResults()
gg.clearList()
first_error = message
error = 1
second_start()
end
end

 

function found2(message)
if count == 0 then
gg.clearResults()
gg.clearList()
second_error = message
error = 2
third_start()
end
end

 

function found3(message)
if count == 0 then
gg.clearResults()
gg.clearList()
third_error = message
error = 3
fourth_start()
end
end

 

function found4(message)
if count == 0 then
gg.clearResults()
gg.clearList()
gg.setVisible(false)
loopCheck()
end
end

function user_input_taker()
::stort::
gg.clearResults()
if userMode == 1 then
if Get_user_input == nil then
default1 = "Class"
default2 = "Offset"
default3 = false
default4 = false
else
default1 = Get_user_input[1]
default2 = Get_user_input[2]
default3 = Get_user_input[3]
default4 = Get_user_input[4]
end
if Get_user_type     == 1 then
Get_user_type = gg.TYPE_BK2E
elseif Get_user_type == 2 then
Get_user_type = gg.TYPE_DWORD
elseif Get_user_type == 3 then
Get_user_type = gg.TYPE_QWORD
elseif Get_user_type == 4 then
Get_user_type = gg.TYPE_FLOAT
elseif Get_user_type == 5 then
Get_user_type = gg.TYPE_DOUBLE
end
if Get_user_type ~= gg.TYPE_BK2E then
if (Get_user_input[2] % 4) ~= 0  then
goto stort
end
end
end
error = 0 
end

 

function O_initial_search()
gg.setVisible(false)
user_input = ":"..Get_user_input[1] 
if Get_user_input[3] then
offst = 25
else
offst = 0
end
end

 

function O_dinitial_search()
if error > 1 then
gg.setRanges(gg.REGION_C_ALLOC)
else
gg.setRanges(gg.REGION_OTHER)
end
gg.searchNumber(user_input, gg.TYPE_BK2E)
count = gg.getResultsCount()
if count == 0 then
found_("O_dinitial_search")
return 0
end
Refiner = gg.getResults(1)
gg.refineNumber(Refiner[1].value, gg.TYPE_BK2E)
count = gg.getResultsCount()
if count == 0 then
found_("O_dinitial_search")
return 0
end
val = gg.getResults(count)
gg.addListItems(val)
end

 

function CA_pointer_search()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
gg.loadResults(gg.getListItems())
gg.searchPointer(offst)
count = gg.getResultsCount()
if count == 0 then
found_("CA_pointer_search")
return 0
end
vel = gg.getResults(count)
gg.clearList()
gg.addListItems(vel)
end

 

function CA_apply_offset()
if Get_user_input[4] then
tanker = 0xfffffffffffffff8
else
tanker = 0xfffffffffffffff0
end
local copy = false
local l = gg.getListItems()
if not copy then gg.removeListItems(l) end
for i, v in ipairs(l) do
 v.address = v.address + tanker
 if copy then v.name = v.name..' #2' end
end
gg.addListItems(l)
end

 

function CA2_apply_offset()
if Get_user_input[4] then
tanker = 0xfffffffffffffff8
else
tanker = 0xfffffffffffffff0
end
local copy = false
local l = gg.getListItems()
if not copy then gg.removeListItems(l) end
for i, v in ipairs(l) do
 v.address = v.address + tanker
 if copy then v.name = v.name..' #2' end
end
gg.addListItems(l)
end

 

function Q_apply_fix()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.loadResults(gg.getListItems())
gg.clearList()
count = gg.getResultsCount()
if count == 0 then
found_("Q_apply_fix")
return 0
end
yy = gg.getResults(1000)
gg.clearResults()
i = 1
c = 1
s = {}
while (i-1) < count do
yy[i].address = yy[i].address + 0xb400000000000000
gg.searchNumber(yy[i].address, gg.TYPE_QWORD)
cnt = gg.getResultsCount()
if 0 < cnt then
bK2r = gg.getResults(cnt)
n = 1
while (n-1) < cnt do
s[c] = {}
s[c].address = bK2r[n].address
s[c].flags = 32
n = n + 1
c = c + 1
end
end
gg.clearResults()
i = i + 1
end
gg.addListItems(s)
end

 

function A_base_value()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.loadResults(gg.getListItems())
gg.clearList()
gg.searchPointer(offst)
count = gg.getResultsCount()
if count == 0 then
found_("A_base_value")
return 0
end
tel = gg.getResults(count)
gg.addListItems(tel)
end

 

function A_base_accuracy()
gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC)
gg.loadResults(gg.getListItems())
gg.clearList()
gg.searchPointer(offst)
count = gg.getResultsCount()
if count == 0 then
found_("A_base_accuracy")
return 0
end
kol = gg.getResults(count)
i = 1
h = {}
while (i-1) < count do
h[i] = {}
h[i].address = kol[i].value
h[i].flags = 32
i = i + 1
end
gg.addListItems(h)
end

 

function A_user_given_offset()
local old_save_list = gg.getListItems()
for i, v in ipairs(old_save_list) do
v.address = v.address + Get_user_input[2]
v.flags = Get_user_type
end
gg.clearResults()
gg.clearList()
gg.loadResults(old_save_list)
count = gg.getResultsCount()
if count == 0 then
found_("Q_apply_fix++")
return 0
end
gg.setVisible(false)
end

function start()
user_input_taker()
O_initial_search()
O_dinitial_search()
if error > 0 then
return 0
end
CA_pointer_search()
if error > 0 then
return 0
end
CA_apply_offset()
if error > 0 then
return 0
end
A_base_value()
if error > 0 then
return 0
end
if offst == 0 then
A_base_accuracy()
end
if error > 0 then
return 0
end
A_user_given_offset()
if error > 0 then
return 0
end
loopCheck()
if error > 0 then
return 0
end
end

function M5()
MUSIC = gg.choice({
"➕『𝚄𝙽𝙻𝙾𝙲𝙻 𝚂𝙸𝚁𝙴𝙽 (𝙱𝚄𝙶)』",
"➕『𝚄𝙽𝙻𝙾𝙲𝙺 𝙷𝙾𝚁𝙽 (𝙱𝚄𝙶)』",
"➕『𝚄𝙽𝙻𝙾𝙲𝙺 𝙿𝚁𝙴𝙼𝙸𝚄𝙼 𝙼𝙰𝙶𝚂』",
"➕『𝚄𝙽𝙻𝙾𝙲𝙺 𝙿𝚁𝙴𝙼𝙸𝚄𝙼 𝙵𝙻𝙰𝙶』",
"➕『𝙽𝙾 𝙱𝚄𝙼𝙿𝙴𝚁』",
"➕『𝙻𝙾𝙽𝙶 𝙽𝙰𝙼?? 𝙿𝚁𝙾 𝚅𝙴𝚁𝚂𝙸𝙾𝙽』",
"➕『𝙻𝙾𝙽𝙶 𝙽𝙰𝙼𝙴 𝚅1』",
"➕『𝙻𝙾𝙽𝙶 𝙽𝙰𝙼𝙴 𝚅2』",
"➕『𝙼𝙰𝙶𝙸𝙲 𝚄𝙵𝙾 𝙲𝙰𝚁』",
"➕『𝙼𝙰𝙶𝙸𝙲 𝙲𝙰𝙼𝙱𝙴𝚁』",
  "➕『𝙼𝙰𝙶𝙸𝙲 𝚂𝚃𝙰𝙽𝙲𝙴 𝙲𝙰𝙼𝙱𝙴𝚁』",
  "➕『𝙱𝙰𝙲𝙺 𝙵??𝚁𝙴』",
  "➕『𝚂𝙿𝙴𝙲𝚄𝙻𝙰𝚁 𝙲𝙷𝚁𝙾𝙼𝙴』",
  "➕『𝙿𝙾𝙿𝙿𝙸𝙽𝙶 𝙳𝙰𝙽𝙲𝙴』",
  "➕『𝙳𝙾𝚄𝙱𝙻𝙴 𝙱𝙰𝙲𝙺𝙲𝙻𝙸𝙵』",	
  "➕『𝙲𝙷𝙰𝙽𝙶𝙴 𝙸𝙳』",	
"✗𝐑𝐞𝐭𝐮𝐫𝐦✗"},nil, "👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ \n🚗 :4.8.21.3\n≪━─━─━─━─◈─━─━─━─━≫\n           ➕𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟        \n≪━─━─━─━─◈─━─━─━─━≫")

if MUSIC == nil then
gg.toast("⚜️𝐊𝐀𝐈𝐓𝐎 𝐖𝐎𝐑𝐊𝐒⚜️")
   else
   
  if MUSIC == 1 then
   HAHA1()
   end 

   if MUSIC == 2 then
   HAHA2()
   end

   if MUSIC == 3 then
   HAHA3()
   end 

   if MUSIC == 4 then
   HAHA4()
   end

   if MUSIC == 5 then
   HAHA5()
   end 
   
   if MUSIC == 6 then
   HAHA6()
   end 
   
   if MUSIC == 7 then
   HAHA7()
   end 
   
   if MUSIC == 8 then
   HAHA8()
   end 
   
   if MUSIC == 9 then
   HAHA9()
   end 
   
   if MUSIC == 10 then
   HAHA10()
   end 
   
   if MUSIC == 11 then
   HAHA11()
   end 
   
   if MUSIC == 12 then
   HAHA12()
   end 
   
   if MUSIC == 13 then
   HAHA13()
   end 
   
   if MUSIC == 14 then
   HAHA14()
   end 
   
   if MUSIC == 15 then
   HAHA15()
   end 
   
   if MUSIC == 16 then
   HAHA16()
   end
   
   if MUSIC == 17 then
   HOME()
   end 
   
   end
   K2 = -1
   end
   
   function HAHA1()---private void FindPoliceLights() { }
gg.toast("ACTIVATING CHEAT...")
LibStart=gg.getRangesList('libil2cpp.so')[2].start
KAITO=nil
KAITO={}
KAITO[1]={}
KAITO[2]={}
KAITO[1].address=LibStart+0x208CEB0
KAITO[1].value='h200080D2'
KAITO[1].flags=4
KAITO[2].address=LibStart+(0x208CEB0+0x4)
KAITO[2].value='hC0035FD6'
KAITO[2].flags=4
gg.setValues(KAITO)
gg.clearResults()
gg.alert("UNLOCK SIREN[ON]\n\nENTER LEVEL 1 THEN MENU")
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function HAHA2()----private void SetHorn(int id) { }
gg.toast("ACTIVATING CHEAT...")
LibStart=gg.getRangesList('libil2cpp.so')[2].start
KAITO=nil
KAITO={}
KAITO[1]={}
KAITO[2]={}
KAITO[1].address=LibStart+0x261F248
KAITO[1].value='h200080D2'
KAITO[1].flags=4
KAITO[2].address=LibStart+(0x261F248+0x4)
KAITO[2].value='hC0035FD6'
KAITO[2].flags=4
gg.setValues(KAITO)
gg.alert("UNLOCK HORN[ON]\n\nENTER LEVEL 1 THEN MENU")
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function HAHA3()----private bool wheelUnlocked(ExteriorTuning.OneWheelData oneWheelData) { }
gg.toast("ACTIVATING CHEAT...")
LibStart=gg.getRangesList('libil2cpp.so')[2].start
KAITO=nil
KAITO={}
KAITO[1]={}
KAITO[2]={}
KAITO[1].address=LibStart+0x1FE95CC
KAITO[1].value='h200080D2'
KAITO[1].flags=4
KAITO[2].address=LibStart+(0x1FE95CC+0x4)
KAITO[2].value='hC0035FD6'
KAITO[2].flags=4
gg.setValues(KAITO)
gg.alert("UNLOCK PREMIUM MAGS[ON]\n\nENTER LEVEL 1 THEN MENU")
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function HAHA4()----public bool UnlockFlag() { }
gg.toast("ACTIVATING CHEAT...")
gg.clearList()
LibStart=gg.getRangesList('libil2cpp.so')[2].start
KAITO=nil
KAITO={}
KAITO[1]={}
KAITO[2]={}
KAITO[1].address=LibStart+0x1FEFE74
KAITO[1].value='h200080D2'
KAITO[1].flags=4
KAITO[2].address=LibStart+(0x1FEFE74+0x4)
KAITO[2].value='hC0035FD6'
KAITO[2].flags=4
gg.setValues(KAITO)
gg.alert("UNLOCK FLAGS[ON]\n\nENTER LEVEL 1 THEN MENU")
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end

   
  function HAHA5()
gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.sleep(5000)
  gg.alert("𝚂𝚎𝚕𝚎𝚌𝚝 2𝚗𝚍 𝙱𝚞𝚖𝚙𝚎𝚛")
  gg.sleep(5000)
  gg.searchNumber("1", gg.TYPE_DWORD)
  gg.alert("𝚂𝚎𝚕𝚎𝚌𝚝 3𝚛𝚍 𝙱𝚞𝚖𝚙𝚎𝚛")
  gg.sleep(5000)
  gg.refineNumber("2", gg.TYPE_DWORD)
  gg.alert("𝚂𝚎𝚕𝚎𝚌𝚝 4𝚝?? 𝙱𝚞𝚖𝚙𝚎𝚛")
  gg.sleep(5000)
  gg.refineNumber("3", gg.TYPE_DWORD)
  gg.getResults(2)
  gg.alert("𝚂𝚎𝚕𝚎𝚌𝚝 1𝚜𝚝 𝙱𝚞𝚖𝚙𝚎𝚛")
  gg.sleep(3000)
  gg.editAll("-1", gg.TYPE_DWORD)
  gg.alert("𝚈𝚘𝚞 𝚌𝚊𝚗 𝙲𝚘𝚗𝚏𝚒𝚛𝚖 𝙽𝚘𝚠 𝚊𝚗𝚍 𝙲𝚑𝚊𝚗𝚐𝚎 𝚝𝚑𝚎 𝙲𝚊𝚛 𝚊𝚗𝚍 𝚐𝚘 𝙱𝚊𝚌𝚔 t𝚘 𝚈𝚘𝚞𝚛 𝙲𝚊𝚛😎𝗩𝗜𝗣 𝗦𝗖𝗥𝗜𝗣𝗧 : kaito😎","OKAY")
  gg.alert("if the no bumper cant equipt in means cannot remove CAR bumper try to other cars","OKAY")
  gg.toast("✅COMPLETED✅")
end


function HAHA6()
gg.toast("ACTIVATING CHEAT...")
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("12;1041009805:21", gg. TYPE_DWORD)
gg.refineNumber("12", gg.TYPE_DWORD)
gg.getResults(9999)
gg.editAll("99999", gg.TYPE_DWORD)
gg.clearResults()
gg.alert("ENTER NAME AS LONG AS YOU WANT")
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function HAHA7()
gg.toast("ACTIVATING CHEAT...")
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast("TYPE A")
gg.sleep(6500)
gg.searchNumber("12;1", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.alert("TYPE AAA")
gg.sleep(6500)
gg.refineNumber("12;3", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("500", gg.TYPE_DWORD)
gg.processResume()
  gg.toast("✅  NOW You Can Set your Name As Long As You Want")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function HAHA8()
gg.toast("ACTIVATING CHEAT...")
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.toast("TYPE B")
gg.sleep(6500)
gg.searchNumber("12;1", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.alert("TYPE BBB")
gg.sleep(6500)
gg.refineNumber("12;3", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("500", gg.TYPE_DWORD)
gg.processResume()
  gg.toast("✅  NOW You Can Set your Name As Long As You Want")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
gg.clearResults()
end


function HAHA9()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setVisible(false)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.toast("Set Travel and Incline to the max. Then wait for a few seconds")
  gg.sleep(8000)
  gg.toast("Please wait . . .")
  gg.sleep(4000)
  gg.searchNumber("-10", gg.TYPE_FLOAT)
  gg.sleep(1000)
  gg.refineNumber("-10", gg.TYPE_FLOAT)
  gg.getResults(1000)
  gg.editAll("-40", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Open up Suspension and click Done")
  gg.sleep(5000)
  gg.toast("Almost there, Please wait")
  gg.searchNumber("0.30", gg.TYPE_FLOAT)
  gg.sleep(1000)
  gg.refineNumber("0.30", gg.TYPE_FLOAT)
  gg.getResults(250)
  gg.editAll("1", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setVisible(false)
  gg.toast("✅ Now open up Suspension and click Done")
gg.sleep(2000)
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function HAHA10()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("SET THE TRAVEL TO MAX AT THE LEFT SIDE AND INCLINE RIGHT SIDE AND MAX THE STIFFNESS IN LEFTSIDE AND OFFSET")
  gg.sleep(4000)
  gg.searchNumber("-10", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.sleep(3000)
  gg.editAll("-45", gg.TYPE_FLOAT)
  gg.toast("CLICK DONE AND RE OPEN THE SUSPENSION")
  gg.sleep(5000)
  gg.clearResults(100)
  gg.toast("YOU CAR IS NOW MAGIC CAMBER")
gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function HAHA11()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("Please Max the Travel in Right Side and the Stiffness Right Side Again and the last is Incline Right Side Again")
  gg.sleep(5000)
  gg.searchNumber("0.30", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.toast("ADJUST YOUR TRAVEL TO THE LEFT SIDE")
  gg.sleep(5000)
  gg.refineNumber("0.10", gg.TYPE_FLOAT)
  gg.getResults(6)
  gg.toast("ADJUST THE STIFFNESS TO THE LEFT SIDE")
  gg.sleep(5000)
  gg.editAll("-0.30", gg.TYPE_FLOAT)
  gg.clearResults(6)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function HAHA12()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("MAKE SURE BUY THE TRIPLE TURBO AND EXHAUST SHOT")
  gg.sleep(8000)
  gg.searchNumber("0.3", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("20", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("0.3", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("20", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("0.3", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("20", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("0.3", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("20", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.toast("GO TRY IN LOBBY ROOM")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function HAHA13()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.setVisible(false)
  gg.toast("GOTO SPECULAR CROME THEN...")
  gg.sleep(5000)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(3000)
  gg.searchNumber("1", gg.TYPE_FLOAT)
  gg.toast("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.toast("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.toast("⬇️ SLIDE DOWN ⬇️")
  gg.sleep(3000)
  gg.refineNumber("0", gg.TYPE_FLOAT)
  gg.toast("⬆️SLIDE UP⬆️")
  gg.sleep(3000)
  gg.refineNumber("1", gg.TYPE_FLOAT)
  gg.getResults(100)
  gg.editAll("22;50;31;-5", gg.TYPE_FLOAT)
  gg.clearResults(26)
  gg.toast("YOUR CAR NOW IS NEW CHROME")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function HAHA14()
gg.toast("ACTIVATING CHEAT...")
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("65000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("80000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("80000", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("1212", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.searchNumber("1212", gg.TYPE_FLOAT)
  gg.getResults(10000000)
  gg.editAll("65000", gg.TYPE_FLOAT)
  gg.clearResults(100)
  gg.toast("POPPING DANCE ACTIVATED")
  gg.sleep(2000)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function HAHA15()
gg.toast("ACTIVATING CHEAT...")
gg.sleep(2000)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4000", gg.TYPE_FLOAT)
  gg.getResults(9999999)
  gg.editAll("370000", gg.TYPE_FLOAT)
  gg.editAll("4000", gg.TYPE_FLOAT)
  gg.toast("ACTIVATED SUCCESSFULLY✅")
  gg.clearResults()
end

function HAHA16() -----public void SetBasicPlayerData(string playerName, int money, string localID) { }
LibStart=gg.getRangesList('libil2cpp.so')[2].start
KAITO=nil
KAITO={}
KAITO[1]={}
KAITO[2]={}
KAITO[1].address=LibStart+0x6050A1C
KAITO[1].value='h200080D2'
KAITO[1].flags=4
KAITO[2].address=LibStart+(0x6050A1C+0x4)
KAITO[2].value='hC0035FD6'
KAITO[2].flags=4
gg.setValues(KAITO)
gg.alert("SIGN OUT YOUR ACCOUNT THEN AFTER SIGN IN IT AGAIN","GHE LANG")
end
   
   
   
function M4()
BY = gg.choice({
 "🌐『𝙱𝚈𝙿𝙰𝚂𝚂 𝙰𝙻𝙻 𝚂𝙴𝚁𝚅𝙴𝚁』",
 "🌐『𝙱𝚈𝙿𝙰𝚂𝚂 𝚆𝙾𝚁𝙻𝙳 𝚂𝙰𝙻𝙴』",
  "✗𝐑𝐞𝐭𝐮𝐫𝐦✗"},nil,"👤:ᴋᴀɪᴛᴏ ᴄᴘᴍ \n🎮 :ᴄᴀʀ ᴘᴀʀᴋɪɴɢ ᴍᴜʟᴛɪᴘʟᴀʏᴇʀ \n🚗 :4.8.21.3\n≪━─━─━─━─◈─━─━─━─━≫\n                🌐𝗕𝗬𝗣𝗔𝗦𝗦           \n≪━─━─━─━─◈─━─━─━─━≫")
 
 if BY == nil then
   gg.toast("⚜️𝐊𝐀𝐈𝐓𝐎 𝐖𝐎𝐑𝐊𝐒⚜️")
   else
   
   if BY == 1 then
   PASS1()
   end 

   if BY == 2 then
   PASS2()
   end

   
   if BY == 3 then
   HOME()
   end
   
   end
   K2 = -1
   end
   
   function PASS1()----public static bool BlackCar() { }
gg.toast("ACTIVATING CHEAT...")
LibStart=gg.getRangesList('libil2cpp.so')[2].start
KAITO=nil
KAITO={}
KAITO[1]={}
KAITO[2]={}
KAITO[1].address=LibStart+0x3AD9BB4
KAITO[1].value='h000080D2'
KAITO[1].flags=4
KAITO[2].address=LibStart+(0x3AD9BB4+0x4)
KAITO[2].value='hC0035FD6'
KAITO[2].flags=4
gg.setValues(KAITO)
gg.alert("BYPASSED ALL SERVER=[ON]\n\nCheck Onnline Players.")
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end


function PASS2()---private bool IsWWEnabled(int coinLimit) { }
gg.toast("ACTIVATING CHEAT...")
LibStart=gg.getRangesList('libil2cpp.so')[2].start
KAITO=nil
KAITO={}
KAITO[1]={}
KAITO[2]={}
KAITO[1].address=LibStart+0x290CB90
KAITO[1].value='h200080D2'
KAITO[1].flags=4
KAITO[2].address=LibStart+(0x290CB90+0x4)
KAITO[2].value='hC0035FD6'
KAITO[2].flags=4
gg.setValues(KAITO)
gg.alert("BYPASSED WORD SALE=[ON]\n\nENTER LEVEL 1 THEN MENU!!")
gg.clearResults()
gg.toast("ACTIVATED SUCCESSFULLY✅")
end

 
 
 
 
function EXIT()
    print("◇───────◇───────◇")
    print("◇           𝑼𝑺𝑬𝑹 𝑰𝑵𝑭𝑶            ◇ ")
print("◇───────◇───────◇")
print("")
local K2 = gg.makeRequest("http://ip-api.com/json").content

local test = {
    country = "  ◇𝗖𝗢𝗨𝗡𝗧𝗥𝗬",
    regionName = "  ◇𝗥𝗘𝗚𝗜𝗢𝗡",
    isp = "  ◇𝗜𝗦𝗣"
}
for iv, testt in pairs(test) do
    local value = K2:match('"' .. iv .. '":"(.-)"')
    if value then
        print(testt .. ": " .. value)
    end
end

print("")
print("◇───────◇───────◇")
print("◇        𝑶𝑾𝑵𝑬𝑹  𝑰𝑵𝑭𝑶          ◇")
print("◇───────◇───────◇")
print("◇  𝑭𝑩: ᴋᴀɪᴛᴏ ᴡᴏʀᴋs            ◇")
print("◇ 𝑻𝑮: @unlikelines             ◇") 
print("◇───────◇───────◇")
print("◇   𝑮𝑹𝑶𝑼𝑷 & 𝑪𝑯𝑨𝑵𝑵𝑬𝑳   ◇")
print("◇───────◇───────◇")
print("")
print("◇───────────◇───────────◇")
print("◇ 𝑮𝑹- https://t.me/kaito_group              ◇")
print("◇ 𝑪𝑯- https://t.me/kaitofficialchannel  ◇")
print("◇───────────◇───────────◇")



os.exit()
main()
end

while true do
 if gg.isVisible(true) then
 K2 = 1
 gg.setVisible(false)
 end
 
 if K2 == 1 then
 HOME()
 end
 end