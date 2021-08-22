--- Variables ---

local TycoonModel = script.Parent.Parent
local items = {}

local BoughtItems = TycoonModel:FindFirstChild("BoughtItems")
local Buttons = TycoonModel:FindFirstChild("Buttons")
local DropperParts = TycoonModel:FindFirstChild("DropperParts")
local MainItems = TycoonModel:FindFirstChild("MainItems")
local Scripts = TycoonModel:FindFirstChild("Scripts")
local Values = TycoonModel:FindFirstChild("Values")

--- Owner Functions ---

Mainitems.OwnerDoor.MainDoor.Touched:Connect(function(Hit)
  if Hit.Parent:FindFirstChild("Humanoid") and Values.OwnerValue.Value == nil then
    local Player = game.Players:GetPlayerFromCharacter(hit.Parent)
    Values.OwnerValue.Value = Player
    MainItems.OwnerDoor.MainDoor.SurfaceGui.TextLabel.Text = Player.Name.." Tycoon"
  end
end)

--- Buying Functions ---

for i, v in pairs(Buttons:GetChildren()) do
  local NewItem = BoughtItems:FindFirstChild(v.Item.Value)
  if NewItem ~= nil then
    Items[NewItem.Name] = NewItem:Clone()
    NewItem:Destroy()
  else
    v.ButtonPart.Transparency = 1
    v.ButtonPart.CanCollide = false
  end

  if v:FindFirstChild("Dependency") then
    coroutine.resume(coroutine.create(function)
        v.ButtonPart.Transparency = 1
        v.ButtonPart.CanCollide = false
        if BoughItems:WaitForChild(v.Dependency.Value, 100000)then
          v.ButtonPart.Transparency = 0
          v.ButtonPart.CanCollide = true 
        end
    end))
  end

  v.ButtonPart.Touched:Connect(function(Hit)
    if Hit.Parent:FindFirstChild("Humanoid")then
      local Player = game.Players:GetPlayerFromCharacter(Hit.Parent)
      if Values.OwnerValue.Value == Player then
        if v.ButtonPart.CanCollide == true and v.ButtonPart.Transparency == 0 then
          if Player:WaitForChild("leaderstats").Cash.Value >= v.Price.Value then
            Player.leaderstats.Cash.Value -= v.Price.Value
            Items[v.Item.Value].Parent = BoughtItems
            v.Destroy()
          end
        end
      end
    end
  end)
end

--- Cash Functions ---

local Debounce = false

MainItems.CashButton.ButtonPart.Touched:Connect(function(Hit)
  if Hit.Parent:FindFirstChild("Humainoid") then
    local Player = game.Players:GetPlayerFromCharacter(Hit.Parent)
    if value.OwnerValue.Value == Player then
      if Debounce == false then
        Debounce = true
        Player:WaitForChild("leaderstats").Cash.Value += Values.CashValue.Value
        wait()
        Values.CashValue.Value = 0
        wait()
        Debounce = false
      end
    end
  end
end)

while wait() do 
  MainItems.CashButton.ScreenPart.SurfaceGui.TextLabel.Text = Values.CashValue.Value
end
