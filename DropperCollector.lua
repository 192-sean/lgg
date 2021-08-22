local CashValue = Script.Parent.Parent.Parent.Parent.Values.CashValue

script.Parent.Touched:Connect(function(Hit)
  if Hit.Name == "Part" and Hit:FindFirstChild("CashValue") then
    CashValue.Value += Hit:FindFirstChild("CashValue").Value
    Hit:Destroy()
  end
end)
