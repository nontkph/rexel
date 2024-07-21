
task.wait(5)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local User = Players.LocalPlayer
local Libraries = loadstring(game:HttpGet("https://raw.githubusercontent.com/nontkph/Rexel-Hub/main/Libraries"))()
local ScreenObject = Libraries.new("Rexel Hum : Premium | TV Defense")

---: Save File
function ButtonClick(ButtonPath)
    for i,v in pairs ({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
	    for _i,_v in pairs(getconnections(ButtonPath[v])) do
		    print(_i, _v)
		    _v.Function()
	    end
    end
end

---: check Excutor Function
RunService = game:GetService("RunService")
VirtualUser = game:GetService('VirtualUser')
TeleportService = cloneref(game:GetService("TeleportService"))
--
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
PlaceId, JobId = game.PlaceId, game.JobId

---: auto Extutor
local TeleportCheck = false
Players.LocalPlayer.OnTeleport:Connect(function(State)
	if (not TeleportCheck) and queueteleport then
		warn("chck teleport")
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/nontkph/rexel/main/TvDefenseAuto.luau'))()")
	end
end)

---: Load File Reader
getfenv().Config = getfenv().Config or {
	AutoFarm = false,

	AutoQuest = false,
	AutoReplay = false,
    AutoSkip = false,
    HidedMultiPlayer = false,

    SetMasteryEnabled = false,
    SetMastery = "Mythic",
	Map = "GrassLand : Easy"
}

local PathConfig = `Rexel Hub/Tv Defense_{User.UserId/2}_Config.lua`
if not isfile("Rexel Hub") then makefolder("Rexel Hub") warn("Create new Folder") end
if not isfile(PathConfig) then 
	appendfile(PathConfig, HttpService:JSONEncode(getfenv().Config))
	warn("Create File Config.")
end

getfenv().Config = HttpService:JSONDecode( readfile(PathConfig) ) or getfenv().Config
getfenv().Loaded = true
repeat task.wait() until getfenv().Loaded and game.Loaded

function Change(index, value)
	getfenv().Config[index] = value
	writefile(PathConfig, HttpService:JSONEncode(getfenv().Config))
end

local LevelsCFrame = {
	["GrassLand : Easy"] = CFrame.new(-470.25412, 5.29621124, 857.966675, 0, 0, -1, 1, 0, 0, 0, -1, 0),
	["GrassLand : Normal"] = CFrame.new(-470.25412, 5.29621124, 835.589111, 0, 0, -1, 1, 0, 0, 0, -1, 0),
	["GrassLand : Hard"] = CFrame.new(-470.25412, 5.29621124, 813.733948, 0, 0, -1, 1, 0, 0, 0, -1, 0),

	["The Beach : Easy"] = CFrame.new(-470.450195, 5.59121132, 787.887085, 0, 0, -1, 1, 0, 0, 0, -1, 0),
	["The Beach : Normal"] = CFrame.new(-470.450195, 5.59121132, 765.744019, 0, 0, -1, 1, 0, 0, 0, -1, 0),
	["The Beach : Hard"] = CFrame.new(-470.450195, 5.59121132, 743.90564, 0, 0, -1, 1, 0, 0, 0, -1, 0),

	["Snow Land : Easy"] = CFrame.new(-470.583069, 5.60121155, 716.992676, 0, 0, -1, 1, 0, 0, 0, -1, 0),
	["Snow Land : Normal"] = CFrame.new(-470.583069, 5.60121155, 695.318237, 0, 0, -1, 1, 0, 0, 0, -1, 0),
	["Snow Land : Hard"] = CFrame.new(-470.956116, 5.60121155, 673.563171, 0, 0, 1, 1, 0, 0, 0, 1, 0),

	["Sakura Wall : Easy"] = CFrame.new(-427.995514, 5.31121254, 661.744751, 0, -1, 0, 1, 0, -0, 0, 0, 1),
	["Sakura Wall : Normal"] = CFrame.new(-406.433624, 5.31121254, 661.744751, 0, -1, 0, 1, 0, -0, 0, 0, 1),
	["Sakura Wall : Hard"] = CFrame.new(-384.997833, 5.31121254, 662.117859, 0, 1, 0, 1, 0, 0, 0, 0, -1),

	["The First War : Easy"] = CFrame.new(-356.7005, 5.31121254, 661.744751, 0, -1, 0, 1, 0, -0, 0, 0, 1),
	["The First War : Normal"] = CFrame.new(-335.138611, 5.31121254, 661.744751, 0, -1, 0, 1, 0, -0, 0, 0, 1),
	["The First War : Hard"] = CFrame.new(-313.70282, 5.31121254, 662.117859, 0, 1, 0, 1, 0, 0, 0, 0, -1),

	["Infected War : Easy"] = CFrame.new(-286.282837, 5.31121254, 661.744751, 0, -1, 0, 1, 0, -0, 0, 0, 1),
	["Infected War : Normal"] = CFrame.new(-264.123718, 5.31121254, 661.744751, 0, -1, 0, 1, 0, -0, 0, 0, 1),
	["Infected War : Hard"] = CFrame.new(-242.687943, 5.31121254, 662.117859, 0, 1, 0, 1, 0, 0, 0, 0, -1),

	["Songkran : Easy"] = CFrame.new(-197.900284, 5.51721191, 744.127869, 0, 1, 0, 1, 0, 0, 0, 0, -1),
	["Songkran : Normal"] = CFrame.new(-197.410538, 5.51421165, 765.32782, 0, 0, 1, 1, 0, 0, 0, 1, 0),
	["Songkran : Hard"] = CFrame.new(-197.410538, 5.51421165, 787.023926, 0, 0, 1, 1, 0, 0, 0, 1, 0),

	["Crystal Lab : Easy"] = CFrame.new(-197.43779, 5.75621223, 813.42688, 0, 0, 1, 1, 0, 0, 0, 1, 0),
	["Crystal Lab : Normal"] = CFrame.new(-197.43779, 5.75621223, 835.269226, 0, 0, 1, 1, 0, 0, 0, 1, 0),
	["Crystal Lab : Hard"] = CFrame.new(-197.43779, 5.75621223, 857.115967, 0, 0, 1, 1, 0, 0, 0, 1, 0),

	["Backroom : Easy"] = CFrame.new(-353.466827, 5.51421165, 738.295044, 0, 1, 0, 1, 0, 0, 0, 0, -1),
	["Backroom : Normal"] = CFrame.new(-375.655914, 5.51421165, 738.295044, 0, 1, 0, 1, 0, 0, 0, 0, -1),
	["Backroom : Hard"] = CFrame.new(-397.870941, 5.51421165, 737.921936, 0, -1, 0, 1, 0, -0, 0, 0, 1),
	["Backroom : Nightmare"] = CFrame.new(-420.604889, 5.51721191, 738.78479, 0, 0, -1, 1, 0, 0, 0, -1, 0),

	["Run for Your Lift : Easy"] = CFrame.new(-251.462936, 5.57568359, 737.492676, 0, 1, 0, 1, 0, 0, 0, 0, -1),
	["Run for Your Lift : Normal"] = CFrame.new(-273.652039, 5.57568359, 737.492676, 0, 1, 0, 1, 0, 0, 0, 0, -1),
	["Run for Your Lift : Hard"] = CFrame.new(-295.867065, 5.57568359, 737.119568, 0, -1, 0, 1, 0, -0, 0, 0, 1),
	["Run for Your Lift : Nightmare"] = CFrame.new(-318.601013, 5.57868576, 737.982422, 0, 0, -1, 1, 0, 0, 0, -1, 0),
}

local Levels = {
	"GrassLand : Easy",
	"GrassLand : Normal",
	"GrassLand : Hard",

	"The Beach : Easy",
	"The Beach : Normal",
	"The Beach : Hard",

	"Snow Land : Easy",
	"Snow Land : Normal",
	"Snow Land : Hard",

	"Sakura Wall : Easy",
	"Sakura Wall : Normal",
	"Sakura Wall : Hard",

	"The First War : Easy",
	"The First War : Normal",
	"The First War : Hard",

	"Infected War : Easy",
	"Infected War : Normal",
	"Infected War : Hard",

	"Songkran : Easy",
	"Songkran : Normal",
	"Songkran : Hard",

	"Crystal Lab : Easy",
	"Crystal Lab : Normal",
	"Crystal Lab : Hard",

	"Backroom : Easy",
	"Backroom : Normal",
	"Backroom : Hard",
	"Backroom : Nightmare",

	"Run for Your Lift : Easy",
	"Run for Your Lift : Normal",
	"Run for Your Lift : Hard",
	"Run for Your Lift : Nightmare",
}

local Pages = {
	["Main"] = ScreenObject:AddPage("Main"),
	["Misc"] = ScreenObject:AddPage("Misc"),
	["Config"] = ScreenObject:AddPage("Config"),
}

local Groups = {
	AutoFarm = Pages.Main:Group("Auto Farm"),
	ConfigFarm = Pages.Main:Group("Config Auto Farm", "Right"),
	Status = Pages.Main:Group("Status", "Right"),

	---:
	Misc = Pages.Misc:Group("Misc"),
}

local GetUnitsData : RemoteFunction = (ReplicatedStorage:FindFirstChild("Functions") or workspace):FindFirstChild("GetData") 
local Data = GetUnitsData and GetUnitsData:InvokeServer() or {}
local TowerModel = game:GetService("ReplicatedStorage"):FindFirstChild("Towers") 
local ValueMoney = game:GetService("Players").LocalPlayer:FindFirstChild("Gold") 

function SpawnUnit(Data : {}, TargetCFrame, Custom)
	local args = {
		[1] = Data[1],
		[2] = TargetCFrame or CFrame.new(-148.0830078125, 7.004042148590088, -176.78134155273438, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	}

	if Data[2] then
		args[4] = Custom or Data[2]
		args[5] = `{Data[1]} `.."{mastery:".. Data[2] .."}"
	end

	game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("SpawnTower"):InvokeServer(unpack(args))
end

local Blacklist = {
	["FARM"] = true,
	["SUPPORT"] = true,
}

local A : BasePart

function GetTarget()
	local Target, Distance = nil, math.huge
	for i, v in next, workspace:FindFirstChild("Mob", true):GetChildren() do
		pcall(function()
			local distance = (workspace:FindFirstChild("Base", true):FindFirstChild("Head").Position - v.HumanoidRootPart.Position).Magnitude 
			if distance and distance <= Distance then
				Target, Distance = v, distance
			end
		end)
	end

	return Target, Distance
end

function GetAllMastery()
    local result = {}

    for index, value in next, require(ReplicatedStorage.MasteryList) do
        table.insert(result, index)
    end

    return result
end

function UpgradeAll()
local ModelTower = workspace:FindFirstChild("Towers", true)
if not ModelTower then return end
    for index, value in next, ModelTower:GetChildren() do
    local Level = value:FindFirstChild("Level", true)
        if Level and Level.Value < 3 then
             local args = {
            [1] = value.Name,
            [2] = value.HumanoidRootPart.CFrame,
            [3] = value,
        }

        if value:FindFirstChild("Mastery", true) then
            args[4] = (value:FindFirstChild("Mastery", true) or Instance.new("StringValue")).Value
            args[5] = (value:FindFirstChild("OldName", true) or Instance.new("StringValue")).Value
        end

        game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("SpawnTower"):InvokeServer(unpack(args))
        end
    end
end


function GetQuest()
    local result = nil
    pcall(function()
        local PathQuest = game:GetService("Players").LocalPlayer["Quests"] or nil
        if PathQuest then
            for i, v in next, PathQuest:GetChildren() do 
                if v:IsA("Folder") and not v:FindFirstChild("Completed") then
                        result = v.Name
                    break
                end
            end
        end

        if result then
            for index, value in next, Levels do
            local Spil = string.split(value, " ") or {"haha"}
                if string.match(result:lower(), Spil[1]:lower()) and string.find(value:lower(), "easy") then
                    result = value
                    break
                end
            end
        end
    end)
    return result
end

local EndScreen : Frame = (game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("GameGui") or workspace ) :FindFirstChild("EndScreen")
local NumberOfPlayer = #Players:GetPlayers() or 0

---: Auto Farm Config
Groups.ConfigFarm:label("Auto Farm : Fully")
Groups.AutoFarm:Toggle("Auto Farm", getfenv().Config.AutoFarm, function(bool : boolean)

	---: Set Value
	Change("AutoFarm", bool)

	---: Active
	if getfenv().Config.AutoFarm then
		task.defer(function()
			repeat task.wait() 
				local MapSelection = getfenv().Config.Map
				---: check map selection
				if MapSelection and LevelsCFrame[MapSelection] then
					pcall(function()
						if game.PlaceId == 14809035044 then
							---: lobby Loader
                            local CurrentQuest = GetQuest()
                            if CurrentQuest and getfenv().Config.AutoQuest and LevelsCFrame[CurrentQuest] then
                                User.Character.HumanoidRootPart.CFrame = LevelsCFrame[CurrentQuest]
                                else
                               -- print("i dont have a quest : ", CurrentQuest)
                                User.Character.HumanoidRootPart.CFrame = LevelsCFrame[MapSelection]
                            end
						else
							---: Game PLay Auto
							pcall(function()

                                EndScreen = EndScreen or game:GetService("Players").LocalPlayer.PlayerGui.GameGui.EndScreen
                                if EndScreen and EndScreen:IsA("Frame") and EndScreen.Visible then
                                    if getfenv().Config.AutoReplay then
                                        ButtonClick(EndScreen.Content.ReplayButton)
                                        else
                                        ButtonClick(EndScreen.Content.LeaveButton)
                                    end
                                end

                                ---: auto skip
                                if getfenv().Config.AutoSkip then
                                    if game:GetService("Players").LocalPlayer.PlayerGui.GameGui.SkipWave.Yes.BackgroundColor3 ~= Color3.fromRGB(140, 208, 95) then
                                       pcall(function()
                                            ButtonClick( game:GetService("Players").LocalPlayer.PlayerGui.GameGui.SkipWave.Yes )
                                       end)
                                    end
                                end

                                ---: Hide my Chaarcter 
                                if getfenv().Config.HidedMultiPlayer and NumberOfPlayer > 1 then
                                    User.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100000, 0)
                                end

								for i, v in ipairs(Data.SelectedTowers) do
									task.defer(function()
                                    local Formath = string.split(v, " {")
									local Mastery = nil

									if Formath[2] then
										local masteryPart = string.split(Formath[2], ":")
										Mastery = string.gsub(masteryPart[2], "}", "")
									end

									local model = TowerModel:FindFirstChild(Formath[1])
									if model then
										local Config = model:FindFirstChild("Config")
										if Config and Config:FindFirstChild("Type") and Config:FindFirstChild("Price") and not Blacklist[Config:FindFirstChild("Type").Value] then
											if ValueMoney.Value >= Config:FindFirstChild("Price").Value then
												local Target = GetTarget()
												if Target then
													SpawnUnit(
														{
															Formath[1],
															Mastery,
														},
														Target.HumanoidRootPart.CFrame,
                                                        getfenv().Config.SetMastery
													)
												end
											end
										end
									end
                                    end)
								end
                                pcall(UpgradeAll)
                            end)
						end
					end)
				end
			until not getfenv().Config.AutoFarm
		end)
	end
end)
Groups.ConfigFarm:DropDown( "Select Level", Levels, false, getfenv().Config.Map or "GrassLand : Easy", function(LevelSelection : string)
	Change("Map", LevelSelection)
end)
Groups.ConfigFarm:Toggle( "Set Mastery", getfenv().Config.SetMasteryEnabled or false, function(Bool : string)
	Change("SetMasteryEnabled", Bool)
end)
Groups.ConfigFarm:DropDown( "Select Mastery", GetAllMastery(), false, getfenv().Config.SetMastery or "Mythic", function(SelectMastery : string)
    Change("SetMastery", SelectMastery)
end)
Groups.ConfigFarm:Toggle("Auto Quest", getfenv().Config.AutoQuest, function(bool : boolean)
	---: Set Value
	Change("AutoQuest", bool)
end)
Groups.ConfigFarm:Toggle("Auto Replay", getfenv().Config.AutoReplay, function(bool : boolean)
	---: Set Value
	Change("AutoReplay", bool)
end)
Groups.ConfigFarm:Toggle("Auto Skip", getfenv().Config.AutoSkip, function(bool : boolean)
	---: Set Value
	Change("AutoSkip", bool)
end)
Groups.ConfigFarm:Toggle("ซ่อนตัวถ้ามีคนเล่นเยอะ", getfenv().Config.HidedMultiPlayer, function(bool : boolean)
	---: Set Value
	Change("HidedMultiPlayer", bool)
end)
---: Misc
function RedeemCode(code)
	local args = {
		[1] = "REDEEM CODE",
		[2] = code,
	}
	ReplicatedStorage:WaitForChild("CodesReplicatedStorage"):WaitForChild("CodeEvent"):FireServer(unpack(args))
end

Groups.Misc:Button("Redeem All Code [ auto update ]", function()
	local Codes = require(ReplicatedStorage.CodesReplicatedStorage.CodesModule)
	for index, value in next, Codes do
		RedeemCode(index)
	end
end)

