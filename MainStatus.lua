-- PARENT : SERVERSCRIPTSERVICE
local ServerStorage = game:GetService("ServerStorage")
local Configurations = require(ServerStorage:WaitForChild("Configurations"))
local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Settings = Configurations.Settings
local Functions = Configurations.Functions
local Instances = Configurations.Instance

Instances.CreateNewGameValues()

wait(1.5)

local GameStatusAssetsFolder = ReplicatedStorage:WaitForChild("GameStatusAssets")
local GameStatusValue = GameStatusAssetsFolder:WaitForChild("GameStatus")
local GameTimerValue = GameStatusAssetsFolder:WaitForChild("GameTimerValue")

-- Creating a while loop to keep the GameStatus active/running
while wait() do
	GameStatusValue.Value = "Intermission"
	GameTimerValue.Value = 0
	-- Waiting until the amount of delay there is just in case if a player is joining
	wait(Settings.GameDelayLoop)
	-- Checking if the minimum players are higher or equal to the value
	if (Players.NumPlayers >= Settings.MinimumPlayers and Players.NumPlayers <= Settings.MaximumPlayers) then
		
	else
		return
	end
	-- Starting the actual game loop
	-- Checking if the GameStatus is equal to Intermission, so just in case in ServerSide Scripts
	if GameStatusValue.Value == "Intermission" then
		Functions.Intermission()
		for i = Settings.IntermissionDelay, 0, -1 do
			wait(1)
			GameTimerValue.Value = i
			print(i)
		end
		GameStatusValue.Value = "Round"
	end
	
	if GameStatusValue.Value == "Round" then
		Instances.CreateNewAssetsFolder()
		wait(1)
		Functions.Round()
		for i = Settings.RoundDelay, 0, -1 do
			wait(1)
			GameTimerValue.Value = i
			print(i)
		end
		GameStatusValue.Value = "Restart"
	end
	
	if GameStatusValue.Value == "Restart" then
		Functions.Restart()
		workspace[Settings.AssetsFolderName]:Destroy()
		for i = Settings.RoundDelay, 0, -1 do
			wait(1)
			GameTimerValue.Value = i
			print(i)
		end
		GameStatusValue.Value = "Intermission"
	end
end
