local DropperPartsFolder = script.Parent.Parent.Parent.DropperParts

while wait(2) do
  local NewPart = Instance.new("Part", DropperPartsFolder)
  NewPart.Position = script.Parent.SpawnPart.Position
  NewPart.Size = Vector3.new(1,1,1)

  local CashValue = Instance.new("NumberValue", NewPart)
  CashValue.Value = 1 --- Value for Cash given
  CashValue.Name = "CashValue"
end
