-- PARENT : SERVERSTORAGE
local Configurations = {}

local Instance_ = {}
local Functions = {}
local Settings = {}

Settings.GameDelayLoop = 2

Settings.IntermissionDelay = 5
Settings.RoundDelay = 5
Settings.RestartDelay = 5

Settings.MinimumPlayers = 1
Settings.MaximumPlayers = 2


Settings.AllowToChangeGameStateValue = true
Settings.AssetsFolderName = "Assets"

-- In-Game Functions

function Functions:Intermission()

end

function Functions:Round()

end

function Functions:Restart()

end

-- Instance_ : Create Folders and Values for the configuration

function Instance_:CreateNewGameValues()
	local GameStatusAssets = Instance.new("Folder", game.ReplicatedStorage)
	GameStatusAssets.Name = "GameStatusAssets"

	local GameStatusValue = Instance.new("StringValue", GameStatusAssets)
	GameStatusValue.Name = "GameStatus"
	GameStatusValue.Value = "Intermission"

	local GameTimerValue = Instance.new("NumberValue", GameStatusAssets)
	GameTimerValue.Name = "GameTimerValue"
	GameTimerValue.Value = 0
end

function Instance_:CreateNewAssetsFolder()
	local Folder = Instance.new("Folder", workspace)
	Folder.Name = Settings.AssetsFolderName
end

-- Adding them to the Configurations List

Configurations.Functions = Functions
Configurations.Settings = Settings
Configurations.Instance = Instance_

return Configurations
