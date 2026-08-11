local PlayerUtils = {}

local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer

function PlayerUtils.getLocalPlayer()
  return localPlayer
end

function PlayerUtils.getChar(player, timeout)
  if not player or not player:IsA("Player") then return nil end
  timeout = timeout or 5

  local char = player.Character
  if char then return char end

  local success, result = pcall(function()
    return player.CharacterAdded:Wait(timeout)
  end)

  return success and result or nil
end
function PlayerUtils.getHRP(player)
  if not player then return end

  local char = PlayerUtils.getChar(player)
  if not char then return end

  local hrp = char:FindFirstChild("HumanoidRootPart")
  return hrp
end
function PlayerUtils.getHumanoid(player)
  if not player then return end

  local char = PlayerUtils.getChar(player)
  if not char then return end

  local hum = char:FindFirstChildOfClass("Humanoid")
  return hum
end
function PlayerUtils.getTeam(player)
  if not player or not player:IsA("Player") then
    return nil
  end
  
  local team = player.Team
  if not team then return nil end
  
  return team
end

function PlayerUtils.getHead(player)
  if not player or not player:IsA("Player") then
    return nil
  end
  
  local char = PlayerUtils.getChar(player)
  if not char then return nil end
  
  local head = char:FindFirstChild("Head")
  if not head or not head:IsA("BasePart") then
    return nil
  end
  
  return head
end

return PlayerUtils